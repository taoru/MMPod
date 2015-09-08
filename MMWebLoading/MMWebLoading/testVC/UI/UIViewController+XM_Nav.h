//
//  UIViewController+XM_Nav.h
//  MMWebLoading
//
//  Created by iMac on 15/9/1.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (XM_Nav)
-(void)XM_SetTitleText:(NSString *)title;

-(void)XM_SetButtonImage:(NSString *)image isRight:(BOOL)isRight Target:(id)target Selector:(SEL)selector;

-(void)XM_SetBgImage:(NSString *)image;

@end
