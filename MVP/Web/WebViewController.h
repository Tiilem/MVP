//
//  WebViewController.h
//  MVP
//
//  Created by ccguo on 15/12/8.
//  Copyright © 2015年 ccguo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (strong, nonatomic) UIWebView *webView;

- (instancetype)initWithUrl:(NSURL *)url;

@end
