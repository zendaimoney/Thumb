//
//  ZDMyAccountTableViewController.m
//  Thumb
//
//  Created by peter on 14/11/13.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDMyAccountTableViewController.h"
#import "MyAccountTableViewCell.h"

@interface ZDMyAccountTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ZDMyAccountTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

-(NSArray *)listImagesAndNamesWithIndex:(NSInteger)index
{
    UIImage *image;
    NSString *text;
    if (index == 0) {
        image = [UIImage imageNamed:@"icon_fortune"];
        text = @"理财纪录";
    } else if (index == 1) {
        image = [UIImage imageNamed:@"icon_trade"];
        text = @"交易明细";
    } else if (index == 2) {
        image = [UIImage imageNamed:@"icon_safe"];
        text = @"账户安全";
    } else if (index == 3) {
        image = [UIImage imageNamed:@"icon_service"];
        text = @"我的客户经理";
    }
    return @[image,text];
}

#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"myAccountTableViewCell";
    MyAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.iconImageView.image = [self listImagesAndNamesWithIndex:indexPath.row][0];
    cell.titleLabel.text = [self listImagesAndNamesWithIndex:indexPath.row][1];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 1) {
        [self performSegueWithIdentifier:@"showTradeDetail" sender:self];
    }  else if (indexPath.row == 2) {
        [self performSegueWithIdentifier:@"showSafe" sender:self];
    }
}

@end
