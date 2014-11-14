//
//  ZDOffLineProductViewController.m
//  Thumb
//
//  Created by peter on 14/11/14.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDOffLineProductViewController.h"

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

@end
