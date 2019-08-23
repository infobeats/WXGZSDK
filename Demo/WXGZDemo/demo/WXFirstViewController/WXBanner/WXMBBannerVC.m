//
//  WXMBBannerVC.m
//  IDataVisibleBurialPointSDKTestDemo
//
//  Created by songxuhua on 2019/6/24.
//  Copyright © 2019 devstore. All rights reserved.
//

#import "WXMBBannerVC.h"
#import "WXBannerColCell.h"
#import "WXScreenSizeManager.h"

static NSString *WXBannerColCellInden = @"WXBannerColCell";

#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScrollHeight 200

@interface WXMBBannerVC () <UICollectionViewDelegate,UICollectionViewDataSource>


@property (nonatomic,strong)UIScrollView *scrollview;

@property (nonatomic,strong)UICollectionView *collectionView;


@end

@implementation WXMBBannerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self setUpScrollview];
    [self setUpColView];
    // Do any additional setup after loading the view.
}

#pragma mark - 设置界面
- (void)setUpColView {
    [self.view addSubview:self.collectionView];
}

- (void)setUpScrollview {
    [self.view addSubview:self.scrollview];
    NSInteger count = 10;
    for (NSInteger i = 0; i < count; i++) {
        UIImageView *imgview = [self createTouchImgview:i];
        [self.scrollview addSubview:imgview];
    }
    self.scrollview.contentSize = CGSizeMake(count * KScreenWidth, KScrollHeight);
    
}

- (UIImageView *)createTouchImgview:(NSInteger)index {
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(index * KScreenWidth, 0, KScreenWidth, KScrollHeight);
    imageView.backgroundColor = [UIColor whiteColor];
    imageView.userInteractionEnabled = true;
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBanner:)];
    [imageView addGestureRecognizer:tapGes];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((KScreenWidth - 200)/2.0, (KScrollHeight - 20)/2.0, 200, 20)];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.text = [NSString stringWithFormat:@"我是Scrollview里第%ld涨图",(long)index];
    
    [imageView addSubview:label];
    
    return imageView;
}

- (void)clickBanner:(UIGestureRecognizer *)ges {
    NSLog(@"clickBanner");
}

#pragma mark - get
- (UIScrollView *)scrollview {
    if (_scrollview == nil) {
        _scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, [WXScreenSizeManager navigationBarHeight], KScreenWidth, KScrollHeight)];
        _scrollview.pagingEnabled = YES;
    }
    return _scrollview;
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(KScreenWidth, KScrollHeight);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(self.scrollview.frame) + 10, KScreenWidth, KScrollHeight) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:WXBannerColCellInden bundle:nil] forCellWithReuseIdentifier:WXBannerColCellInden];
        _collectionView.pagingEnabled = YES;
    }
    return _collectionView;
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    WXBannerColCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:WXBannerColCellInden forIndexPath:indexPath];
    [cell cellWillDisplay:indexPath.row];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}


@end
