//
//  ZDForgetPWDTableViewController.m
//  Thumb
//
//  Created by lucy on 14-11-14.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDForgetPWDTableViewController.h"
#define PhoneNumLength 11
@interface ZDForgetPWDTableViewController ()

@end

@implementation ZDForgetPWDTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.errorOrRightImg1.hidden = YES;
    self.errorOrRightImg2.hidden = YES;
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
        } else if (newString.length < PhoneNumLength) {
            self.errorOrRightImg1.image = [UIImage imageNamed:@"ico_error"];
            return YES;
        } else {
            textField.text = [newString substringToIndex:PhoneNumLength];
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
