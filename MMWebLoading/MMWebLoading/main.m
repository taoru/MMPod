//
//  main.m
//  MMWebLoading
//
//  Created by Alan on 15/8/8.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        int age = 10;
        void (^block)() = ^{
            NSLog(@"%d",age);
        };
        age  = 30;
        block();//10
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
