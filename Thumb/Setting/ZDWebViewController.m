//
//  ZDWebViewController.m
//  Thumb
//
//  Created by lucy on 14-11-13.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDWebViewController.h"

@interface ZDWebViewController ()

@end

@implementation ZDWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = _viewTitle;
    if ([_localHtml isEqualToString:@""] || _localHtml == nil) {
        [self loadOnlineHtml:_onlineHtml];
    }
    if ([_onlineHtml isEqualToString:@""] || _onlineHtml == nil) {
        [self loadLocalHtml:_localHtml];
    }
}

-(void)loadLocalHtml:(NSString *)htmlName
{
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:htmlName ofType:@"html" inDirectory:@"www"];
    NSURL *htmlUrl = [NSURL fileURLWithPath:htmlPath];
    webView.scalesPageToFit = YES;
    webView.scrollView.bounces = NO;
    [webView setOpaque:NO];
    [webView setBackgroundColor:[UIColor clearColor]];
    [webView loadRequest:[NSURLRequest requestWithURL:htmlUrl]];
}

- (void)loadOnlineHtml:(NSString *)urlParam{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlParam]];
    [webView loadRequest:request];
}

@end
