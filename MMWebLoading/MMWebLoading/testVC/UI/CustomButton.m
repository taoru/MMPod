//
//  CustomButton.m
//  MMWebLoading
//
//  Created by iMac on 15/9/2.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/




- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat titleH =21;
    CGFloat imageX =0;
    CGFloat imageY =0;
    CGFloat imageW = self.bounds.size.width;
    CGFloat imageH =self.bounds.size.height-titleH;
    self.imageView.frame = CGRectMake(imageX,imageY, imageW, imageH);
     self.titleLabel.frame = CGRectMake(imageX,imageH, imageW, titleH);
}

//1 // 自定义button---MainTagSubIcon（测试图片名称）
//2 UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//3 [button setImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
//4 // 设置button的尺寸
//5 [button sizeToFit];
//6 // 设置内边距对应的位置为负数
//7 button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
//8 self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
@end
