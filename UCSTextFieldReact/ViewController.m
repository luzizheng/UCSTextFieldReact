//
//  ViewController.m
//  UCSTextFieldReact
//
//  Created by Luzz on 2017/8/22.
//  Copyright © 2017年 UCS. All rights reserved.
//

#import "ViewController.h"
#import "UCSTextFieldReact/UCSTextFieldReact.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tf;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tf.ucs_textChangeHandler = ^(NSString *text) {
        NSLog(@"text = %@",text);
    };
//    [self.tf ucs_bindTextReactHandler:self andSelector:@selector(handleValueChanging:andTextField:)];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationItem.title = [NSString stringWithFormat:@"%d",(int)self.navigationController.viewControllers.count];
}
-(void)handleValueChanging:(NSString *)text andTextField:(UITextField *)textField
{
    NSLog(@"text = %@",text);
    self.label.text = text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnAction:(id)sender {
    
    self.tf.text = [NSString stringWithFormat:@"%d",(int)arc4random()%5];
}


- (IBAction)nextPage:(id)sender {
    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"abc"] animated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.tf resignFirstResponder];
}
@end
