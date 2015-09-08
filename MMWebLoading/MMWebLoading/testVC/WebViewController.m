//
//  WebViewController.m
//  MMWebLoading
//
//  Created by iMac on 15/8/17.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController
@synthesize webView = _webView;
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.urlStr=[NSString stringWithFormat:@"http://www.baidu.com"];

    [self showLoading:self.urlStr];
//
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]];
//    [_webView loadRequest:request];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect webFrame = [UIScreen mainScreen].bounds;
    self.webView.scalesPageToFit = YES;
    
    
    NSString *bundleFile = [[NSBundle mainBundle] pathForResource:@"xxx" ofType:@"bundle"];
    NSString *htmlFile = [bundleFile stringByAppendingPathComponent:@"/index.html"];
    
    NSData *htmlData = [NSData dataWithContentsOfFile:htmlFile];
    [ self.webView loadData:htmlData MIMEType:@"text/html" textEncodingName:@"UTF-8" baseURL:[NSURL fileURLWithPath:bundleFile]];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
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
