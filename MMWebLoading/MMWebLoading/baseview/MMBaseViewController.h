//
//  MMBaseViewController.h
//  Investment
//
//  Created by iMac on 15/7/15.
//
//

#import <UIKit/UIKit.h>
//#import "ui"
#define IOS6                  ([[[UIDevice currentDevice] systemVersion] floatValue] < 7)?YES:NO
#define IOS7                  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)?YES:NO
#define IOS8                  ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)?YES:NO


typedef void (^Getblock) (NSString *resultStr);

@interface MMBaseViewController : UIViewController


-(void)hideNavBar;
- (void)BackBarItem;
-(void)showAutoDisplayAlert:(NSString *)message;
-(void)hideWaitView;
-(void)showWaitView;
- (UIView*)setTitleView:(NSString*)text iconPositionX:(int)pointX;
- (void)showAlert:(NSString*)string;
- (void)showmyAlert:(NSString*)string;

- (void)dealWithStuff:(void (^)(void))finishBlock doubleTime:(double)delayInSeconds;
-(void) doSomeStuff:(Getblock)sucessblock string:(NSString *)str;
- (void)popViewController;
-(void)setRightSwipeGesture;
-(void)setRightSwipeGestureAndAdaptive;

-(void)pushViewController:(NSString *)viewControlle;
-(void)pushViewControllerInTabBar:(NSString *)viewControlle;


@end
