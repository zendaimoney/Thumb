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
#import "financialTableCell.h"

@interface ZDFinancialTableViewController ()<SSFSegmentControlDelegate>

@property (strong, nonatomic) NSArray *arr;

@end

@implementation ZDFinancialTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    self.arr = @[@"1",@"2"];
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

#pragma mark - tabbleView datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellidentifier = @"financialCell";
    financialTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellidentifier forIndexPath:indexPath];
    return cell;
}


- (IBAction)test:(id)sender {
    [[ZDWebService sharedWebService] loginWithUserName:@"13174125879" password:@"123456" completion:^(NSError *error, NSDictionary *resultDic) {
        NSLog(@"%@",resultDic);
    }];
}
@end
