//
//  ZDAboutUsTableViewController.m
//  Thumb
//
//  Created by lucy on 14-11-12.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDAboutUsTableViewController.h"
#import "MBProgressHUD.h"
#import "ZDWebViewController.h"

#define VERSION_URL @""
#define INSTALL_URL @""

@interface ZDAboutUsTableViewController ()

@end

@implementation ZDAboutUsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _versionLab.text = [NSString stringWithFormat:@"V %@", [self currentAppVersion]];
    
}

- (NSString *)currentAppVersion
{
    NSDictionary* info = [[NSBundle mainBundle] infoDictionary];
    return info[@""];
}

- (void)haveNewVersion
{
    [[UIApplication sharedApplication]
     openURL:[NSURL URLWithString:INSTALL_URL]];
}

- (void)noHaveNewVersion
{
    [[[UIAlertView alloc] initWithTitle:@""
                                message:@"已是最新版本"
                               delegate:nil
                      cancelButtonTitle:@"确定"
                      otherButtonTitles:nil] show];
}

- (void)compareCurrentAppVersion:(NSString *)currentAppVersion appStoreAppVersion:(NSString *)appStoreAppVersion
{
    int currentAppVersion1 = 0;
    int currentAppVersion2 = 0;
    int currentAppVersion3 = 0;
    int appStoreAppVersion1 = 0;
    int appStoreAppVersion2 = 0;
    int appStoreAppVersion3 = 0;
    
    NSArray *components = [currentAppVersion componentsSeparatedByString:@"."];
    if ([components count] > 0) currentAppVersion1 = [components[0] intValue];
    if ([components count] > 1) currentAppVersion2 = [components[1] intValue];
    if ([components count] > 2) currentAppVersion3 = [components[2] intValue];
    
    components = [appStoreAppVersion componentsSeparatedByString:@"."];
    if ([components count] > 0) appStoreAppVersion1 = [components[0] intValue];
    if ([components count] > 1) appStoreAppVersion2 = [components[1] intValue];
    if ([components count] > 2) appStoreAppVersion3 = [components[2] intValue];
    
    if (appStoreAppVersion1 > currentAppVersion1) {
        [self haveNewVersion];
    } else if (appStoreAppVersion1 == currentAppVersion1) {
        if (appStoreAppVersion2 > currentAppVersion2) {
            [self haveNewVersion];
        } else if (appStoreAppVersion2 == currentAppVersion2) {
            if (appStoreAppVersion3 > currentAppVersion3) {
                [self haveNewVersion];
            } else {
                [self noHaveNewVersion];
            }
        } else {
            [self noHaveNewVersion];
        }
    } else {
        [self noHaveNewVersion];
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"StoryboardThree" bundle:nil];
    ZDWebViewController *webViewController = [storyboard instantiateViewControllerWithIdentifier:@"ZDWebViewController"];
    if (indexPath.section == 0 && indexPath.row == 1) {
        [self checkUpdatePressed];
    } else if (indexPath.section == 0 && indexPath.row == 0) {
        webViewController.viewTitle = @"功能介绍";
        webViewController.onlineHtml = @"http://www.baidu.com";
        [self.navigationController pushViewController:webViewController animated:YES];
    } else if(indexPath.section == 1 && indexPath.row == 0){
        webViewController.viewTitle = @"协议";
        webViewController.onlineHtml = @"http://www.baidu.com";
        [self.navigationController pushViewController:webViewController animated:YES];
    }
}

- (void)checkUpdatePressed
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:VERSION_URL]];
        dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            NSString *appStoreAppVersion = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSString *currentAppVersion = [self currentAppVersion];
            
            [self compareCurrentAppVersion:currentAppVersion appStoreAppVersion:appStoreAppVersion];
        });
    });
}

@end
