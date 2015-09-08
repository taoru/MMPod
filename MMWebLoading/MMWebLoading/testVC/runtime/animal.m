//
//  animal.m
//  MMWebLoading
//
//  Created by iMac on 15/9/6.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import "animal.h"

@implementation animal
- (id)init {
    self = [super init];
    NSLog(@"%@",[self class]);
    
    
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([animal class], &count);
    for (int i = 0; i<count; i++) {
        Ivar ivar = ivars[i];
        // 获取属性名
        const char *name = ivar_getName(ivar);
        // 获取属性类型
        const char *class = ivar_getTypeEncoding(ivar);
        NSLog(@"animal==name:%s   class:%s",name,class);
    }
    // 释放ivars---C语言的在ARC中通过copy产生，需要手动释放
    free(ivars);
    if (self) {

    }
    return self;
}
@end
