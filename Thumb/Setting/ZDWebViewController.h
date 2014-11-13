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
@property (weak, nonatomic) NSString *viewTitle;
@property (weak, nonatomic) NSString *localHtml;
@property (weak, nonatomic) NSString *onlineHtml;

@end
