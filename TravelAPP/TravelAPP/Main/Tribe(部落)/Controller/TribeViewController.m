//
//  TribeViewController.m
//  TravelAPP
//
//  Created by qing on 2017/4/27.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TribeViewController.h"
#import "TRDetailViewController.h"
#import "TODetailViewController.h"
#import "TribeTitleSelectView.h"
#import "TabBarViewController.h"

@interface TribeViewController ()<TribeTitleSelectViewDelegate>

@property (nonatomic,strong)TribeTitleSelectView *selectView;

@property (nonatomic,copy)NSMutableArray *vcArray;

@property (nonatomic,strong)TabBarViewController *tab;

@end

@implementation TribeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // TODO 有bug待修改
//    [self.tabBarController.tabBar setHidden:NO];
//    TRDetailViewController *tr = _vcArray[0];
//    TODetailViewController *to = _vcArray[1];
//    [to.view setHidden:YES];
//    [tr.view setHidden:NO];
//    
//    [self.selectView.buttons[0] setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [self.selectView.buttons[1] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

- (void)setupUI {
    _tab = (TabBarViewController *)self.tabBarController;
    [self.view addSubview:self.selectView];
    [self setupChildViewControllers];
}

- (void)setupChildViewControllers {
    _vcArray = [NSMutableArray new];
    TRDetailViewController *tr = [TRDetailViewController new];
    TODetailViewController *to = [TODetailViewController new];
    [_vcArray addObject:tr];
    [_vcArray addObject:to];
    [self addChildViewController:tr];
    [self addChildViewController:to];
    tr.view.frame = CGRectMake(0, 64 + 50, SCREEN_W, SCREEN_H - (64 + 50 + 49));
    to.view.frame = CGRectMake(0, 64 + 50, SCREEN_W, SCREEN_H - (64 + 50));
    [self.view addSubview:tr.view];
    [self.view addSubview:to.view];
    [to.view setHidden:YES];
}

- (TribeTitleSelectView *)selectView {
    if (!_selectView) {
        _selectView = [[TribeTitleSelectView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_W, 50)];
        _selectView.delegate = self;
    }
    return _selectView;
}

#pragma TribeTitleSelectViewDelegate
- (void)clickedAt:(NSInteger)Index {
    switch (Index) {
        case 0: {
            [_tab.tabBar setHidden:NO];
            [_tab.mineBtn setHidden:NO];
            TRDetailViewController *tr = _vcArray[0];
            TODetailViewController *to = _vcArray[1];
            [to.view setHidden:YES];
            [tr.view setHidden:NO];
        }
            break;
        case 1: {
            [_tab.tabBar setHidden:YES];
            [_tab.mineBtn setHidden:YES];
            TRDetailViewController *tr = _vcArray[0];
            TODetailViewController *to = _vcArray[1];
            [tr.view setHidden:YES];
            [to.view setHidden:NO];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
