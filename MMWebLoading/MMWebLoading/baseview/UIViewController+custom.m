//
//  UITableViewController+custom.m
//  PerunTB
//
//  Created by ldy on 3/22/11.
//  Copyright 2011 Hangzhou Perun Technology Co.Ltd. All rights reserved.
//

#import "UIViewController+custom.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIViewController(custom)


- (UIBarButtonItem *)rightHomeBarButton{
    return [self rightBarItemStyleButtonWithTitle:@"首页" target:self action:@selector(home:) bgImageName:@"btn_navbar.png"];
}
- (UIBarButtonItem *)leftHomeBarButton{
    return [self leftBarItemStyleButtonWithTitle:@"首页" target:self action:@selector(home:)];
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)customNavColor{
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
}

- (void)customBackBarItem{
	if (iOSVersion<__IPHONE_5_0) {
		if (self.navigationController&&[self.navigationController.viewControllers count]>=2) {
            self.navigationItem.leftBarButtonItem=[self leftBarItemStyleButtonWithImage:@"nav_back.png" target:self action:@selector(backAction)];
		}
	}
}

- (void)customBackWhiteBarItem{
    if (iOSVersion<__IPHONE_5_0) {
        if (self.navigationController&&[self.navigationController.viewControllers count]>=2) {
            self.navigationItem.leftBarButtonItem=[self leftBarItemStyleButtonWithImage:@"fanhui_bai.png" target:self action:@selector(backAction)];
        }
    }
}


- (UIBarButtonItem *)leftBarItemStyleButtonWithImage:(NSString *)imageName target:(id)target action:(SEL)action{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backImageNoraml=[[UIImage imageNamed:imageName] stretchableImageWithLeftCapWidth:17 topCapHeight:15];
    CGSize size=backImageNoraml.size;
    //UIImageNamed
    
    backButton.frame=CGRectMake(0.0, 0.0, size.width, size.height);
    [backButton setBackgroundImage:backImageNoraml forState:UIControlStateNormal];
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
- (UIBarButtonItem *)leftBarItemStyleButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action{
		UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom]; 
		UIImage *backImageNoraml=[[UIImage imageNamed:@"btn_navbar.png"] stretchableImageWithLeftCapWidth:17 topCapHeight:15];
		CGSize size=backImageNoraml.size;
		
		backButton.frame=CGRectMake(0.0, 0.0, size.width, size.height);
		[backButton setBackgroundImage:backImageNoraml forState:UIControlStateNormal];
		[backButton setTitle:title forState:UIControlStateNormal];
		[backButton setTitle:title forState:UIControlStateHighlighted];
		backButton.titleEdgeInsets=UIEdgeInsetsMake(-1, 12, 0, 0);
		backButton.titleLabel.font=[UIFont boldSystemFontOfSize:17];
		[backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
		[backButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];  
		UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];  
		temporaryBarButtonItem.style = UIBarButtonItemStyleBordered;  
		return  temporaryBarButtonItem ;
 
}

