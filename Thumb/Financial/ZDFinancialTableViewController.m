//
//  ZDFinancialTableViewController.m
//  Thumb
//
//  Created by peter on 14/11/10.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDFinancialTableViewController.h"
#import "ZDWebService.h"

@interface ZDFinancialTableViewController ()

@end

@implementation ZDFinancialTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)test:(id)sender {
    [[ZDWebService sharedWebService] loginWithUserName:@"13174125879" password:@"123456" completion:^(NSError *error, NSDictionary *resultDic) {
        NSLog(@"%@",resultDic);
    }];
}
@end
