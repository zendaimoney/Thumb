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

@end

@protocol ZDLoginViewControllerDelegate <NSObject>

- (void)loginViewControllerDidLoginSuccess:(ZDLoginViewController *)controller;

@end