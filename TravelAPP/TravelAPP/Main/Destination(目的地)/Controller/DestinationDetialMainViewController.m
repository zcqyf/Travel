//
//  DestinationDetialMainViewController.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/8.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "DestinationDetialMainViewController.h"
#import "DestinationMallViewController.h"
#import "DestinationShouCangViewController.h"
#import "DestinationDetialViewController.h"

@interface DestinationDetialMainViewController ()

@end

@implementation DestinationDetialMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.selecterToolScrollView];
    [self.view addSubview:self.selecterContentScrollView];
}

- (void)viewWillAppear:(BOOL)animated {
    
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"攻略", @"商城", @"我的收藏"];
    }
    return _titleArray;
}

- (NSMutableArray *)vcArray {
    if (!_vcArray) {
        DestinationMallViewController *mallVC = [DestinationMallViewController new];
        DestinationDetialViewController *detialVc = [DestinationDetialViewController new];
        DestinationShouCangViewController *shouCangVC = [DestinationShouCangViewController new];
        [self addChildViewController:detialVc];
        [self addChildViewController:mallVC];
        [self addChildViewController:shouCangVC];
        _vcArray = [NSMutableArray arrayWithObjects:detialVc, mallVC, shouCangVC, nil];
    }
    return _vcArray;
}

- (SelecterToolsScrollView *)selecterToolScrollView {
    if (!_selecterToolScrollView) {
        __weak typeof(self) weakSelf = self;
        CGRect rect = CGRectMake(0, 64, SCREEN_W, 35);
        _selecterToolScrollView = [[SelecterToolsScrollView alloc] initWithFrame:rect SelecterConditionTitleArray:self.titleArray andTypeStyle:homeStyle andBtnBlock:^(UIButton *btn) {
            [weakSelf upDateVCViewFrom:btn.tag - 300];
        }];
    }
    return _selecterToolScrollView;
}

//创建内容控制器
- (SelecterContentsScrollView *)selecterContentScrollView {
    if (!_selecterContentScrollView) {
        
        __weak typeof(self) weakSelf = self;
        
        CGRect rect = CGRectMake(0, 64 + 35, SCREEN_W, SCREEN_H - 64);
        
        _selecterContentScrollView = [[SelecterContentsScrollView alloc] initWithFrame:rect SelecterConditionVCArray:self.vcArray AndStyle:homeStyle andBtnBlock:^(int num) {
            [weakSelf upDateSelecterToolsIndex:num];
        }];
        
    }
    return _selecterContentScrollView;
}

- (void)upDateVCViewFrom:(NSInteger)index{
    
    [_selecterContentScrollView updateVCViewFromIndex:index];
}
- (void)upDateSelecterToolsIndex:(NSInteger)index{
    
    [_selecterToolScrollView updateSeletedToolsIndex:index];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}































/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
