//
//  PoppupView.h
//  VoiceCloudTest
//
//  Created by Steven on 14-7-12.
//  Copyright (c) 2014年 DevStore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PoppupView : UIView

@property (nonatomic,strong)UILabel *textLabel;
@property (nonatomic,strong)UIView *parentView;
- (void)setText:(NSString *)text;
@end
