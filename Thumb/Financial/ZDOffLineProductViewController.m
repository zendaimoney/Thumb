//
//  ZDOffLineProductViewController.m
//  Thumb
//
//  Created by peter on 14/11/14.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDOffLineProductViewController.h"
#import "SSFShowSimpleAlert.h"

@interface ZDOffLineProductViewController ()

@end

@implementation ZDOffLineProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (IBAction)backButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)contactServicesBtnPressed:(id)sender {
    if ([[UIDevice currentDevice].model rangeOfString:@"iPhone"].location != NSNotFound) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt://4008216888"]];
    } else {
        [SSFShowSimpleAlert showSimpleAlertWithTitle:@"" message:@"此设备没有通话功能"];
    }
}
@end
