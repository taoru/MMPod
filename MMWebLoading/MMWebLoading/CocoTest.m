//
//  CocoTest.m
//  MMWebLoading
//
//  Created by iMac on 15/9/7.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import "CocoTest.h"



@implementation CocoTest

static CocoTest *_CocoTest_Instance = nil;
- (void)testKvo {

}
+ (CocoTest*)getInstance {
    @synchronized(self) {
        if (_CocoTest_Instance == nil)
            _CocoTest_Instance = [CocoTest new];
        return _CocoTest_Instance;
    }
}
- (void)valueAndObjectTest{
    NSMutableDictionary *dic=[NSMutableDictionary new];
    [dic setObject:@"123" forKey:@"1"];
    [dic setValue:@"123" forKey:@"1"];
    
    [dic setObject:[NSNull null] forKey:@"123"];
    [dic setObject:self forKey:[NSNumber numberWithInt:10]];
    UIImage *img=[UIImage new];
    
    NSObject *obj=[NSObject new];
 //   [obj setValue:@"12" forKey:@"22"];
    
    
    DDLog(@"%@  %@",[dic objectForKey:[NSNumber numberWithInt:10]],[dic valueForKey:@"22"]);
   //setObject：forKey：中Key的对象是一个id类型，并不是NSString，只不过我们经常使用NSString而已。
    /*setObject：forkey：中value是不能够为nil的，不然会报错。
    setValue：forKey：中value能够为nil，但是当value为nil的时候，会自动调用removeObject：forKey方法
     2, setValue：forKey：中key的参数只能够是NSString类型，而setObject：forKey：的可以是任何类型

     */
}


//http://www.apblog.cn/blog/2014/08/25/enum-an-wei-zuo-yi/
- (void)typedefTest{
    
    UIView *view=[UIView new];
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//    view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//    就是00010 | 10000等于10010。在判断传入的参数的地方应该是这样判断
//    
//    1
//    2
//    3
//    if ((autoresizingMask & UIViewAutoresizingFlexibleWidth) == UIViewAutoresizingFlexibleWidth) {
//        // 传入的参数中包含UIViewAutoresizingFlexibleWidth
//    }
//    
}






- (void)KvoTest{
    
    self.message.text=@"1";
    [self.message addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    self.message.text=@"2";
    
    
    
    
    
    //----
    
    self.dataArray = [NSMutableArray arrayWithObject:@"1"];
    [self addObserver:self forKeyPath:@"dataArray" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];

    
//    [self.dataArray addObserver:<#(NSObject *)#> forKeyPath:<#(NSString *)#> options:<#(NSKeyValueObservingOptions)#> context:<#(void *)#>]
}


- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"%@", keyPath);
    NSLog(@"%@", object);
    NSLog(@"%@", change);
}

// 插入数据
- (IBAction)add:(id)sender
{
    NSArray *addData = [NSArray arrayWithObjects:@"11", @"12", @"13", nil];
    [self.dataArray addObjectsFromArray:addData];
    
    self.dataArray = [NSMutableArray arrayWithObject:@"2"];
}



-(void)usedMemory{
 NSLog(@"valueForKey-%lf",usedMemory());

}



vm_size_t usedMemory(void) {
    struct task_basic_info info;
    mach_msg_type_number_t size = sizeof(info);
    kern_return_t kerr = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)&info, &size);
    return (kerr == KERN_SUCCESS) ? info.resident_size : 0; // size in bytes
}

vm_size_t freeMemory(void) {
    mach_port_t host_port = mach_host_self();
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t pagesize;
    vm_statistics_data_t vm_stat;
    
    host_page_size(host_port, &pagesize);
    (void) host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
    return vm_stat.free_count * pagesize;
}

void logMemUsage(void) {
    // compute memory usage and log if different by >= 100k
    static long prevMemUsage = 0;
    long curMemUsage = usedMemory();
    long memUsageDiff = curMemUsage - prevMemUsage;
    
    if (memUsageDiff > 100000 || memUsageDiff < -100000) {
        prevMemUsage = curMemUsage;
        NSLog(@"Memory used %7.1f (%+5.0f), free %7.1f kb", curMemUsage/1000.0f, memUsageDiff/1000.0f, freeMemory()/1000.0f);
    }
}

@end
