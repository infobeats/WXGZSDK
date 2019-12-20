//
//  WXViewController1.m
//
//  Created by 谭建中 on 1/4/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import "WXFirstViewController.h"
#import "WXTableViewCell.h"
#import "WXBtnViewController.h"
#import "WXTFTableViewController.h"
#import "WXImageTableViewController.h"
#import "WXSwitchTableViewController.h"
#import "WXSegmentTableViewController.h"
#import "WXLinkViewController.h"
#import "WXTextTableViewController.h"
#import "WXUseInfoViewController.h"
#import "WXHomeCellContentViewCell.h"
#import "WXItem.h"
#import "WXMacro.h"
#import "WXEnvConfigTools.h"
#import <NetworkExtension/NetworkExtension.h>



@interface WXFirstViewController ()<UITableViewDataSource,UITableViewDelegate,NSURLSessionDelegate>
@property (nonatomic, strong) UITableView *tabView;
@property (nonatomic, strong) NSMutableArray *dataSource1;
@property (nonatomic, strong) NSMutableArray *dataSource2;

@end

@implementation WXFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tabView];
    _dataSource1 = [WXItem getSection1].mutableCopy;
    _dataSource2 =[WXItem getSection2].mutableCopy;
    self.view.backgroundColor = WXBackColor;
    
 
 
    [self addLeftItem];
    
//    [self addTitle];

}

//- (void)addTitle {
//    UIButton *btn1 = [[UIButton alloc] init];
//    btn1.titleLabel.font = [UIFont systemFontOfSize:16];
//    [btn1 addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
//    [btn1 setTitle:@" title" forState:UIControlStateNormal];
//    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btn1 sizeToFit];
//    btn1.tintColor = [UIColor whiteColor];
//    self.navigationItem.titleView = btn1;
//}
//
//- (void)addRightItem {
//    UIButton *btn1 = [[UIButton alloc] init];
//    btn1.titleLabel.font = [UIFont systemFontOfSize:16];
//    [btn1 addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
//    [btn1 setTitle:@" 刷新" forState:UIControlStateNormal];
//    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btn1 sizeToFit];
//    UIBarButtonItem *back1 = [[UIBarButtonItem alloc] initWithCustomView:btn1];
//    btn1.tintColor = [UIColor whiteColor];
//
//    UIBarButtonItem *rightItem3 = [[UIBarButtonItem alloc] initWithTitle:@"k加载" style:UIBarButtonItemStylePlain target:self action:@selector(clickItem2)];
//
//    self.navigationItem.leftBarButtonItems = @[back1];
//
//}

- (void)addLeftItem {
        UIButton *btn = [[UIButton alloc] init];
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [btn addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"崩溃" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

        [btn sizeToFit];
        UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:btn];
        self.navigationItem.rightBarButtonItem = back;

//    UIBarButtonItem *rightItem2 = [[UIBarButtonItem alloc] initWithTitle:@"k加载1" style:UIBarButtonItemStylePlain target:self action:@selector(clickItem2)];
//
//
//    UIBarButtonItem *rightItem3 = [[UIBarButtonItem alloc] initWithTitle:@"k加载" style:UIBarButtonItemStylePlain target:self action:@selector(clickItem2)];
//    UIBarButtonItem *rightItem4 = [[UIBarButtonItem alloc] initWithTitle:@"k加载2" style:UIBarButtonItemStylePlain target:self action:@selector(clickItem2)];

    
//    UIButton *btn2 = [[UIButton alloc] init];
//    btn2.titleLabel.font = [UIFont systemFontOfSize:16];
//    [btn2 addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
//    [btn2 setTitle:@" 返回2" forState:UIControlStateNormal];
//    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//
//    [btn2 sizeToFit];
//    UIBarButtonItem *back2 = [[UIBarButtonItem alloc] initWithCustomView:btn2];
//
    self.navigationItem.rightBarButtonItem = back;
//    self.navigationItem.rightBarButtonItems = @[rightItem2,rightItem3,rightItem4];

}


- (void)clickItem2 {
    
}

//- (void)leftClick {
//    NSLog(@"leftClick");
//}

- (void)rightClick {
    NSLog(@"rightClick");
}




#pragma mark - NSURLSessionDelegate
- (UITableView *)tabView
{
    if (_tabView == nil) {
        
        _tabView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tabView.frame =  [UIScreen mainScreen].bounds;
        _tabView.backgroundColor = WXBackColor;
        _tabView.dataSource = self;
         _tabView.delegate = self;
        _tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tabView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    WXHomeCellContentViewCell *cell = [[WXHomeCellContentViewCell alloc] init];
    cell.backgroundColor = WXBackColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSMutableArray *data = nil;
    
    indexPath.section ? (data = _dataSource2) : (data = _dataSource1);
    [cell setItem:data clickBlock:^(WXItem * obj) {
        if ([obj.vcClass isEqualToString:@"WXEnvConfigTools"]) {
            [[WXEnvConfigTools sharedInstance] show];
            return ;
        }
        if (obj.vcClass) {
            UIViewController *vc = [[NSClassFromString(obj.vcClass) alloc] init];
            vc.title = obj.title;
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NSInteger row = (_dataSource1.count - 1)/WXItemColumn + 1;
        //2*2是上下是两个单位margin
        return [self itemH] * row + (2 * 2 + row - 1 ) * WXItemMargin;
    }
    NSInteger row = (_dataSource2.count - 1)/WXItemColumn + 1;
    
    return [self itemH] * row + (2 * 2 + row - 1 ) * WXItemMargin;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 28;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(16,0,100,28);
    label.numberOfLines = 0;
    NSString *title ;
    if (section == 0) {
        title = @"页面元素";
    }else{
        title  = @"工具";
    }
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:title attributes: @{NSFontAttributeName: [UIFont systemFontOfSize:20],NSForegroundColorAttributeName: [UIColor colorWithRed:32/255.0 green:40/255.0 blue:49/255.0 alpha:1.0]}];
    
    label.attributedText = string;
    label.textAlignment = NSTextAlignmentLeft;
    label.alpha = 1.0;
    label.backgroundColor = [UIColor clearColor];
    CGRect frame = [UIScreen mainScreen].bounds;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 28)];
    view.backgroundColor = WXBackColor;
    [view addSubview:label];
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    CGRect frame = [UIScreen mainScreen].bounds;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 0)];
    view.backgroundColor = WXBackColor;
    return view;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)itemH
{
    CGFloat margin = WXItemMargin;
    NSInteger lineNum = WXItemColumn;
    return  (kHLScreenFrameWidth - (lineNum + 2) * margin)/3.0;
}
@end
