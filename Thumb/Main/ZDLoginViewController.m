//
//  ZDLoginViewController.m
//  Thumb
//
//  Created by peter on 14/11/13.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDLoginViewController.h"
#import "AllCustomerCategoryHeaders.h"

@interface ZDLoginViewController ()

@end

@implementation ZDLoginViewController


- (IBAction)loginButtonPressed:(id)sender {
    [self.view endEditing:YES];
    if ([self checkUserNameAndUserPassword]) {
        
        [[NSUserDefaults standardUserDefaults] setObject:self.loginPhoneTfd.text forKey:DefaultUserNameKey];
        [[NSUserDefaults standardUserDefaults] setObject:self.loginPasswordTfd.text forKey:DefaultUserPasswordKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [self.delegate loginViewControllerDidLoginSuccess:self];
    }
}

- (IBAction)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)registerButtonPressed:(id)sender {
}

- (BOOL)checkUserNameAndUserPassword
{
    if (!self.loginPhoneTfd.text.length) {
        [SSFShowSimpleAlert showSimpleAlertWithTitle:@"" message:@"用户名不能为空"];
        return NO;
    } else if (!self.loginPasswordTfd.text.length) {
        [SSFShowSimpleAlert showSimpleAlertWithTitle:@"" message:@"密码不能为空"];
        return NO;
    } else return YES;
}

#pragma mark - properties

- (void)setLoginView:(UIView *)loginView
{
    _loginView = loginView;
    _loginView.layer.borderWidth = 0.5;
    _loginView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
}


- (void)setRegisterBtn:(UIButton *)registerBtn
{
    _registerBtn = registerBtn;
    _registerBtn.layer.borderWidth = 0.5;
    _registerBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

@end
