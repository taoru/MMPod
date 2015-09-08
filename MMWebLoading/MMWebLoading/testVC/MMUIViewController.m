//
//  MMUIViewController.m
//  MMWebLoading
//
//  Created by iMac on 15/9/1.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import "MMUIViewController.h"
#import "OBShapedButton.h"

@interface MMUIViewController ()

@end

@implementation MMUIViewController

-(void)btnLong:(UILongPressGestureRecognizer *)longPress
{
    if (longPress.state == UIGestureRecognizerStateBegan) {
        UIButton *newBTN =(UIButton *) longPress.view;
        NSLog(@"长按按钮的tag值:%d",newBTN.tag);
    }
    
}

-(void)btnShort:(UIButton *)newBtn
{
    NSLog(@"短按按钮的tag值%d",newBtn.tag);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(btnLong:)];
    longPress.minimumPressDuration = 1; //定义按的时间
    
    OBShapedButton *newButton = [[OBShapedButton alloc]initWithFrame:CGRectMake(200, 200.0, 100, 100)];
    newButton.tag = 200;
    
    [newButton setBackgroundImage:[UIImage imageNamed:@"button-normal"] forState:UIControlStateNormal];
    [newButton setBackgroundImage:[UIImage imageNamed:@"button-highlighted"] forState:UIControlStateHighlighted];
    
    [newButton addGestureRecognizer:longPress];
    [newButton addTarget:self action:@selector(btnShort:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [self.view addSubview:newButton];
  
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
