//
//  ICKPerson.m
//  MMWebLoading
//
//  Created by iMac on 15/9/2.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import "ICKPerson.h"
#import <objc/runtime.h>

@implementation ICKPerson
+ (void)load
{
    // 交换吃和度的方法
    Method m1 = class_getInstanceMethod(self, @selector(eat));
    Method m2 = class_getInstanceMethod(self, @selector(read));
    method_exchangeImplementations(m1, m2);
}

- (void)eat{
    NSLog(@"---eat");
}

- (void)read{
    NSLog(@"---read");
}
@end
