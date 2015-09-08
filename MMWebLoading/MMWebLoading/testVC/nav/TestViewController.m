//
//  TestViewController.m
//  MMWebLoading
//
//  Created by Alan on 15/8/14.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    AVObject *testObject = [AVObject objectWithClassName:@"TestObject"];
//    [testObject setObject:@"bar" forKey:@"foo"];
//    [testObject saveInBackground];
    
    // Do any additional setup after loading the view from its nib.
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
  [self dismissViewControllerAnimated:YES completion:^{
      
  }];
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
