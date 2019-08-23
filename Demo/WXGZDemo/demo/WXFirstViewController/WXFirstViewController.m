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
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self testBaidu];
        [self testHttpsbaidu];
    });
    
}
- (void)testBaidu
{
    //www.baidu.com  a.b.c
    //baidu.com
    //    NSURL *url = [NSURL URLWithString:@"https://wenku.baidu.com"];
    NSURL *url = [NSURL URLWithString:@"https://www.qq.com"];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    //4.根据会话对象创建一个Task(发送请求）
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:req];
    
    //5.执行任务
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [dataTask resume];
    });
}
- (void)testHttpsbaidu
{
    NSURL *url = [NSURL URLWithString:@"http://14.215.177.38"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    //4.根据会话对象创建一个Task(发送请求）
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:req];
    
    //5.执行任务
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [dataTask resume];
    });
}

- (void)addLeftItem
{
    
    
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

- (CGFloat)itemH
{
    CGFloat margin = WXItemMargin;
    NSInteger lineNum = WXItemColumn;
    return  (kHLScreenFrameWidth - (lineNum + 2) * margin)/3.0;
}
@end
