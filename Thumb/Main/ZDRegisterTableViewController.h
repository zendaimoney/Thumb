//
//  ZDRegisterTableViewController.h
//  Thumb
//
//  Created by lucy on 14-11-13.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDRegisterTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTfd;
@property (weak, nonatomic) IBOutlet UITextField *checkCodeTfd;
@property (weak, nonatomic) IBOutlet UITextField *passwordTfd;
@property (weak, nonatomic) IBOutlet UIImageView *errorOrRightImg1;
@property (weak, nonatomic) IBOutlet UIImageView *errorOrRightImg2;

@property (weak, nonatomic) IBOutlet UITextField *userNameTfd;
@property (weak, nonatomic) IBOutlet UITextField *idCardNumTfd;
@property (weak, nonatomic) IBOutlet UIImageView *errorOrRightImg3;

@end
