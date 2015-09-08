//
//  SwiftViewController.m
//  MMWebLoading
//
//  Created by Alan on 15/8/24.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import "SwiftViewController.h"
//#import "RootViewController1.swift"
#import "MMWebLoading-Swift.h"

//#import "MMWebLoading-Bridging-Header.h"
@implementation SwiftViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
 //   Demo *d2=[[Demo alloc] initWithName:@"1"];
    
 //   NSLog(@"the instance is [%@]", d2.description);

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.navigationController pushViewController:nil animated:YES];
}
@end
