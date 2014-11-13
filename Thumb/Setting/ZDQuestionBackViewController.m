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
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length) {
        _placeholderLab.hidden = YES;
    } else {
        _placeholderLab.hidden = NO;
    }
}

@end
