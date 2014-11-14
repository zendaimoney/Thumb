//
//  ZDTradeDetailTableViewController.m
//  Thumb
//
//  Created by peter on 14/11/14.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDTradeDetailTableViewController.h"
#import "TradeDetailTableViewCell.h"

@interface ZDTradeDetailTableViewController ()

@property (strong, nonatomic) NSArray *dataArr;

@end

@implementation ZDTradeDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = @[@"1",@"2"];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"tradeDetailCell";
    TradeDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
}

@end
