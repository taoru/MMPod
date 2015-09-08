//
//  UINavigationController+CustomAnimation.m
//  MMWebLoading
//
//  Created by Alan on 15/8/14.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import "UINavigationController+CustomAnimation.h"

@implementation UINavigationController (CustomAnimation)

- (void)customPushViewController:(UIViewController *)viewController
{
    viewController.view.frame = (CGRect){0, -viewController.view.frame.size.height, viewController.view.frame.size};
    [self pushViewController:viewController animated:NO];
    [UIView animateWithDuration:.15f
                     animations:^{
                         viewController.view.frame = (CGRect){0, 0, self.view.bounds.size};
                     }];}
@end
