//
//  MineCollectionViewController.m
//  TravelAPP
//
//  Created by qing on 2017/5/10.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "MineCollectionViewController.h"
#import "MCDetailViewController.h"

@interface MineCollectionViewController ()

@property (nonatomic,strong)UIView *lineView;

@end

@implementation MineCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.selecterToolScrollView];
    [self.view addSubview:self.lineView];
    [self.view addSubview:self.selecterContentScrollView];
}


- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 64+35, SCREEN_W, 0.5)];
        _lineView.backgroundColor =[UIColor lightGrayColor];
    }
    return _lineView;
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"目的地", @"帖子", @"折扣", @"其它"];
    }
    return _titleArray;
}

- (NSMutableArray *)vcArray {
    if (!_vcArray) {
        _vcArray = [NSMutableArray new];
        for (int i = 0; i < 4; i++) {
            MCDetailViewController *vc = [MCDetailViewController new];
            [self addChildViewController:vc];
            [_vcArray addObject:vc];
        }
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
        
        CGRect rect = CGRectMake(0, 64 + 35 + 0.5, SCREEN_W, SCREEN_H - 64);
        
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
