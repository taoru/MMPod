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

//@interface Message : NSObject
//
//@property (nonatomic, copy) NSString *text;
//
//@end
//
//@implementation Message
//
//@end


@interface ViewController ()
@property (nonatomic, strong) Message *message;

@end
@implementation ViewController


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //[self showLoading];
}
void myClassIMP(id _rec, SEL _cmd, int theInt)
{
    NSLog(@"dynamic added method:%d",theInt);
}
-(void)loadView{
    [super loadView];
    //  self.view = [[[UIWebView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame] autorelease];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    int a=1;
//    NSString *str=@"123";
//    NSArray *arr=[[NSArray alloc] init];
//    NSLog(@"%@",[arr objectAtIndex:0]);
    
    //    NSObject *obj=[[NSObject alloc] init];
    //    [obj setValue:@"1" forKey:@"key"];
    //    NSLog(@"valueForKey-%@",[obj valueForKey:@"key"]);
    static char overviewKey;
    NSArray * array =[[NSArray alloc] initWithObjects:@"One", @"Two", @"Three", nil];
    //为了演示的目的，这里使用initWithFormat:来确保字符串可以被销毁
    NSString * overview = [[NSString alloc] initWithFormat:@"@",@"First three numbers"];
    objc_setAssociatedObject(self, &overviewKey, overview, OBJC_ASSOCIATION_RETAIN);
    
//    [overview release];
//    //(1) overview仍然是可用的
//    
//    [array release];
//    //(2)overview 不可用
    NSString *overview2 = (NSMutableDictionary*)objc_getAssociatedObject(self, &overviewKey);

    NSLog(@"overview2--%@",overview2);
    
    
    

    
    
    
    
    arr=[[NSMutableArray alloc] initWithObjects:@"MMGcdViewController",@"BlockViewController",@"AvosViewController", @"RunTimeViewController",@"SwiftViewController",@"SqlVC",@"MMCViewController",@"MRCViewController",nil];
    [self.datas addObjectsFromArray:arr];
    [self.tableVie reloadData];

    self.tableVie.backgroundColor=[UIColor whiteColor];

    [[CocoTest getInstance] valueAndObjectTest];

    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    str=@"1";
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
    [self pushViewControllerInTabBar:[NSString stringWithFormat:@"%@",[self.datas objectAtIndex:indexPath.row]]];
    return;
    
     
    
}

-(void)messageClick{
    NSLog(@"message");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
