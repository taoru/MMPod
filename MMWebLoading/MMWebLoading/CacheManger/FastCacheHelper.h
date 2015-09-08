//
//  FastCacheHelper.h
//  Trip2013
//
//  Created by Ryou Zhang on 12/15/13.
//  Copyright (c) 2013 alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    UIImageNormalMode = 0,
    UIImageTileMode = 1,
    UIImageResizeStretchMode = 2,
    UIImageResizeTileMode = 3,
}UIImageMode;

@class BaseRender;

@interface FastCacheHelper : NSObject<NSCacheDelegate> {
@private
    NSString    *_cacheDir;
    NSCache     *_cacheDic;
}
@property(retain, atomic)NSString *cacheDir;
+ (FastCacheHelper*)getInstance;
//获取内存图片
- (id)getImageFormCacheBy:(NSString*)filePath;
//设置内存图片
- (void)setImage:(id)image toCacheBy:(NSString *)filePath;

-(BaseRender *)getRenderWithFileName:(NSString *)fileName;

- (NSString *)getBundleRecourceFullPathWith:(NSString *)fileName;

- (NSString *)generateSmartFileName:(NSString *)fileName;

- (NSString *)generateSmartLocalFilePath:(NSString *)filePath;
@end
