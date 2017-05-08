//
//  TODetailViewController.m
//  TravelAPP
//
//  Created by qing on 2017/5/2.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TODetailViewController.h"
#import "TOTopTableViewCell.h"
#import "TribeTableViewCell.h"
#import <Masonry.h>
#import "TOJourneyViewController.h"
#import "TOBottomAddView.h"
#import "TOPublishViewController.h"

#import "TOJourneyReplyViewController.h"

@interface TODetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSArray<NSDictionary *> *details;

@property (nonatomic,strong)TOBottomAddView *bottomAddView;

@end

@implementation TODetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomAddView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.equalTo(self.view);
        make.bottom.equalTo(_bottomAddView.mas_top);
    }];
    [_bottomAddView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.height.mas_equalTo(50);
    }];
    
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [[UIColor alloc] initWithRed:0.96 green:0.96 blue:0.96 alpha:1.0];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 5)];
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, -5, 0);
        [_tableView registerClass:[TOTopTableViewCell class] forCellReuseIdentifier:@"TOTopTableViewCell"];
        [_tableView registerClass:[TribeTableViewCell class] forCellReuseIdentifier:@"TribeTableViewCell"];
    }
    return _tableView;
}

- (NSArray<NSDictionary *> *)details {
    if (!_details) {
        _details = @[@{@"dataSource": @[@"image1", @"image2", @"image3"]}, @{@"dataSource": @[@"image1", @"image2", @"image3"]}, @{@"dataSource": @[@"image1", @"image2", @"image3"]}, @{@"dataSource": @[@"image1", @"image2", @"image3"]}];
    }
    return _details;
}

- (TOBottomAddView *)bottomAddView {
    if (!_bottomAddView) {
        _bottomAddView = [TOBottomAddView new];
        [_bottomAddView.addBtn addTarget:self action:@selector(clickToAdd:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomAddView;
}

- (void)clickToAdd:(UIButton *)sender {
//    TOPublishViewController *vc = [TOPublishViewController new];
    TOJourneyReplyViewController *vc = [TOJourneyReplyViewController new];
    vc.title = @"发布户外出行";
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma tableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            TOTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TOTopTableViewCell" forIndexPath:indexPath];
            return cell;
        } else {
            TribeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TribeTableViewCell" forIndexPath:indexPath];
            cell.data = self.details[indexPath.row - 1];
            return cell;
        }
        
    } else {
        TribeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TribeTableViewCell" forIndexPath:indexPath];
        cell.data = _details[indexPath.row];
        return cell;
    }
}

#pragma tableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section > 0) {
        return 250;
    } else {
        if (indexPath.row == 0) {
            return 50;
        } else {
            return 250;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 2) {
        return 0.001;
    } else {
        return 5;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row >0) {
            TOJourneyViewController *vc = [TOJourneyViewController new];
            vc.title = @"详情页";
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
