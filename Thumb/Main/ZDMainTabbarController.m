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
#import "ZDLoginViewController.h"

@interface ZDMainTabbarController ()<UITabBarControllerDelegate,ZDLoginViewControllerDelegate>

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
    
    [self setCustomTabbar];
}

- (void)setCustomTabbar
{
    for (int i = 0; i < self.tabBar.items.count; i++) {
        UITabBarItem *barItem = self.tabBar.items[i];
        switch (i) {
            case 0:
                barItem.title = @"我的理财";
                barItem.image = [[UIImage imageNamed:@"ico_bottom_fortune"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                barItem.selectedImage = [[UIImage imageNamed:@"ico_bottom_fortune_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                break;
            case 1:
                barItem.title = @"我的账户";
                barItem.image = [[UIImage imageNamed:@"ico_bottom_account"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                barItem.selectedImage = [[UIImage imageNamed:@"ico_bottom_account_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
                break;
            case 2:
                barItem.title = @"设置";
                barItem.image = [[UIImage imageNamed:@"icon_bottom_about"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                barItem.selectedImage = [[UIImage imageNamed:@"icon_bottom_about_on"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                break;
            default:
                break;
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}

#pragma mark - tabbar delegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    UINavigationController *nav = (UINavigationController *)viewController;
    if ([[nav.viewControllers firstObject] isKindOfClass:[ZDMyAccountTableViewController class]]) {
        NSString *userName = [[NSUserDefaults standardUserDefaults] objectForKey:DefaultUserNameKey];
        if (userName.length) {
            return YES;
        } else return NO;
    } else return YES;
}
   
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if ([item.title isEqualToString:@"我的账户"]) {
        NSString *userName = [[NSUserDefaults standardUserDefaults] objectForKey:DefaultUserNameKey];
//        NSString *userPassword = [[NSUserDefaults standardUserDefaults] objectForKey:DefaultUserPasswordKey];
        if (!userName.length) {
            //未登陆
            UINavigationController *loginNavigation = [self.storyboard instantiateViewControllerWithIdentifier:@"loginNavigation"];
            ZDLoginViewController *loginViewController = (ZDLoginViewController *)[[loginNavigation viewControllers] firstObject];
            loginViewController.delegate = self;
            [self presentViewController:loginNavigation animated:YES completion:NULL];
        }
    }
}

#pragma mark - ZDLoginViewControllerDelegate

- (void)loginViewControllerDidLoginSuccess:(ZDLoginViewController *)controller
{
    self.selectedIndex = 1;
    [self.presentedViewController dismissViewControllerAnimated:YES completion:NULL];
}

@end
