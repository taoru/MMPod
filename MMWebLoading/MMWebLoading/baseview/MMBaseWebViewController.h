//
//  MMBaseWebViewController.h
//  Investment
//
//  Created by iMac on 15/7/30.
//
//

#import <UIKit/UIKit.h>
#import "XHFriendlyLoadingView.h"

@interface MMBaseWebViewController : MMBaseViewController{
    UIActivityIndicatorView *activity;
    NSInteger selectedCount; // default is 1

}
@property (nonatomic, assign) BOOL  isNavBarWhite;
@property (nonatomic, assign) BOOL  isWebLoad;
@property (nonatomic, retain) NSString  *titleStr;
@property (nonatomic, retain) NSString  *urlStr;
@property (nonatomic,strong) UIWebView *webView;//%label
@property (nonatomic, retain) NSString  *typeStr;

@property (nonatomic, strong) XHFriendlyLoadingView *friendlyLoadingView;

- (void)showLoading:(NSString *)url;
@end
