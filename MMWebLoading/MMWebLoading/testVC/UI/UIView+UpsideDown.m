//
//  UIView+UpsideDown.m
//  MMWebLoading
//
//  Created by iMac on 15/9/1.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import "UIView+UpsideDown.h"

@implementation UIView (UpsideDown)
-(void)upsideDown
{
    CGFloat angle = M_PI;
    CGAffineTransform transform = CGAffineTransformMakeRotation(angle);
    [self setTransform:transform];
}
@end
