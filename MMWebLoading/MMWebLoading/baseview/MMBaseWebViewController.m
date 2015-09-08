//
//  MMBaseWebViewController.m
//  Investment
//
//  Created by iMac on 15/7/30.
//
//

#import "MMBaseWebViewController.h"

@interface MMBaseWebViewController ()

@end

@implementation MMBaseWebViewController
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //[self showLoading];
}
- (void)showLoading:(NSString *)url {
    [self.friendlyLoadingView showFriendlyLoadingViewWithText:@"正在加载..." loadingAnimated:YES];
//    self.urlStr = [url stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]];
//    [_webView loadRequest:request];
    
    
    
    
    
//    double delayInSeconds = 3.0;
//    __weak typeof(self) weakSelf = self;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void) {
//        selectedCount ++;
//        if (selectedCount == 5) {
//            [weakSelf.friendlyLoadingView showFriendlyLoadingViewWithText:@"重新加载失败，请返回检查网络。" loadingAnimated:NO];
//        } else {
//            [weakSelf.friendlyLoadingView showReloadViewWithText:@"加载失败，请点击刷新按钮重新加载。"];
//        }
//    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    return;
    _friendlyLoadingView = [[XHFriendlyLoadingView alloc] initWithFrame:self.view.bounds];
    
    __weak typeof(self) weakSelf = self;
    self.friendlyLoadingView.reloadButtonClickedCompleted = ^(UIButton *sender) {
        // 这里可以做网络重新加载的地方
        
        [weakSelf showLoading:nil];
    };
    [self.view addSubview:self.friendlyLoadingView];

  
    if (self.isWebLoad) {
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]];
        [_webView loadRequest:request];
        return;
    }

    if ([self.typeStr isEqual:@"security"]) {
        self.urlStr=[NSString stringWithFormat:@"%@/%@",SERVER,GQsecurity];
        self.urlStr = [self.urlStr stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]];
        [_webView loadRequest:request];
    }
    
    if ([self.typeStr isEqual:@"riskControl"]) {

        self.urlStr=[NSString stringWithFormat:@"%@/%@",SERVER,GQsecurity];
        self.urlStr = [self.urlStr stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]];
        [_webView loadRequest:request];
    }
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
