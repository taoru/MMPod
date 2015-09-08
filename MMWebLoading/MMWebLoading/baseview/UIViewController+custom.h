//
//  UITableViewController+custom.h
//  PerunTB
//
//  Created by ldy on 3/22/11.
//  Copyright 2011 Hangzhou Perun Technology Co.Ltd. All rights reserved.
//
#define FountStye  @"TrebuchetMS-Bold"

#import <Foundation/Foundation.h>
/**
 UIViewController扩展类目(主要胜于自定义视图导航上的左右导航按钮)
 @author robot
 */
@interface UIViewController(custom)

- (void)customWhiteTitle:(NSString *)title;
- (void)customBackWhiteBarItem;
- (void)customTitle:(NSString *)title color:(NSString *)color;

- (void)customNavColor;
/**
 *自定义返回按钮
 */
- (void)customBackBarItem;
- (UIBarButtonItem *)rightBarItemStyleButtonTarget:(id)target action:(SEL)action;
/**
 *创建导航栏右侧导航按钮
 */
- (UIBarButtonItem *)rightHomeBarButton;
/**
 *创建导航栏左侧返回主页按钮
 */
- (UIBarButtonItem *)leftHomeBarButton;
/**
 *创建导航栏左侧导航按钮
 *@param	title	按钮标题
 *@param	target	按钮事件响应者
 *@param	target 响应者处理事件的动作(方法)
 *@return UIBarButtonItem
 */
- (UIBarButtonItem *)leftBarItemStyleButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;

- (UIBarButtonItem *)leftBarItemStyleButtonWithImage:(NSString *)imageName target:(id)target action:(SEL)action;

/**
 *创建导航栏右侧导航按钮
 *@param	title	按钮标题
 *@param	target	按钮事件响应者
 *@param	target 响应者处理事件的动作(方法)
 *@return UIBarButtonItem
 */
- (UIBarButtonItem *)rightBarItemStyleButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action;

- (UIBarButtonItem *)rightBarItemStyleButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action bgImageName:(NSString *)bgImageName;
/**
 *显示alertView
 *@param title alert标题
 *@param message alert内容
 */

- (void) showAlertViewWithTitle:(NSString*)title message:(NSString*)message;
/**
 *添加等待框
 *@param msg 进度信息
 */
- (void)addProgressingViewWithMessage:(NSString *)msg;
/**
 *移除等待框
 */
- (void)removeProgressingView;
/**
 *自定义导航栏标题
 *@param title	标题名称
 */
- (void)customTitle:(NSString *)title;
/**
 *显示提示
 *@param	text 提示内容
 */
- (void)showTip:(NSString *)text;
/**
 *移除提示
 */
- (void)removeTip;

- (void)showToast:(NSString *)text;

- (UIBarButtonItem *)liftBarItemStyleButtonWithTitle:(NSString *)title target:(id)target action:(SEL)action bgImageName:(NSString *)bgImageName;
@end
