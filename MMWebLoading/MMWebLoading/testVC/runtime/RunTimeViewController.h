//
//  RunTimeViewController.h
//  MMWebLoading
//
//  Created by Alan on 15/8/22.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "dog.h"
@interface RunTimeViewController : MMBaseViewController
{
    IMP orginIMP;

}
@end

//- (void)parseObjectDynamic:(id)object {
//    for (id data in object) {
//        [self performSelector:NSSelectorFromString([NSString stringWithFormat:@"parse%@:", [data type]]) withObject:[data value]];
//    }
//}
//- (void)parseString:(NSString *)aString {}
//- (void)parseNumber:(NSString *)aNumber {}
//- (void)parseArray:(NSString *)aArray {}


//1.   增加
//
//增加函数:class_addMethod
//增加实例变量:class_addIvar
//增加属性:@dynamic标签，或者class_addMethod，因为属性其实就是由getter和setter函数组成
//增加Protocol:class_addProtocol (说实话我真不知道动态增加一个protocol有什么用,-_-!!)
//
//2。  获取
//
//获取函数列表及每个函数的信息(函数指针、函数名等等):class_getClassMethod method_getName ...
//获取属性列表及每个属性的信息:class_copyPropertyList property_getName
//获取类本身的信息,如类名等：class_getName class_getInstanceSize
//获取变量列表及变量信息：class_copyIvarList
//获取变量的值
//
//3.    替换
//
//将实例替换成另一个类：object_setClass
//将函数替换成一个函数实现：class_replaceMethod       ***
//直接通过char *格式的名称来修改变量的值，而不是通过变量