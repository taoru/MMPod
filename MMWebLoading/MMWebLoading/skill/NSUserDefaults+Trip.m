//
//  NSUserDefaults+Trip.m
//  Trip2013
//
//  Created by yongye on 13-9-23.
//  Copyright (c) 2013年 alibaba. All rights reserved.
//

#import "NSUserDefaults+Trip.h"


//火车票预售期默认19天
#define NSUSERDEFAULTS_TRAIN_PRESALE_PERIOD @"train_presale_period"
#define DV_TRAIN_PRESALE_PERIOD @20

@implementation NSUserDefaults (Trip)

#define CLIENT_VERSION          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]


#pragma mark - 业务相关
//业务初始化
+ (void)setDefaultKV{
    
    NSInteger old_v = [NSUserDefaults getIntegerVersion:[NSUserDefaults tripObjectForKey:UD_VERSION]];
    if(old_v<30000){//@""3.0.0
        //添加新版本新增的配置项
//        NSDictionary *dict = @{NSUSERDEFAULTS_TRAIN_PRESALE_PERIOD:DV_TRAIN_PRESALE_PERIOD//火车票预售期
//                               };
//        [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
//            [NSUserDefaults tripSetObject:obj forKey:key];
//        }];
        [NSUserDefaults tripSetObject:CLIENT_VERSION forKey:UD_VERSION];

    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - 基本功能
+ (id)tripObjectForKey:(NSString *)defaultName{
    return [[NSUserDefaults standardUserDefaults] tripObjectForKey:defaultName];
}

+ (void)tripSetObject:(id)value forKey:(NSString *)defaultName{
    [[NSUserDefaults standardUserDefaults] tripSetObject:value forKey:defaultName];
}

+ (void)tripRemoveObjectForKey:(NSString *)defaultName{
    [[NSUserDefaults standardUserDefaults] tripRemoveObjectForKey:defaultName];
}
+ (void)tripSynchronize{
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSMutableDictionary *)getTripInfo{
    NSMutableDictionary *tripInfoDict = [self objectForKey:TRIP_INFO_TAG];//这里取出来的是NSDictionary
    if(tripInfoDict==nil || ![tripInfoDict isKindOfClass:[NSMutableDictionary class]]){
        tripInfoDict = [NSMutableDictionary new];
        [self setObject:tripInfoDict forKey:TRIP_INFO_TAG];
    }else{
        tripInfoDict = [NSMutableDictionary dictionaryWithDictionary:tripInfoDict];
    }
    return tripInfoDict;
}

- (id)tripObjectForKey:(NSString *)defaultName{
    NSMutableDictionary *tripInfoDict = [self getTripInfo];
    return [tripInfoDict valueForKey:defaultName];
}

- (void)tripSetObject:(id)value forKey:(NSString *)defaultName{
    NSMutableDictionary *tripInfoDict = [self getTripInfo];
    [tripInfoDict setValue:value forKey:defaultName];
    [tripInfoDict setValue:value forKey:defaultName];
    [self setValue:tripInfoDict forKey:TRIP_INFO_TAG];

}

- (void)tripRemoveObjectForKey:(NSString *)defaultName{
    NSMutableDictionary *tripInfoDict = [self getTripInfo];
    if([tripInfoDict valueForKey:defaultName] != nil){
        [tripInfoDict setValue:nil forKey:defaultName];
        [self setValue:tripInfoDict forKey:TRIP_INFO_TAG];
    }
}

+ (NSInteger)getIntegerVersion:(NSString*)version{
    //支持3位，“3.0.0” -> 30000
    if(STRING_IS_NULL(version)){
        return 0;
    }
    NSInteger int_v = 0;
    NSArray *varray = [version componentsSeparatedByString:@"."];
    NSInteger i = 0;
    for(NSString *subversion in varray){
        if(i>=3)
            break;
        int_v = int_v*100;
        int_v += [subversion integerValue];
        i++;
    }
    while(i<3){
        int_v = int_v*100;
        i++;
    }
    return int_v;
}

@end
