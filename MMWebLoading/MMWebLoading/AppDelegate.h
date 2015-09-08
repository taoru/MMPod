//
//  AppDelegate.h
//  MMWebLoading
//
//  Created by Alan on 15/8/8.
//  Copyright (c) 2015年 Alan. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <AVOSCloud/AVOSCloud.h>
#import "MMBarViewController.h"
#warning 请替换成自己的id和key ，或用 leancloud@163.com/Public123  登录，来查看后台数据
//#define AVOSCloudAppID  @"ohqhxu3mgoj2eyj6ed02yliytmbes3mwhha8ylnc215h0bgk"
//#define AVOSCloudAppKey @"6j8fuggqkbc5m86b8mp4pf2no170i5m7vmax5iypmi72wldc"

#define AVOSCloudAppID @"mqPpYCmbiyXSbxctj0i4Eggm"
#define AVOSCloudAppKey @"JFFAKDNjmyowUG8gNmge30by"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) MMBarViewController  *tabBarController;

@end

