//
//  MMBaseViewController.m
//  Investment
//
//  Created by iMac on 15/7/15.
//
//

#import "MMBaseViewController.h"
@interface MMBaseViewController ()

@end

@implementation MMBaseViewController


-(void)hideNavBar{
    self.navigationController.navigationBar.hidden=YES;
}

-(void)showAutoDisplayAlert:(NSString *)message{
}

- (void)BackBarItem{
    if (iOSVersion<__IPHONE_5_0) {
        if (self.navigationController&&[self.navigationController.viewControllers count]>=2) {
            self.navigationItem.leftBarButtonItem=[self leftBarItemStyleButtonWithImage1:@"nav_back.png" target:self action:@selector(backAction)];
        }
    }
}
- (UIBarButtonItem *)leftBarItemStyleButtonWithImage1:(NSString *)imageName target:(id)target action:(SEL)action{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backImageNoraml=[[UIImage imageNamed:imageName] stretchableImageWithLeftCapWidth:17 topCapHeight:15];
    CGSize size=backImageNoraml.size;
    //UIImageNamed
    
    backButton.frame=CGRectMake(0.0, 0.0, size.width, size.height);
    [backButton setBackgroundImage:backImageNoraml forState:UIControlStateNormal];
    backButton.titleLabel.lineBreakMode=UILineBreakModeTailTruncation;
    [backButton setBackgroundImage:backImageNoraml  forState:UIControlStateNormal];
    backButton.titleEdgeInsets=UIEdgeInsetsMake(-1, 12, 0, 0);
    backButton.titleLabel.font=[UIFont boldSystemFontOfSize:17];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    temporaryBarButtonItem.style = UIBarButtonItemStyleBordered;
    return  temporaryBarButtonItem ;
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)hideWaitView{
}

-(void)showWaitView{
}


-(void) doSomeStuff:(Getblock)sucessblock string:(NSString *)str{
    sucessblock(@"sucessblock");
    
}

- (void)dealWithStuff:(void (^)(void))finishBlock doubleTime:(double)delayInSeconds {
    // double delayInSeconds= 10.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        finishBlock();
    });
    
    
}
- (void)Reachability {
   }

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout=NO;
    [self setBackgroudColor];
   // [self setRightSwipeGestureAndAdaptive];
    //[self Reachability];
}

-(void)setBackgroudColor{
    
    self.view.backgroundColor=[UIColor whiteColor];
}

- (void)showAlert:(NSString*)string
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:string
                                                   delegate:nil
                                          cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];

}
- (void)showmyAlert:(NSString*)string
{
//    MyAlert * alert=[[MyAlert alloc]initMyAlertWithTitle:@"温馨提示" delegate:self cancelButtonTitle:@"取消" otherButtonTitle:@"确定"];
//    alert.missTime=50;
//    [alert show];
}


- (UIView*)setTitleView:(NSString*)text iconPositionX:(int)pointX
{
    
    UIImageView *titleIcon = [[UIImageView alloc] initWithFrame:CGRectMake(pointX, 9, 42, 27)];
    [titleIcon setImage:[UIImage imageNamed:@"titleIcon"]];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(pointX+44, 0, 320-90, 44)];
    title.text = text;
    title.backgroundColor = [UIColor clearColor];
    title.textColor = [UIColor whiteColor];
    
    __autoreleasing UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    [titleView addSubview:titleIcon];
    [titleView addSubview:title];
    
    return titleView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)popViewController{
  
}

-(void)popViewControllerAnimated{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setRightSwipeGesture
{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(goback:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
}
-(void)goback:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)adaptive{
    if (IOS7)
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.view.frame = [UIScreen mainScreen].bounds;
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    else if(IOS6)
    {
        self.view.frame = [UIScreen mainScreen].applicationFrame;
    }
}
-(void)setRightSwipeGestureAndAdaptive
{
//    [self adaptive];
    [self setRightSwipeGesture];
}



-(void)pushViewControllerInTabBar:(NSString *)viewControlle{
    UIViewController *viewController=[[NSClassFromString(viewControlle) alloc] init];
    viewController.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:viewController animated:YES];
}
-(void)pushViewController:(NSString *)viewControlle{
    UIViewController *viewController=[[NSClassFromString(viewControlle) alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
//    [self.navigationController customPushViewController:viewController];

}
@end
