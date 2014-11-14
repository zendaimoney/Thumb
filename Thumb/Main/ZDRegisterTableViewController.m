//
//  ZDRegisterTableViewController.m
//  Thumb
//
//  Created by lucy on 14-11-13.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDRegisterTableViewController.h"
#import "SSFShowSimpleAlert.h"
#define DefaultMaxLength   11
@interface ZDRegisterTableViewController ()<UITextFieldDelegate>

@end

@implementation ZDRegisterTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    _errorOrRightImg1.hidden = YES;
    _errorOrRightImg2.hidden = YES;
}

- (BOOL)checkParam{
    if (!self.phoneNumTfd.text.length) {
        [SSFShowSimpleAlert showSimpleAlertWithTitle:@"" message:@"手机号不能为空"];
        return NO;
    } else if(!self.checkCodeTfd.text.length){
        [SSFShowSimpleAlert showSimpleAlertWithTitle:@"" message:@"验证码不能为空"];
        return NO;
    } else if(!self.passwordTfd.text.length){
        [SSFShowSimpleAlert showSimpleAlertWithTitle:@"" message:@"密码不能为空"];
        return NO;
    } else return YES;
}

#pragma mark - Actions

- (IBAction)tapGesturePressed:(id)sender
{
    [self.view endEditing:YES];
}

#pragma mark - UITextFiel Delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (textField == self.phoneNumTfd) {
        self.errorOrRightImg1.hidden = NO;
        if (!newString.length) {
            self.errorOrRightImg1.hidden = YES;
            return YES;
        } else if (newString.length < DefaultMaxLength) {
            self.errorOrRightImg1.image = [UIImage imageNamed:@"ico_error"];
            return YES;
        } else {
            textField.text = [newString substringToIndex:DefaultMaxLength];
            self.errorOrRightImg1.image = [UIImage imageNamed:@"ico_right"];
            return NO;
        }
    } else if (textField == self.passwordTfd) {
        if (newString.length) {
            self.errorOrRightImg2.hidden = NO;
        } else {
            self.errorOrRightImg2.hidden = YES;
        }
        return YES;
    } else return YES;
}

@end
