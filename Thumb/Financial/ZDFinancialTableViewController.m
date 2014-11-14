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

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"showOffLineProduct" sender:self];
}

- (IBAction)test:(id)sender {
//    [[ZDWebService sharedWebService] loginWithUserName:@"13174125879" password:@"123456" completion:^(NSError *error, NSDictionary *resultDic) {
//        NSLog(@"%@",resultDic);}];
    
//    [[ZDWebService sharedWebService] getValidateCodeWithMobile:@"13482464176" oprType:@"1" completion:^(NSError *error, NSDictionary *resultDic) {
//        NSLog(@"%@",resultDic);
//    }];
    
//    [[ZDWebService sharedWebService] registerWithValidateCode:@"9571" mobile:@"13482464176" password:@"123456" completion:^(NSError *error, NSDictionary *resultDic) {
//        NSLog(@"%@",resultDic);
//    }];
    
//    [[ZDWebService sharedWebService] resetPasswordWithValidateCode:@"7565" mobile:@"13482464176" password:@"654321" completion:^(NSError *error, NSDictionary *resultDic) {
//        NSLog(@"%@",resultDic);
//    }];
    
    [[ZDWebService sharedWebService] modifyPasswordWithMobile:@"13482464176" oldpwd:@"654321" newpwd:@"123456" completion:^(NSError *error, NSDictionary *resultDic) {
        NSLog(@"%@",resultDic);
    }];
}
@end
