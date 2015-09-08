//
//  BlockViewController.m
//  MMWebLoading
//
//  Created by Alan on 15/8/18.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import "BlockViewController.h"

@implementation BlockViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    __block NSMutableArray *arr=[[NSMutableArray alloc] initWithObjects:@"1", nil];
    
    NSString *str=@"str";
    void (^blockTest)(NSMutableArray *array)=^(NSMutableArray *array){
        NSLog(@"%@",arr);
        [arr addObject:@"2"];
        NSLog(@"%@",arr);

    };
    
    
    void (^blockTest2)(NSString *str)=^(NSString *str){
        NSLog(@"%@",str);
       str=@"123";
        NSLog(@"%@",str);
        
    };
    
    blockTest(arr);
    blockTest2(str);
}
@end
