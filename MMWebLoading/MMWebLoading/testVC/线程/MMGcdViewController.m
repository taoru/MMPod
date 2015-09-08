//
//  MMGcdViewController.m
//  MMWebLoading
//
//  Created by iMac on 15/9/2.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import "MMGcdViewController.h"

@interface MMGcdViewController ()

@end

@implementation MMGcdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    UInt32 loopCount = 1000;
    UInt32 loopCountFirst = 10000000;
    void (^taskFirst)(void) = ^{
        NSLog(@"taskFirst 任务开始执行\r\n");
        //延长taskFirst的运行时间
        for (UInt32 i = 0; i < loopCountFirst; i++) {
        }
        NSLog(@"taskFirst 任务结束\r\n");
    };
    void (^taskSecond)(void) = ^{
        NSLog(@"taskSecond任务开始执行\r\n");
        for (UInt32 i = 0; i < loopCount; i ++) {
        }
        NSLog(@"taskSecond 任务结束\r\n");
    };
    
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(concurrentQueue, taskFirst);
    NSLog(@"taskfirst 已经加入队列\r\n");
    dispatch_async(concurrentQueue, taskSecond);
    NSLog(@"tasksecond 已经加入队列\r\n");
    
    
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(0,0), ^{
        // 并行执行的线程一
    });
    dispatch_group_async(group, dispatch_get_global_queue(0,0), ^{
        // 并行执行的线程二
    });
    dispatch_group_notify(group, dispatch_get_global_queue(0,0), ^{
        // 汇总结果
    });
    
    dispatch_queue_t queue = dispatch_queue_create("com.dispatch.serial", DISPATCH_QUEUE_SERIAL); //生成一个串行队列，队列中的block按照先进先出（FIFO）的顺序去执行，实际上为单线程执行。第一个参数是队列的名称，在调试程序时会非常有用，所有尽量不要重名了。

    
     dispatch_queue_t queue2 = dispatch_queue_create("com.dispatch.concurrent", DISPATCH_QUEUE_CONCURRENT); //生成一个并发执行队列，block被分发到多个线程去执行

    dispatch_queue_t queue3 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0); //获得程序进程缺省产生的并发队列，可设定优先级来选择高、中、低三个优先级队列。由于是系统默认生成的，所以无法调用dispatch_resume()和dispatch_suspend()来控制执行继续或中断。需要注意的是，三个队列不代表三个线程，可能会有更多的线程。并发队列可以根据实际情况来自动产生合理的线程数，也可理解为dispatch队列实现了一个线程池的管理，对于程序逻辑是透明的。
    
    
    dispatch_queue_t queue4 = dispatch_get_main_queue(); //获得主线程的dispatch队列，实际是一个串行队列。同样无法控制主线程dispatch队列的执行继续或中断。
    
    
    dispatch_async(queue, ^{
        
        　　//block具体代码
        
    }); //异步执行block，函数立即返回
    
    dispatch_sync(queue, ^{
        
        　　//block具体代码
        
    }); //同步执行block，函数不返回，一直等到block执行完毕。编译器会根据实际情况优化代码，所以有时候你会发现block其实还在当前线程上执行，并没用产生新线程。
    
    
//    实际编程经验告诉我们，尽可能避免使用dispatch_sync，嵌套使用时还容易引起程序死锁。
//    
//    如果queue1是一个串行队列的话，这段代码立即产生死锁：
//    
//    dispatch_sync(queue1, ^{
//        
//        dispatch_sync(queue1, ^{
//            
//            　　　　......
//            
//            　　});
//        
//        　　......
//        
//        　});
//    
//    那实际运用中，一般可以用dispatch这样来写，常见的网络请求数据多线程执行模型：
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        　　//子线程中开始网络请求数据
//        
//        　　//更新数据模型
//        
//        　　dispatch_sync(dispatch_get_main_queue(), ^{
//            
//            　　　　//在主线程中更新UI代码
//            
//            　　});
//        
//    });
//    
//    程序的后台运行和UI更新代码紧凑，代码逻辑一目了然。
//    
//    
//    
//    dispatch队列是线程安全的，可以利用串行队列实现锁的功能。比如多线程写同一数据库，需要保持写入的顺序和每次写入的完整性，简单地利用串行队列即可实现：
//    
//    dispatch_queue_t queue1 = dispatch_queue_create("com.dispatch.writedb", DISPATCH_QUEUE_SERIAL);
//    
//    - (void)writeDB:(NSData *)data
//    
//    {
//        
//        　　dispatch_async(queue1, ^{
//            
//            　　　　//write database
//            
//            　　});
//        
//    }
//    
//    下一次调用writeDB:必须等到上次调用完成后才能进行，保证writeDB:方法是线程安全的。
//    
//    
//    
//    dispatch队列还实现其它一些常用函数，包括：
//    
//    void dispatch_apply(size_t iterations, dispatch_queue_t queue, void (^block)(size_t)); //重复执行block，需要注意的是这个方法是同步返回，也就是说等到所有block执行完毕才返回，如需异步返回则嵌套在dispatch_async中来使用。多个block的运行是否并发或串行执行也依赖queue的是否并发或串行。
//    
//    void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block); //这个函数可以设置同步执行的block，它会等到在它加入队列之前的block执行完毕后，才开始执行。在它之后加入队列的block，则等到这个block执行完毕后才开始执行。
//    
//    void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block); //同上，除了它是同步返回函数
//    
//    void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block); //延迟执行block
//    
//    最后再来看看dispatch队列的一个很有特色的函数：
//    
//    void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue);
//    
//    它会把需要执行的任务对象指定到不同的队列中去处理，这个任务对象可以是dispatch队列，也可以是dispatch源（以后博文会介绍）。而且这个过程可以是动态的，可以实现队列的动态调度管理等等。比如说有两个队列dispatchA和dispatchB，这时把dispatchA指派到dispatchB：
//    
//    dispatch_set_target_queue(dispatchA, dispatchB);  
//    
//    那么dispatchA上还未运行的block会在dispatchB上运行。这时如果暂停dispatchA运行：  
//    
//    dispatch_suspend(dispatchA);  
//    
//    则只会暂停dispatchA上原来的block的执行，dispatchB的block则不受影响。而如果暂停dispatchB的运行，则会暂停dispatchA的运行。
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
