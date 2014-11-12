//
//  ZDQuestionBackViewController.m
//  Thumb
//
//  Created by lucy on 14-11-12.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDQuestionBackViewController.h"

@interface ZDQuestionBackViewController ()

@end

@implementation ZDQuestionBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length) {
        _placeholderLab.hidden = YES;
    } else {
        _placeholderLab.hidden = NO;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
