//
//  ViewController.m
//  MMWebLoading
//
//  Created by Alan on 15/8/8.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import "ViewController.h"
#import "MMObject.h"
#import "NSObject+KVO.h"
#import "mach/mach.h"
#import "FastCacheHelper.h"




@interface ViewController2 ()

@end
@implementation ViewController2


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //[self showLoading];
}

-(void)loadView{
    [super loadView];
    //  self.view = [[[UIWebView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame] autorelease];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    
    
    
    
    
    
    NSMutableArray  *arr=[[NSMutableArray alloc] initWithObjects:@"导航",@"web",@"motai",@"block",nil];
    [self.datas addObjectsFromArray:arr];
    [self.tableVie reloadData];
    
    
    
    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
}



#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.datas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomePageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"HomePageTableViewCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomePageTableViewCell" owner:self options:nil] firstObject];//xlb方法做，无需代码在码界面
    }
    cell.backgroundColor=[UIColor redColor];
    cell.textLabel.text=[self.datas objectAtIndex:indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        // TestViewController *testVie=[[TestViewController alloc] init];
        // return;
        //        [self pushViewController:@"TestViewController"];
        
        
        CATransition *animation = [CATransition animation];
        [animation setDuration:0.5];
        [animation setType:kCATransitionMoveIn]; //淡入淡出
        [animation setSubtype:kCATransitionFromLeft];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
        TestViewController *Emeraency=[[TestViewController alloc] init];
        [self.navigationController pushViewController:Emeraency animated:NO];
        [self.navigationController.view.layer addAnimation:animation forKey:nil];
    }else if (indexPath.row == 1) {
        // TestViewController *testVie=[[TestViewController alloc] init];
        
        
        NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.baidu.com"]];
        SVWebViewController *webViewController = [[SVWebViewController alloc] initWithURL:URL];
        [self.navigationController pushViewController:webViewController animated:YES];
        return;
        [self pushViewControllerInTabBar:@"WebViewController"];
    }else  if (indexPath.row == 2) {
        // TestViewController *testVie=[[TestViewController alloc] init];
        TestViewController *vc = [[TestViewController alloc] init] ;
        UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:vc];
        //vc.view.backgroundColor = [UIColor clearColor];
        //vc.modalPresentationStyle = UIModalPresentationCurrentContext;
        [self presentViewController:nav animated:YES completion:^{
            
        }];
    }    

}

-(void)messageClick{
    NSLog(@"message");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
