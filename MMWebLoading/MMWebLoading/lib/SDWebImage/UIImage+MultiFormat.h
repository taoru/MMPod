//
//  UIImage+MultiFormat.h
//  SDWebImage
//
//  Created by Olivier Poitrey on 07/06/13.
//  Copyright (c) 2013 Dailymotion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MultiFormat)
+(UIImage*) imageWithColor:(UIColor*)color;

+ (UIImage *)sd_imageWithData:(NSData *)data;

@end
