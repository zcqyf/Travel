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

@interface TribeViewController ()<TribeTitleSelectViewDelegate>

@property (nonatomic,strong)TribeTitleSelectView *selectView;

@property (nonatomic,copy)NSMutableArray *vcArray;

@end

@implementation TribeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
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
    to.view.frame = CGRectMake(0, 64 + 50, SCREEN_W, SCREEN_H - (64 + 50 + 49));
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
            TRDetailViewController *tr = _vcArray[0];
            TODetailViewController *to = _vcArray[1];
            [to.view setHidden:YES];
            [tr.view setHidden:NO];
        }
            break;
        case 1: {
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
