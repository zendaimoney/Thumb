//
//  ZDFinancialTableViewController.m
//  Thumb
//
//  Created by peter on 14/11/10.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDFinancialTableViewController.h"
#import "ZDWebService.h"
#import "AllCustomerCategoryHeaders.h"

@interface ZDFinancialTableViewController ()<SSFSegmentControlDelegate>

@end

@implementation ZDFinancialTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void)configureView
{
    SSFSegmentControl *segment = [SSFSegmentControl SSFSegmentedControlInstance];
    segment.delegate = self;
    self.tableView.tableHeaderView = segment;
}

#pragma mark - SSFSegmentDelegate

- (void)SSFSegmentControlDidPressed:(UIView *)view selectedIndex:(NSInteger)selectedIndex
{
    switch (selectedIndex) {
        case 0:
            
            break;
        case 1:
            
            break;
        default:
            break;
    }
}

- (IBAction)test:(id)sender {
    [[ZDWebService sharedWebService] loginWithUserName:@"13174125879" password:@"123456" completion:^(NSError *error, NSDictionary *resultDic) {
        NSLog(@"%@",resultDic);
    }];
}
@end
