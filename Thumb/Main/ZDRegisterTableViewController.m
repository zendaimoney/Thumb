//
//  ZDRegisterTableViewController.m
//  Thumb
//
//  Created by lucy on 14-11-13.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDRegisterTableViewController.h"
#define DefaultMaxLength   11
#define IdCardLength 18
@interface ZDRegisterTableViewController ()<UITextFieldDelegate>

@end

@implementation ZDRegisterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _errorOrRightImg1.hidden = YES;
    _errorOrRightImg2.hidden = YES;
    _errorOrRightImg3.hidden = YES;
}

- (void)checkParam{
    if (_phoneNumTfd == nil || [_phoneNumTfd.text isEqualToString:@""]) {
        return;
    } else if(_checkCodeTfd == nil || [_checkCodeTfd.text isEqualToString:@""]){
        return;
    } else if(_passwordTfd == nil || [_passwordTfd.text isEqualToString:@""]){
        return;
    }
}

#pragma mark - UITextFielDelegate

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
    } else if(textField == self.idCardNumTfd){
        self.errorOrRightImg3.hidden = NO;
        if (!newString.length) {
            self.errorOrRightImg3.hidden = YES;
            return YES;
        } else if (newString.length < IdCardLength){
            self.errorOrRightImg3.image = [UIImage imageNamed:@"ico_error"];
            return YES;
        } else {
            textField.text = [newString substringToIndex:IdCardLength];
            self.errorOrRightImg3.image = [UIImage imageNamed:@"ico_right"];
            return NO;
        }
    } else return YES;
}

@end
