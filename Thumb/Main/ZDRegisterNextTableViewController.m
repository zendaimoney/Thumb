//
//  ZDRegisterNextTableViewController.m
//  Thumb
//
//  Created by lucy on 14-11-14.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDRegisterNextTableViewController.h"
#import "SSFShowSimpleAlert.h"
#define IDCardNumLength 18
@interface ZDRegisterNextTableViewController ()

@end

@implementation ZDRegisterNextTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (BOOL)checkParam{
    if (!self.userNameTfd.text.length) {
        [SSFShowSimpleAlert showSimpleAlertWithTitle:@"" message:@"手机号不能为空"];
        return NO;
    } else if(!self.IDCardNumTfd.text.length){
        [SSFShowSimpleAlert showSimpleAlertWithTitle:@"" message:@"验证码不能为空"];
        return NO;
    } else return YES;
}

#pragma mark - UITextFiel Delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if(textField == self.IDCardNumTfd){
        if (!newString.length) {
            return YES;
        } else if (newString.length < IDCardNumLength){
            return YES;
        } else {
            textField.text = [newString substringToIndex:IDCardNumLength];
            return NO;
        }
    } else return YES;
}

@end
