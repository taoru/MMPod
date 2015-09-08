//
//  PoppupView.m
//  VoiceCloudTest
//
//  Created by Steven on 14-7-12.
//  Copyright (c) 2014年 DevStore. All rights reserved.
//

#import "PoppupView.h"

@implementation PoppupView
{
    int  _queueCount;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.75f];
        self.layer.cornerRadius = 0;
        self.textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 100, 10)];
        self.textLabel.numberOfLines = 0;
        self.textLabel.font = [UIFont systemFontOfSize:17];
        self.textLabel.textColor = [UIColor whiteColor];
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.textAlignment = UITextAlignmentCenter;
        [self addSubview:self.textLabel];
        _queueCount = 0;
    }
    return self;
}

- (void)setText:(NSString *)text{
    self.textLabel.frame = CGRectMake(0, 10, 100, 10);
    _queueCount ++;
    self.alpha = 1.0f;
    self.textLabel.text = text;
    [self.textLabel sizeToFit];
    CGRect frame = CGRectMake(5, 0, self.textLabel.frame.size.width, self.textLabel.frame.size.height);
    self.textLabel.frame = frame;
    self.textLabel.frame = CGRectMake(self.textLabel.frame.origin.x, self.textLabel.frame.origin.y+10, self.textLabel.frame.size.width, self.textLabel.frame.size.height);
    frame =  CGRectMake((self.parentView.frame.size.width - frame.size.width)/2, self.frame.origin.y, self.textLabel.frame.size.width+10, self.textLabel.frame.size.height+20);
    self.frame = frame;
    [UIView animateWithDuration:3.0 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (_queueCount == 1) {
            [self removeFromSuperview];
        }
        _queueCount--;
    }];
}

@end
