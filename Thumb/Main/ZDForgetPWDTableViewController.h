//
//  ZDForgetPWDTableViewController.h
//  Thumb
//
//  Created by lucy on 14-11-14.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDForgetPWDTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTfd;
@property (weak, nonatomic) IBOutlet UITextField *checkCodeTfd;
@property (weak, nonatomic) IBOutlet UITextField *passwordTfd;
@property (weak, nonatomic) IBOutlet UIImageView *errorOrRightImg1;
@property (weak, nonatomic) IBOutlet UIImageView *errorOrRightImg2;

@end
