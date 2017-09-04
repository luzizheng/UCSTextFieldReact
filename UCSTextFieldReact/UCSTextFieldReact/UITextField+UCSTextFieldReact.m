//
//  UITextField+UCSTextFieldReact.m
//  UCSTextFieldReact
//
//  Created by Luzz on 2017/8/22.
//  Copyright © 2017年 UCS. All rights reserved.
//

#import "UITextField+UCSTextFieldReact.h"
#import <objc/runtime.h>

typedef void(^kUCSTextFieldReactBlock)(NSString * text);

@implementation UITextField (UCSTextFieldReact)
static char kUCSTextFieldReactHandlerKey;
static char kUCSTextFieldReactSelectorKey;
static char kUCSTextFieldReactBlockKey;
static char kUCSTextFieldReactAddOberserFlagKey;
@dynamic ucs_textChangeHandler;


-(void)resignReactive
{
    [self ucs_removeObserver];
}
-(void)ucs_addObserver
{
    __weak typeof(self)weakSelf = self;
    [self addObserver:weakSelf forKeyPath:@"text" options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew context:nil];
    [[NSNotificationCenter defaultCenter] addObserver:weakSelf selector:@selector(ucs_handleTextFieldReact:) name:UITextFieldTextDidChangeNotification object:self];
    
    // set flag
    objc_setAssociatedObject(self, &kUCSTextFieldReactAddOberserFlagKey, [NSNumber numberWithBool:YES], OBJC_ASSOCIATION_ASSIGN);
}

-(void)ucs_removeObserver
{
    
    id flag = objc_getAssociatedObject(self, &kUCSTextFieldReactAddOberserFlagKey);
    if (flag) {
        if ([flag boolValue]) {
            [self removeObserver:self forKeyPath:@"text"];
            [[NSNotificationCenter defaultCenter] removeObserver:self];
            objc_setAssociatedObject(self, &kUCSTextFieldReactAddOberserFlagKey, [NSNumber numberWithBool:NO], OBJC_ASSOCIATION_ASSIGN);
        }
    }
    
    
}



-(void)setUcs_textChangeHandler:(void (^)(NSString *))ucs_textChangeHandler
{
    if (ucs_textChangeHandler) {
        objc_setAssociatedObject(self, &kUCSTextFieldReactBlockKey, ucs_textChangeHandler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [self ucs_addObserver];
}


-(void)ucs_bindTextReactHandler:(id)handler andSelector:(SEL)handlerSelector;
{
    
    objc_setAssociatedObject(self, &kUCSTextFieldReactHandlerKey, handler, OBJC_ASSOCIATION_ASSIGN);
    objc_setAssociatedObject(self, &kUCSTextFieldReactSelectorKey, NSStringFromSelector(handlerSelector), OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    [self ucs_addObserver];
}


-(void)ucs_handleTextFieldReact:(id)sender
{
    id target = objc_getAssociatedObject(self, &kUCSTextFieldReactHandlerKey);
    NSString * selectorName = objc_getAssociatedObject(self, &kUCSTextFieldReactSelectorKey);
    kUCSTextFieldReactBlock block = (objc_getAssociatedObject(self, &kUCSTextFieldReactBlockKey));
    if (block) {
        block(self.text);
    }

    if (!target || !selectorName ||!(selectorName.length>0)) {
        return;
    }
    
    if (![target respondsToSelector:NSSelectorFromString(selectorName)]) {
        return;
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    if ([sender isKindOfClass:[NSNotification class]]) {
        [target performSelector:NSSelectorFromString(selectorName) withObject:self.text withObject:self];
    }else if([sender isKindOfClass:[NSString class]]){
        [target performSelector:NSSelectorFromString(selectorName) withObject:sender withObject:self];

    }
#pragma clang diagnostic pop
    
}

// 只能监听代码改动textfield的值
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"text"] && object == self) {
        [self ucs_handleTextFieldReact:self.text];
    }
    
}



@end
