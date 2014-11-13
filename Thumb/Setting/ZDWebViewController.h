//
//  ZDWebViewController.h
//  Thumb
//
//  Created by lucy on 14-11-13.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZDWebViewController : UIViewController
{
    IBOutlet UIWebView* webView;
}
@property (strong, nonatomic) NSString *viewTitle;
@property (strong, nonatomic) NSString *localHtml;
@property (strong, nonatomic) NSString *onlineHtml;

@end
