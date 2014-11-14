//
//  ZDLoginViewController.h
//  Thumb
//
//  Created by peter on 14/11/13.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import <UIKit/UIKit.h>
#define DefaultUserNameKey   @"userNameKey"
#define DefaultUserPasswordKey   @"userPasswordKey"

@protocol ZDLoginViewControllerDelegate;
@interface ZDLoginViewController : UIViewController

@property (weak,nonatomic) id <ZDLoginViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UITextField *loginPhoneTfd;
@property (weak, nonatomic) IBOutlet UITextField *loginPasswordTfd;

@end

@protocol ZDLoginViewControllerDelegate <NSObject>

- (void)loginViewControllerDidLoginSuccess:(ZDLoginViewController *)controller;

@end