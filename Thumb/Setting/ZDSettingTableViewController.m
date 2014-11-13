//
//  ZDSettingTableViewController.m
//  Thumb
//
//  Created by peter on 14/11/10.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDSettingTableViewController.h"
#import "ZDWebViewController.h"

@interface ZDSettingTableViewController ()

@end

@implementation ZDSettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 2) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"StoryboardThree" bundle:nil];
        ZDWebViewController *webViewController = [storyboard instantiateViewControllerWithIdentifier:@"ZDWebViewController"];
        webViewController.viewTitle = @"常见问题";
        webViewController.onlineHtml = @"http://www.baidu.com";
        [self.navigationController pushViewController:webViewController animated:YES];
    }
}

@end
