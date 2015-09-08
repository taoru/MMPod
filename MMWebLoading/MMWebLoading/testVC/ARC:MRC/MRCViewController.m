//
//  MRCViewController.m
//  MMWebLoading
//
//  Created by iMac on 15/9/7.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import "MRCViewController.h"

@interface MRCViewController ()

@end

@implementation MRCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    id obj = [[NSObject alloc] init];
    void *p = obj;
    obj = p;
    [obj release];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.baidu.com"];
    CFURLRef ref = (CFURLRef)url;
    

    NSURL *url2 = [[NSURL alloc] initWithString:@"http://www.baidu.com"];
    CFURLRef ref2 = (__bridge CFURLRef)url2;
    
    
    
//    NSURL *url = [[NSURL alloc] initWithString:@"http://www.baidu.com"];
//    CFURLRef ref = (__bridge_retained CFURLRef)url;
//    CFRelease(ref);
    
    
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
