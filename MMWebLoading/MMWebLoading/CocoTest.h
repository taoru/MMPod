//
//  CocoTest.h
//  MMWebLoading
//
//  Created by iMac on 15/9/7.
//  Copyright (c) 2015年 Alan. All rights reserved.
//


//typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {
//    UIViewAutoresizingNone                 = 0,
//    UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
//    UIViewAutoresizingFlexibleWidth        = 1 << 1,
//    UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
//    UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
//    UIViewAutoresizingFlexibleHeight       = 1 << 4,
//    UIViewAutoresizingFlexibleBottomMargin = 1 << 5
//};
#import <Foundation/Foundation.h>
#import "mach/mach.h"
#import "Message.h"

@interface CocoTest : NSObject
@property(strong,nonatomic)NSMutableArray *dataArray;
@property (nonatomic, strong) Message *message;

+ (CocoTest*)getInstance ;
- (void)valueAndObjectTest;
-(void)usedMemory;

@end
