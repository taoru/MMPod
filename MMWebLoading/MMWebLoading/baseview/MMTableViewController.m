//
//  MMTableViewController.m
//  Investment
//
//  Created by iMac on 15/7/21.
//
//
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#import "MMTableViewController.h"

@interface MMTableViewController ()

@end

@implementation MMTableViewController
@synthesize tableVie = _tableVie;
@synthesize datas = _datas;

- (void)configuraTableViewNormalSeparatorInset {
    if ([self validateSeparatorInset]) {
        [_tableVie setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (void)configuraSectionIndexBackgroundColorWithTableView:(UITableView *)tableView {
    if ([tableView respondsToSelector:@selector(setSectionIndexBackgroundColor:)]) {
        tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    }
}


- (void)dealloc {
    _tableVie.delegate = nil;
    _tableVie.dataSource = nil;
    _tableVie = nil;
}
- (UITableView *)tableVie {
    if (!_tableVie) {
        _tableVie = [[UITableView alloc] initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT ) style:UITableViewStylePlain];
        _tableVie.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tableVie.dataSource = self;
        _tableVie.delegate = self;
        _tableVie.separatorColor = [UIColor clearColor];
        _tableVie.backgroundColor = [UIColor clearColor];
        [self.view insertSubview:_tableVie atIndex:1];
    }
    return _tableVie;
}

-(void)getDataServer{

}

- (NSMutableArray *)datas{
    if (!_datas) {
        _datas=[[NSMutableArray alloc] initWithCapacity:0];
    }
    return _datas;
}
-(void)headerRereshing{
    self.pageIndex=1;
    [self getDataServer];
}
-(void)footerRereshing{
    self.pageIndex=self.pageIndex+1;
    [self getDataServer];
}



- (void)footerRereshing1 {
    
}

- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的headerRereshing)
//    [self.tableVie addHeaderWithTarget:self action:@selector(headerRereshing)];
//    [self.tableVie headerBeginRefreshing];
//    
//    
//    [self.tableVie addFooterWithTarget:self action:@selector(footerRereshing)];
//    
//    // 设置文字(也可以不设置,默认的文字在MJRefreshConst中修改)
//    self.tableVie.headerPullToRefreshText = @"下拉可以刷新了";
//    self.tableVie.headerReleaseToRefreshText = @"松开马上刷新了";
//    self.tableVie.headerRefreshingText = @"刷新中...";
//    
//    self.tableVie.footerPullToRefreshText = @"上拉可以加载更多数据了";
//    self.tableVie.footerReleaseToRefreshText = @"松开马上加载更多数据了";
//    self.tableVie.footerRefreshingText = @"加载中...";
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageIndex=1;
    //
   // [self setRightSwipeGestureAndAdaptive];
    [self setupRefresh];
    self.view.backgroundColor=[UIColor whiteColor];


}

- (void)showTableVie {
    self.tableVie.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableVie.frame=CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT -64);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    return cell;
}


#pragma mark - TableView Helper Method

- (BOOL)validateSeparatorInset {
    if ([_tableVie respondsToSelector:@selector(setSeparatorInset:)]) {
        return YES;
    }
    return NO;
}

@end
