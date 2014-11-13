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
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *userPasswordTextField;

@end

@implementation ZDLoginViewController

- (IBAction)loginButtonPressed:(id)sender {
    [self.view endEditing:YES];
    if ([self checkUserNameAndUserPassword]) {
        
        [[NSUserDefaults standardUserDefaults] setObject:self.userNameTextField.text forKey:DefaultUserNameKey];
        [[NSUserDefaults standardUserDefaults] setObject:self.userPasswordTextField.text forKey:DefaultUserPasswordKey];
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
    if (!self.userNameTextField.text.length) {
        [SSFShowSimpleAlert showSimpleAlertWithTitle:@"" message:@"用户名不能为空"];
        return NO;
    } else if (!self.userPasswordTextField.text.length) {
        [SSFShowSimpleAlert showSimpleAlertWithTitle:@"" message:@"密码不能为空"];
        return NO;
    } else return YES;
}

@end
