//
//  WXBaseTableViewController.m
//
//  Created by 谭建中 on 3/4/2019.
//  Copyright © 2019 ijiami. All rights reserved.
//

#import "WXBaseTableViewController.h"
#import "UIColor+DCColorChange.h"
#import "UIImage+SGColorImage.h"

@interface WXBaseTableViewController ()

@end

@implementation WXBaseTableViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
 
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;

//    [self addRightItem];
    [self addLeftItem];
    
    
}
- (void)addLeftItem
{
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    UIImage *image = [UIImage imageNamed:@"图标／44px／箭头黑色"];
    btn.backgroundColor = [UIColor clearColor];
    [btn setImage:image forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0 ,-45,0,0);

    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithCustomView:btn];
    back.tintColor = [UIColor whiteColor];

    UIBarButtonItem *fixItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixItem.width = -30;
    
    NSString *version = [UIDevice currentDevice].systemVersion;
    if (version.doubleValue >= 10.0) {
        // 针对 10.0 以上的iOS系统进行处理
        self.navigationItem.leftBarButtonItems = @[fixItem,back];
    } else {
        self.navigationItem.leftBarButtonItem = back;
    }
    
//     UIBarButtonItem *rightItem1 = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(clickItem1)];
//    
//    
//    
//    self.navigationItem.leftBarButtonItems = @[rightItem1,back];
    
//    [self addTitle];
    
    
}


- (void)refresh {
    NSLog(@"refresh");
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)addRightItem
{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"测试" style:UIBarButtonItemStylePlain target:self action:@selector(clickItem)];
    
    UIBarButtonItem *rightItem1 = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(clickItem1)];

    UIBarButtonItem *rightItem3 = [[UIBarButtonItem alloc] initWithTitle:@"k加载" style:UIBarButtonItemStylePlain target:self action:@selector(clickItem2)];

    
    rightItem.tintColor = [UIColor colorWithRed:69/255.0 green:73/255.0 blue:76/255.0 alpha:1];
//    self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationItem.rightBarButtonItems = @[rightItem,rightItem1,rightItem3];

    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:16],NSFontAttributeName, nil] forState:UIControlStateNormal];

}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //恢复到默认的设置
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
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

- (void)rightClick {
    
    
}

- (void)clickItem {
    NSLog(@"测试");
}

- (void)clickItem1 {
    NSLog(@"刷新");
}

- (void)clickItem2 {
    NSLog(@"加载");
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    self.tableView.tableHeaderView = [UIView new];
    self.tableView.tableFooterView = [UIView new];
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tableView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width,self.tabViewContentH);
    
}
@end
