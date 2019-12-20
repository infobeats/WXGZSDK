//
//  WXBannerColCell.m
//  IDataVisibleBurialPointSDKTestDemo
//
//  Created by songxuhua on 2019/6/24.
//  Copyright © 2019 devstore. All rights reserved.
//

#import "WXBannerColCell.h"


@interface WXBannerColCell () {
    
}

@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imgview;

@end

@implementation WXBannerColCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self addGes];
    // Initialization code
}

- (void)addGes {
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBanner:)];
    [self.imgview  addGestureRecognizer:tapGes];
}

- (void)clickBanner:(id)sender {
    
    NSLog(@"clickBanner_colcell");

}

- (void)cellWillDisplay:(NSInteger)rowIndex {
    self.descLabel.text = [NSString stringWithFormat:@"我是colectionview里第%ld个图片",rowIndex];
}

@end
