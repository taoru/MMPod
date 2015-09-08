//
//  AppDelegate.m
//  MMWebLoading
//
//  Created by Alan on 15/8/8.
//  Copyright (c) 2015年 Alan. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MMBaseViewController.h"
#import  "MMNavigationController.h"
#import "CCWindow.h"

#import "Post.h"
#import "FastCacheHelper.h"
#import "FileHelper.h"
#import "FileKit.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
//
- (MMBarViewController *)tabBarController {
    if (!_tabBarController) {
        _tabBarController = [[MMBarViewController alloc] init];
    }
    return _tabBarController;
}
- (UIWindow *)window {
    if (_window == nil) {
        _window = [[CCWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
    
    return _window;
}
-(void)nsstring{
    NSString *testStr1 = @"a";
    
    //方法2.类函数初始化生成:
    
    NSString *testStr2 = [NSString stringWithString:@"b"];
    
    NSString *testStr3 = [NSString stringWithFormat:@"c"];
    
    //方法3.实例方法初始化生成:
    
    NSString *testStr4 = [[NSString alloc] initWithString:@"d"];
    
    NSString *testStr5 = [[NSString alloc] initWithFormat:@"e"];
    
    
    NSLog(@"nsstring %@ %@ %@ %@ %@",testStr1,testStr2,testStr3,testStr4,testStr5);
    NSLog(@"nsstring %d %d %d %d %d",testStr1,testStr2,testStr3,testStr4,testStr5);

}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //[self setValue:@"1" forKey:@"key"];
//    NSLog(@"%@",[self])
#if defined(DEBUG)||defined(_DEBUG)
    [self nsstring];
#endif
    [[NSThread currentThread] setName:@"MM_Main_Tread"];
    [[FastCacheHelper getInstance] setCacheDir:[FileHelper getCacheDirectory]];
    BOOL  isExist = [[FileKit getInstance] isDirectoryExist:[FileHelper getCacheDirectory]];
    NSLog(@"isExist-%@-%d",[FileHelper getCacheDirectory],isExist);
    [Student registerSubclass];
    [Post registerSubclass];
//    [KVCache getInstance];
    [AVOSCloud setApplicationId:AVOSCloudAppID
                      clientKey:AVOSCloudAppKey];
    
    [AVAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    
    if ([TEST isEqualToString:@"1"]) {
        ViewController *vie=[[ViewController alloc] init];
        MMNavigationController *nav=[[MMNavigationController alloc] initWithRootViewController:vie];
        self.window.rootViewController=self.tabBarController;
        [self.window makeKeyAndVisible];
    }else{
    
        
        
    }
    
   // GHAssertEqualObjects(@"11:12", @"", @"expect time is: 11:12 actual is %@", @"");

    
    NSString *ext = [@"name.png" pathExtension];
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    NSURL *url2 = [NSURL URLWithString:@"file://www.baidu.com"];
    NSURL *url3 = [NSURL URLWithString:@"www.baidu.com"];
    
    NSLog(@"ext%@",[url3 scheme]);
    NSLog(@"ext%@",[url2 scheme]);
    
    return YES;
}
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    NSLog(@"%@, %@", application, notification);

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
