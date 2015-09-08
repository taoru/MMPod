//
//  UIPlaceHolderTextView.h
//  VoiceCloudTest
//
//  Created by Steven on 14-7-12.
//  Copyright (c) 2014年 DevStore. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPlaceHolderTextView : UITextView

@property (nonatomic,strong)NSString *placeholder;
@property (nonatomic,strong)UIColor *placeholderColor;
@property (nonatomic,strong)UILabel *placeholderLabel;
- (void)textChanged:(NSNotification*)notification;
@end
