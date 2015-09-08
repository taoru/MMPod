//
//  NSUserDefaults+Trip.h
//  Trip2013
//
//  Created by yongye on 13-9-23.
//  Copyright (c) 2013年 alibaba. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TRIP_INFO_TAG   @"trip_info_dict"
#define UD_VERSION      @"__v"


#define TRIP_PUSH_LAUNCH_LINK   @"push_link_url" //push启动用。
#define PUSH_TOKEN              @"push_token"//push_token 加工过的
#define PUSH_TOKEN_DATA         @"push_token_data"//push_token <XXXX XXXX xxxx ....>

@interface NSUserDefaults (Trip)
+ (id)tripObjectForKey:(NSString *)defaultName;
+ (void)tripSetObject:(id)value forKey:(NSString *)defaultName;
+ (void)tripRemoveObjectForKey:(NSString *)defaultName;
+ (void)tripSynchronize;

//-------业务相关------
+ (void)setDefaultKV;

+ (NSInteger)getIntegerVersion:(NSString*)version;
@end