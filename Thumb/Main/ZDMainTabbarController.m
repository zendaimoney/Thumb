//
//  ZDMainTabbarController.m
//  Thumb
//
//  Created by peter on 14/11/10.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDMainTabbarController.h"
#import "ZDFinancialTableViewController.h"
#import "ZDMyAccountTableViewController.h"
#import "ZDSettingTableViewController.h"

@interface ZDMainTabbarController ()

@end

@implementation ZDMainTabbarController

- (void)awakeFromNib
{
    UIStoryboard *storyboard1 = [UIStoryboard storyboardWithName:@"StoryboardOne" bundle:nil];
    UIStoryboard *storyboard2 = [UIStoryboard storyboardWithName:@"StoryboardTwo" bundle:nil];
    UIStoryboard *storyboard3 = [UIStoryboard storyboardWithName:@"StoryboardThree" bundle:nil];
    
    UINavigationController *nav1 = [storyboard1 instantiateViewControllerWithIdentifier:@"storyBoardOneNav"];
    UINavigationController *nav2 = [storyboard2 instantiateViewControllerWithIdentifier:@"storyBoardTwoNav"];
    UINavigationController *nav3 = [storyboard3 instantiateViewControllerWithIdentifier:@"storyBoardThreeNav"];
    
    self.viewControllers = @[nav1,nav2,nav3];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
