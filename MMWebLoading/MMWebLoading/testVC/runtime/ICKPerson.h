//
//  ICKPerson.h
//  MMWebLoading
//
//  Created by iMac on 15/9/2.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICKPerson : NSObject
/** 年龄 */
@property (nonatomic,assign) NSInteger age;

/** 姓名 */
@property (nonatomic,copy) NSString * name;

/** 身高 */
@property (nonatomic,assign) float height;



/** 方法 */
- (void)eat;
- (void)read;
@end