- (UIBarButtonItem *)rightBarItemStyleButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action{

		UIButton *homeButton=[UIButton buttonWithType:UIButtonTypeCustom];
		
		CGSize size=[title sizeWithFont:[UIFont boldSystemFontOfSize:13] constrainedToSize:CGSizeMake(MAXFLOAT, 15) lineBreakMode:UILineBreakModeTailTruncation];
 		UIImage *backImageNormal=[[UIImage imageNamed:@"btn_navbar.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
		homeButton.frame=CGRectMake(0.0, 0.0,backImageNormal.size.width, backImageNormal.size.height);
		[homeButton setTitle:title forState:UIControlStateNormal];
		[homeButton setTitle:title forState:UIControlStateHighlighted];
		homeButton.titleEdgeInsets=UIEdgeInsetsMake(-1, 0, 0, 0);
		[homeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[homeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
		[homeButton setTitleColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5] forState:UIControlStateDisabled];
		homeButton.titleLabel.font=[UIFont boldSystemFontOfSize:17];
		[homeButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
		UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
		temporaryBarButtonItem.style = UIBarButtonItemStyleBordered;
		return temporaryBarButtonItem;
    
}

- (UIBarButtonItem *)rightBarItemStyleButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action bgImageName:(NSString *)bgImageName{
    if ([bgImageName isEqualToString:@""]) {
        
        if (iOSVersion>=7.0) {
            UIButton *homeButton=[UIButton buttonWithType:UIButtonTypeCustom];
            homeButton.frame=CGRectMake(0.0, 0.0,60, 40);
            [homeButton setTitle:title forState:UIControlStateNormal];
            [homeButton setTitle:title forState:UIControlStateHighlighted];
            homeButton.titleEdgeInsets=UIEdgeInsetsMake(-1, 0, 0, -40);
            [homeButton setBackgroundColor:[UIColor clearColor]];
            [homeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [homeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
            //[homeButton setTitleColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5] forState:UIControlStateDisabled];
            homeButton.titleLabel.font=[UIFont boldSystemFontOfSize:17];
            [homeButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
            temporaryBarButtonItem.style = UIBarButtonItemStyleBordered;
            return temporaryBarButtonItem ;

        }else{
            UIButton *homeButton=[UIButton buttonWithType:UIButtonTypeCustom];
            homeButton.frame=CGRectMake(0.0, 0.0,60, 40);
            [homeButton setTitle:title forState:UIControlStateNormal];
            [homeButton setTitle:title forState:UIControlStateHighlighted];
            homeButton.titleEdgeInsets=UIEdgeInsetsMake(-1, 0, 0, -20);
            [homeButton setBackgroundColor:[UIColor clearColor]];
            [homeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [homeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
            //[homeButton setTitleColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5] forState:UIControlStateDisabled];
            homeButton.titleLabel.font=[UIFont boldSystemFontOfSize:17];
            [homeButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
            temporaryBarButtonItem.style = UIBarButtonItemStyleBordered;
            return temporaryBarButtonItem ;
        }
        
    }else{
        UIButton *homeButton=[UIButton buttonWithType:UIButtonTypeCustom];
		UIImage *backImageNormal;
        UIImage *backImagePressed;
        backImageNormal=[[UIImage imageNamed:bgImageName] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
        backImagePressed=[[UIImage imageNamed:[NSString stringWithFormat:@"%@",bgImageName]] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
		CGSize size=backImageNormal.size;
        
		homeButton.frame=CGRectMake(0.0, 0.0, size.width, size.height);
		[homeButton setTitle:title forState:UIControlStateNormal];
		[homeButton setTitle:title forState:UIControlStateHighlighted];
		homeButton.titleEdgeInsets=UIEdgeInsetsMake(-1, 0, 0, 0);
		[homeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		[homeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
		homeButton.titleLabel.font=[UIFont boldSystemFontOfSize:17];
		[homeButton setBackgroundImage:backImageNormal forState:UIControlStateNormal];
		[homeButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
		UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
		temporaryBarButtonItem.style = UIBarButtonItemStyleBordered;
		return temporaryBarButtonItem ;
    }
}

- (UIBarButtonItem *)liftBarItemStyleButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action bgImageName:(NSString *)bgImageName{
	
    UIButton *homeButton=[UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *backImageNormal;
    UIImage *backImagePressed;
    if ([bgImageName isEqualToString:@""]) {
        
        if (iOSVersion>=7.0) {
            homeButton.frame=CGRectMake(0.0, 0.0,65, 40);
            [homeButton setTitle:title forState:UIControlStateNormal];
            [homeButton setTitle:title forState:UIControlStateHighlighted];
            homeButton.titleEdgeInsets=UIEdgeInsetsMake(-1, -40, 0, 0);
            [homeButton setBackgroundColor:[UIColor clearColor]];
            [homeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [homeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
            //[homeButton setTitleColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5] forState:UIControlStateDisabled];
            homeButton.titleLabel.font=[UIFont boldSystemFontOfSize:17];
            [homeButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
            temporaryBarButtonItem.style = UIBarButtonItemStyleBordered;
            return temporaryBarButtonItem ;
        }else{
        
            homeButton.frame=CGRectMake(0.0, 0.0,65, 40);
            [homeButton setTitle:title forState:UIControlStateNormal];
            [homeButton setTitle:title forState:UIControlStateHighlighted];
            homeButton.titleEdgeInsets=UIEdgeInsetsMake(-1, -20, 0, 0);
            [homeButton setBackgroundColor:[UIColor clearColor]];
            [homeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [homeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
            homeButton.titleLabel.font=[UIFont boldSystemFontOfSize:17];
            [homeButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
            temporaryBarButtonItem.style = UIBarButtonItemStyleBordered;
            return temporaryBarButtonItem ;
        
        }
      
    }else{
        backImageNormal=[[UIImage imageNamed:bgImageName] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
        backImagePressed=[[UIImage imageNamed:[NSString stringWithFormat:@"%@",bgImageName]] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
        CGSize size=backImageNormal.size;
        
        homeButton.frame=CGRectMake(0.0, 0.0, size.width, size.height);
        [homeButton setTitle:title forState:UIControlStateNormal];
        [homeButton setTitle:title forState:UIControlStateHighlighted];
        homeButton.titleEdgeInsets=UIEdgeInsetsMake(-1, 0, 0, 0);
        [homeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [homeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        homeButton.titleLabel.font=[UIFont boldSystemFontOfSize:17];
        [homeButton setBackgroundImage:backImageNormal forState:UIControlStateNormal];
        [homeButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
        temporaryBarButtonItem.style = UIBarButtonItemStyleBordered;
        return temporaryBarButtonItem ;
        
    
    }
   

}

- (void)addProgressingViewWithMessage:(NSString *)msg{
 
}
- (void)removeProgressingView{
   
}
- (void)customTitle:(NSString *)title
{
	self.title=title;

    UILabel *titleView = (UILabel *)self.navigationItem.titleView;
    if (!titleView) {
        titleView = [[UILabel alloc] initWithFrame:CGRectZero];
        titleView.backgroundColor = [UIColor clearColor];
          titleView.font =  [UIFont fontWithName:FountStye size:18.0f];
        titleView.textColor =[UIColor blackColor];
		titleView.text=title;
        self.navigationItem.titleView = titleView;
    }else
		titleView.text = title;
      [titleView sizeToFit];
}
- (void)customWhiteTitle:(NSString *)title
{
    self.title=title;
    
    UILabel *titleView = (UILabel *)self.navigationItem.titleView;
    if (!titleView) {
        titleView = [[UILabel alloc] initWithFrame:CGRectZero];
        titleView.backgroundColor = [UIColor clearColor];
        titleView.font =  [UIFont fontWithName:FountStye size:18.0f];
        //  titleView.textColor = [UIColor colorWithRed:117.0/255.0 green:112.0/255.0 blue:54.0/255.0 alpha:1.0]; // Change to desired color
        titleView.textColor =[UIColor whiteColor];
        titleView.text=title;
        self.navigationItem.titleView = titleView;
    }else
        titleView.text = title;
    [titleView sizeToFit];
}
- (void)customTitle:(NSString *)title color:(NSString *)color
{
    self.title=title;
    
    UILabel *titleView = (UILabel *)self.navigationItem.titleView;
    if (!titleView) {
        titleView = [[UILabel alloc] initWithFrame:CGRectZero];
        titleView.backgroundColor = [UIColor clearColor];
        titleView.font =  [UIFont fontWithName:FountStye size:18.0f];
        titleView.text=title;
        self.navigationItem.titleView = titleView;
    }else
        titleView.text = title;
    [titleView sizeToFit];
}
- (void)showTip:(NSString *)text{
	UILabel *tipLabel=nil;
	tipLabel=(UILabel *)[self.view viewWithTag:2001];
	if (!tipLabel) {
		tipLabel=[[UILabel alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - 280)/2, (self.view.bounds.size.height-80)/2, 280, 80)];
		tipLabel.backgroundColor=[UIColor blackColor];
		tipLabel.alpha=0.8;
		tipLabel.textAlignment=UITextAlignmentCenter;
		tipLabel.textColor=[UIColor whiteColor];
		tipLabel.font=[UIFont boldSystemFontOfSize:15];
		tipLabel.minimumFontSize=10;
		tipLabel.numberOfLines=0;
		tipLabel.layer.cornerRadius=10;
		tipLabel.tag=2001;
		tipLabel.text=text;
		[self.view addSubview:tipLabel];
	}else
		tipLabel.text=text;
}

- (void) showAlertViewWithTitle:(NSString*)title message:(NSString*)message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)removeTip{
	[[self.view viewWithTag:2001] removeFromSuperview];
}
- (void)removeToast{
	UILabel *label=(UILabel *)[self.view viewWithTag:2003];
	[UIView beginAnimations:@"ToastShow" context:nil];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:1.0];
	label.frame=CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2, 0, 0);
	[UIView commitAnimations];
	[label removeFromSuperview];

}
- (void)showToast:(NSString *)text{
	UILabel *tipLabel=nil;
	tipLabel=(UILabel *)[self.view viewWithTag:2003];
	if (!tipLabel) {
		tipLabel=[[UILabel alloc] initWithFrame:CGRectMake(60, (self.view.bounds.size.height-60)/2, 180, 60)];
		tipLabel.backgroundColor=[UIColor blackColor];
		tipLabel.alpha=0.8;
		tipLabel.textAlignment=UITextAlignmentCenter;
		tipLabel.textColor=[UIColor colorWithWhite:1.0 alpha:0.8];
		tipLabel.font=[UIFont boldSystemFontOfSize:15];
		tipLabel.minimumFontSize=10;
		tipLabel.numberOfLines=0;
		tipLabel.layer.cornerRadius=5;
		tipLabel.tag=2003;
		tipLabel.text=text;
		[self.view addSubview:tipLabel];
	}else
		tipLabel.text=text;
	[self performSelector:@selector(removeToast) withObject:nil afterDelay:2.0];
}
@end
