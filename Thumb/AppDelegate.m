//
//  AppDelegate.m
//  Thumb
//
//  Created by peter on 14/11/10.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setNavigationBarAndTabbar];
    return YES;
}

#pragma mark - nav and tabbar appearence

- (void)setNavigationBarAndTabbar
{
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSForegroundColorAttributeName:[UIColor colorWithRed:250/255.0 green:92/255.0 blue:87/255.0 alpha:1.0]} forState:UIControlStateSelected];
}

@end
