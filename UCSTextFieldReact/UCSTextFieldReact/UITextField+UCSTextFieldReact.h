//
//  UITextField+UCSTextFieldReact.h
//  UCSTextFieldReact
//
//  Created by Luzz on 2017/8/22.
//  Copyright © 2017年 UCS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (UCSTextFieldReact)


/**
 *  block observation
 */
@property(nonatomic,copy)void(^ucs_textChangeHandler)(NSString *text);

/**
 *  selector observation
 */
-(void)ucs_bindTextReactHandler:(id)handler andSelector:(SEL)handlerSelector;


-(void)resignReactive;


@end
