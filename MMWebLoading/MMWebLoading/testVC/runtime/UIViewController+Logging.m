//
//  UIViewController+Logging.m
//  MMWebLoading
//
//  Created by iMac on 15/9/6.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import "UIViewController+Logging.h"
//#import ""
@implementation UIViewController (Logging)
- (void)swizzled_viewDidAppear:(BOOL)animated
{
    // call original implementation
    [self swizzled_viewDidAppear:animated];
    
    // Logging
   // [Logging logWithEventName:NSStringFromClass([self class])];
}
void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    // the method might not exist in the class, but in its superclass
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    // class_addMethod will fail if original method already exists
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    // the method doesn’t exist and we just added one
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
+ (void)load
{
    swizzleMethod([self class], @selector(viewDidAppear:), @selector(swizzled_viewDidAppear:));
}
//+(void)load{
//
//}
@end
