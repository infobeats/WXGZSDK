//
//  WXSlideVC.m
//  IDataVisibleBurialPointSDKTestDemo
//
//  Created by songxuhua on 2019/8/2.
//  Copyright © 2019 devstore. All rights reserved.
//

#import "WXSlideVC.h"

@interface WXSlideVC ()

@property (weak, nonatomic) IBOutlet UISwitch *switchBtn;

@end

@implementation WXSlideVC


- (instancetype)init
{
    self = [super initWithNibName:@"WXSlideVC" bundle:nil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
  
}

- (IBAction)progressChange:(id)sender {
    UISlider *slider = (UISlider *)sender;
    
//    NSLog(@"slider %f",slider.value);
}

- (IBAction)touchcancel:(id)sender {
    NSLog(@"touchcancel");
}

- (IBAction)touchOutSide:(id)sender {
    NSLog(@"touchOutSide");
}

- (IBAction)touchInside:(id)sender {
    NSLog(@"touchInside");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (IBAction)valueChanged:(id)sender {
    NSLog(@"valueChanged");
    
}

@end
