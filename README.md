## Installation:

pod 'UCSTextFieldReact'

*or*

pod "UCSTextFieldReact", :git => 'http://172.17.16.23:3000/Luzz/UCSTextFieldReact.git'

## Usage:

*import UCSTextFieldReact.h*

***use block***

​    `self.textField.ucs_textChangeHandler = ^(NSString *text) {`

​        `NSLog(@"text = %@",text);`

​    `};`

***use selector***

`[self.textField ucs_bindTextReactHandler:self andSelector:@selector(handleValueChanging:andTextField:)];`

`-(void)handleValueChanging:(NSString *)text andTextField:(UITextField *)textField`

`{`

​    `NSLog(@"text = %@",text);`

`}`