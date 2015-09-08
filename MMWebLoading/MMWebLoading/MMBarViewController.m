//
//  MMBarViewController.m
//  MMWebLoading
//
//  Created by iMac on 15/9/7.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import "MMBarViewController.h"
@interface MMBarViewController ()

@end

@implementation MMBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.homePageController = [[ViewController alloc]init];
    UINavigationController  *home = [[UINavigationController alloc] initWithRootViewController:self.homePageController];
    //home.fd_viewControllerBasedNavigationBarAppearanceEnabled=YES;
   // home.fd_interactivePopDisabled = YES;

    self.tenderController = [[ViewController2 alloc] init];
    UINavigationController *tender = [[UINavigationController alloc] initWithRootViewController:self.tenderController];
    
    self.accountController = [[ThreeViewController alloc] init];
    UINavigationController *account = [[UINavigationController alloc] initWithRootViewController:self.accountController];
    
    self.viewControllers = [NSArray arrayWithObjects:home,tender,account, nil];
    self.delegate = self;
    for (int i=0; i<3; i++) {
        UITabBarItem *item=[self.tabBar.items objectAtIndex:i];
        UIImage *SelectedImage= [UIImage imageNamed:[NSString stringWithFormat:@"nav_%db.png",i+1]];
        UIImage *UnselectedImage= [UIImage imageNamed:[NSString stringWithFormat:@"nav_%da.png",i+1]];//
        SelectedImage = [SelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UnselectedImage = [UnselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [item setFinishedSelectedImage:SelectedImage withFinishedUnselectedImage:UnselectedImage];
        if(i==2){
            [item setTitle:@"vc"];
        }
        if(i==1){
            [item setTitle:@"Svc"];
        }
        if(i==0){
            [item setTitle:@"setting"];
        }
      
    }
    
    
    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.tabBar insertSubview:bgView atIndex:0];
    self.tabBar.opaque = YES;

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
