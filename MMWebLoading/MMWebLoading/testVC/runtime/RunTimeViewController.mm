//
//  RunTimeViewController.m
//  MMWebLoading
//
//  Created by Alan on 15/8/22.
//  Copyright (c) 2015年 Alan. All rights reserved.
//
#include<objc/runtime.h>

#import "RunTimeViewController.h"
#import "ICKPerson.h"
#import <objc/runtime.h>
@implementation RunTimeViewController
//class_replaceMethod
//class_addMethod
- (id)init
{
    if( ( self = [super init]) != nil )
    {
        class_addMethod([RunTimeViewController class], @selector(sayHello2), (IMP)sayHello, "v@:");
        
        //   class_addMethod([ViewController class], @selector(dynGeneratedMethod:),(IMP)myClassIMP,"v@:i");
        
        
    }
    return self;
}
void sayHello(id self, SEL _cmd)
{
    NSLog(@"Hello");
}

- (void)doSomethingWithVar:(NSString *)str {
    NSLog(@"%@",str);
}
NSString * MyUppercaseString(id SELF, SEL _cmd)
{
    NSLog(@"begin uppercaseString");
   // NSString *str = orginIMP (SELF, _cmd);
    NSLog(@"end uppercaseString");
    return nil;
}
-(void)nslog{
    NSLog(@"123");
}
-(void)nslog2{
    NSLog(@"321");
}



void nameSetter(id self, SEL _cmd, NSString *newName) {
    Ivar ivar = class_getInstanceVariable([RunTimeViewController class], "_privateName");
    id oldName = object_getIvar(self, ivar);
    if (oldName != newName) object_setIvar(self, ivar, [newName copy]);
}
-(void)viewDidLoad{
    NSLog(@"RunTimeViewController");
    //1 方法置换
    
    Method method = class_getInstanceMethod(NSClassFromString(@"RunTimeViewController"), @selector(nslog));
    IMP fakeIMP = [self methodForSelector:@selector(nslog2)];
    method_setImplementation(method, fakeIMP);
    
    [self nslog];
    
    //2 方法添加
    Class stringclass = NSClassFromString(@"NSString");
    SEL stringselect = NSSelectorFromString(@"NSString");
    class_addMethod([RunTimeViewController class], @selector(setName:), (IMP)nameSetter, "v@:@");
    id o = [RunTimeViewController new];
    //NSLog(@"%@", [o name]);
    [o setName:@"Jobs"];
//   / NSLog(@"%@", [o name]);

//    class_addMethod(self, stringselect, nil, @"");
    
    //3 关联   添加属性
   // objc_setAssociatedObject(self, &loadOperationKey, operations, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    //4置换方法
   // method_exchangeImplementations(orig_method,alt_method)
   //Aspects class_replaceMethod

    
    
    dog *d =[dog new];

    NSLog(@"%p", &d);
    
    
    
//    id objTest = object_copy(d,sizeof(d));
//    NSLog(@"%p", &objTest);

   // object_copy 函数实现了对象的拷贝。

//    dog *obj = [dog new];
//    NSLog(@"%p", &obj);
//    
//    id objTest = object_copy(obj,sizeof(obj));
//    NSLog(@"%p", &objTest);
//    
//    [objTest fun1];
    // 获取一个类的所有成员属性
//    unsigned int count = 0;
//    Ivar *ivars = class_copyIvarList([ICKPerson class], &count);
//    for (int i = 0; i<count; i++) {
//        Ivar ivar = ivars[i];
//        // 获取属性名
//        const char *name = ivar_getName(ivar);
//        // 获取属性类型
//        const char *class = ivar_getTypeEncoding(ivar);
//        NSLog(@"name:%s   class:%s",name,class);
//    }
//    // 释放ivars---C语言的在ARC中通过copy产生，需要手动释放
//    free(ivars);
    
    
    // 获取一个类的所有方法
//    unsigned int count2 = 0;
//    Method *methods = class_copyMethodList([ICKPerson class], &count2);
//    for (int i = 0; i<count2; i++) {
//        // 取出对应的i 位置方法
//        Method method = methods[i];
//        SEL sel = method_getName(method);
//        NSLog(@"%@",NSStringFromSelector(sel));
//    }
//    free(methods);
    
    ICKPerson *person = [[ICKPerson alloc] init];
    [person eat];
    
//    objc_msgSend(self, @selector(doSomethingWithVar:),@"123");
//    
//    
//    SEL aSel = @selector(doSomethingWithVar:);
//    objc_msgSend(self,aSel,@"123");
    
    
    
    Class strcls = [NSString class];
    SEL  oriUppercaseString = @selector(uppercaseString);
    orginIMP = [NSString instanceMethodForSelector:oriUppercaseString];
    IMP imp2 = class_replaceMethod(strcls,oriUppercaseString,(IMP)MyUppercaseString,NULL);
    NSString *s = @"hello world";
    NSLog(@"%@--%@",[s uppercaseString],[self nameWithInstance:self]);
    
}
- (NSString *)nameWithInstance:(id)instance
{
    unsigned int numIvars = 0;
    NSString *key=nil;
    Ivar * ivars = class_copyIvarList([self class], &numIvars);
    for(int i = 0; i < numIvars; i++) {
        Ivar thisIvar = ivars[i];
        const char *type = ivar_getTypeEncoding(thisIvar);
        NSString *stringType =  [NSString stringWithCString:type encoding:NSUTF8StringEncoding];
        if (![stringType hasPrefix:@"@"]) {
            continue;
        }
        if ((object_getIvar(self, thisIvar) == instance)) {
            key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];
            break;
        }
    }
    free(ivars);
    return key;
}

-(void)invocatin{
SEL myMethod = @selector(myLog:parm:parm:);
SEL myMethod2 = @selector(myLog);

NSMethodSignature * sig  = [[self class] instanceMethodSignatureForSelector:myMethod];
NSInvocation * invocatin = [NSInvocation invocationWithMethodSignature:sig];
[invocatin setTarget:self];
[invocatin setSelector:myMethod2];
int a=1;
int b=2;
int c=3;
[invocatin setArgument:&a atIndex:2];
[invocatin setArgument:&b atIndex:3];
[invocatin setArgument:&c atIndex:4];
[invocatin invoke];
}
-(void)myLog:(int)a parm:(int)b parm:(int)c{
    NSLog(@"MyLog%d:%d:%d",a,b,c);
}
@end
