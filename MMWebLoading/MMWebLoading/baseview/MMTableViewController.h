//
//  MMTableViewController.h
//  Investment
//
//  Created by iMac on 15/7/21.
//
//

#import <UIKit/UIKit.h>

@interface MMTableViewController : MMBaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign) int   pageIndex;

@property (nonatomic , readonly) UITableView *tableVie;
/**
 *  大量数据的数据源
 */
@property (nonatomic , readonly) NSMutableArray *datas;

/**
 *  初始化init的时候设置tableView的样式才有效
 */
@property (nonatomic, assign) UITableViewStyle tableViewStyle;

/**
 *  去除iOS7新的功能api，tableView的分割线变成iOS6正常的样式
 */
- (void)configuraTableViewNormalSeparatorInset;

/**
 *  配置tableView右侧的index title 背景颜色，因为在iOS7有白色底色，iOS6没有
 *
 *  @param tableView 目标tableView
 */
- (void)configuraSectionIndexBackgroundColorWithTableView:(UITableView *)tableView;

-(void)getDataServer;

- (void)showTableVie;


@end
