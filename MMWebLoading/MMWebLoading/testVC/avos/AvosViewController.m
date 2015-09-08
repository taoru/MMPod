//
//  AvosViewController.m
//  MMWebLoading
//
//  Created by Alan on 15/8/22.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import "AvosViewController.h"

@implementation AvosViewController
- (void)saveCallback:(NSNumber *)result error:(NSError *)error {
    if (!error) {
        // post 保存成功
        NSLog(@"存成功");

    } else {
        // 保存 post 时出错
        NSLog(@"出错");

    }
}


- (AVObject *)saveAvobj {
    //    AVObject *testObject = [AVObject objectWithClassName:@"TestObject1"];
    //    [testObject setObject:@"bar" forKey:@"foo"];
    //    
    //    [testObject saveInBackgroundWithTarget:self
    //                            selector:@selector(saveCallback:error:)];
    
    AVObject *post = [AVObject objectWithClassName:@"user"];
    [post setObject:@"18813025125" forKey:@"mobile"];
    [post setObject:@"hu9808395" forKey:@"password"];
    [post setObject:[NSNumber numberWithInt:1435541999] forKey:@"pubTimestamp"];
    [post setObject:[NSNumber numberWithInt:0] forKey:@"upvotes"]; //初始值为 0
    [post saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        // 增加点赞的人数
        [post incrementKey:@"upvotes"];
        [post saveInBackground];
    }];
    return post;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  //   [self saveAvobj];

//    AVQuery *query = [AVQuery queryWithClassName:@"Post"];
//    AVObject *post = [query getObjectWithId:@"558e20cbe4b060308e3eb36c"];
//    int timestamp = [[post objectForKey:@"pubTimestamp"] intValue];
//    NSString *userName = [post objectForKey:@"pubUser"];
//    NSString *content = post[@"content"];
//    NSLog(@"%@--%@",[post allKeys],userName);
    
    
    
    
//  NSArray *arr=  [query findObjects];
//  NSLog(@"%@",arr);
//    
    
    [self selectRows1];

    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(0, 0, 100, 100);
    [btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.backgroundColor=[UIColor yellowColor];
    
    
    
    UIButton *btn2=[UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame=CGRectMake(150, 0, 100, 100);
    [btn2 addTarget:self action:@selector(btn2click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    btn2.backgroundColor=[UIColor yellowColor];
    // Do any additional setup after loading the view from its nib.
}
- (void)btnclick
{
//    Class cl= NSClassFromString(@"AVSearchQueryAdvanced");
//    if (cl) {
//       AVSearchQueryAdvanced  *controller=[[AVSearchQueryAdvanced alloc] init];
//      [self.navigationController pushViewController:controller animated:YES];
//
//    }
}

- (void)btn2click
{
    PBWebViewController *vc = [[PBWebViewController alloc] init];
    vc.URL = [NSURL URLWithString:@"http://www.baidu.com"];
    [self.navigationController pushViewController:vc animated:YES];

}
- (void)selectRows1
{
    AVQuery *query = [AVQuery queryWithClassName:@"Post"];
    [query whereKey:@"pubUser" equalTo:@"LeanCloud官方客服"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // 检索成功
            NSLog(@"Successfully retrieved %d posts.", objects.count);
        } else {
            // 输出错误信息
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    
//    VZWebViewC *wc= [[VZWebViewC alloc] init];
//    [wc loadURL:@"http://www.baidu.com"];
//    
//    
    
    
    NSDictionary *config=[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"DemoConfig" ofType:@"plist"]];
    
    NSMutableArray *tabs=[NSMutableArray array];
    NSArray *keys=[config allKeys];
    DemoListC *listC;
    UIViewController * controller;
    NSLog(@"%@",keys);
    for (int i=0; i<keys.count-1; i++) {
        NSString *key=keys[i];
        id object =config[key];
        if ([object isKindOfClass:[NSArray class]]) {
            listC=[[DemoListC alloc] init];
            listC.title=NSLocalizedString(key, nil);
            listC.tabBarItem.image=[UIImage imageNamed:@"cloud"];
            
            listC.contents=object;
            [tabs addObject:listC];
        }else if ([object isKindOfClass:[NSString class]]) {
            Class cl= NSClassFromString(object);
            if (cl) {
                 controller=[[cl alloc] init];
                controller.title=NSLocalizedString(key, nil);
                [tabs addObject:controller];
            }
        }
    }

//    DemoListC  *wc= [[DemoListC alloc] init];
//
    [self.navigationController pushViewController:listC animated:YES];
}


- (void)selectRows {
//    NSString *cql = [NSString stringWithFormat:@"select mobile from %@ where mobile = "%@"", @"user",@"18813025125"];
  NSString *cql = [NSString stringWithFormat:@"select mobile from %@ ", @"user"];
   [AVQuery doCloudQueryInBackgroundWithCQL:cql callback:^(AVCloudQueryResult *result, NSError *error) {
        NSLog(@"%@",result.results);
  
       //NSString *mobile=[]

    }];
    
}
@end
