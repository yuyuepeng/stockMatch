//
//  YSMTWebViewController.m
//  stockMatch
//
//  Created by 玉岳鹏 on 2019/8/16.
//  Copyright © 2019 玉岳鹏. All rights reserved.
//

#import "YSMTWebViewController.h"
#import <WebKit/WebKit.h>

@interface YSMTWebViewController ()
@property(nonatomic, strong) WKWebView *webView;

@end

@implementation YSMTWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configSubview];
    
    [self LoadWebView];
    [self createNavigationBarWithTitle:@""];
    [self addLeftButtonWithAction];
    // Do any additional setup after loading the view.
}

- (void)configSubview{
    _webView = [[WKWebView alloc] init];
    
    _webView.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
    [self.view addSubview:_webView];
    self.webView.scrollView.bounces = NO;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, ScreenHeight - Height_TabBar - 20, ScreenWidth, Height_TabBar + 20)];
    label.text = @"感谢您的阅读与支持，😁";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    label.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:label];
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
}
- (void)LoadWebView {
    NSURL *url = [NSURL URLWithString:self.urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}
- (void)reloadWebView{
    [self.webView reload];
}

#pragma mark KVO的监听代理
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    //网页title
    if ([keyPath isEqualToString:@"title"]){
        if (object == self.webView){
            self.navTitle = self.webView.title;
        }else{
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
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
