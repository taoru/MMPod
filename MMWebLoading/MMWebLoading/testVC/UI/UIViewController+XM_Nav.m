//
//  UIViewController+XM_Nav.m
//  MMWebLoading
//
//  Created by iMac on 15/9/1.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import "UIViewController+XM_Nav.h"

@implementation UIViewController (XM_Nav)


-(void)XM_SetTitleText:(NSString *)title{
    self.navigationController.navigationBar.topItem.title = title;
    
    UIFont* font = [UIFont fontWithName:@"Arial-ItalicMT" size:21.0];
    NSDictionary* textAttributes = @{NSFontAttributeName:font,
                                     NSForegroundColorAttributeName:[UIColor blackColor]};
    
    
    [self.navigationController.navigationBar setTitleTextAttributes:textAttributes];
}

-(void)XM_SetButtonImage:(NSString *)image isRight:(BOOL)isRight Target:(id)target Selector:(SEL)selector
{
    
    UIButton *abutton = [[UIButton alloc]initWithFrame:CGRectMake(0.0, 0.0, 60.0, 40.0)];
    [abutton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [abutton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    
    CGSize navSize = self.navigationController.navigationBar.frame.size;
    CGSize butSize = abutton.frame.size;
    if (isRight) {
        abutton.frame = CGRectMake(navSize.width- 20 - butSize.width, 0.0, butSize.width, butSize.height);
    }else{
        abutton.frame = CGRectMake(20.0, 0.0, butSize.width, butSize.height);
    }
    [self.navigationController.navigationBar addSubview:abutton];
    
}

-(void)XM_SetBgImage:(NSString *)image{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
    self.navigationController.navigationBar.topItem.titleView = imageView;
}
@end
