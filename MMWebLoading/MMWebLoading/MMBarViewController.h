//
//  MMBarViewController.h
//  MMWebLoading
//
//  Created by iMac on 15/9/7.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "ViewController2.h"
#import "ThreeViewController.h"
@interface MMBarViewController : UITabBarController
@property (nonatomic, strong) ViewController              *homePageController;

@property (nonatomic, strong) ViewController2                *tenderController;

@property (nonatomic, strong) ThreeViewController         *accountController;
@end
