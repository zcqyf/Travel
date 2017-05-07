//
//  GrogShopViewController.m
//  TravelAPP
//
//  Created by qing on 2017/5/6.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "GrogShopViewController.h"
#import "GSTopTableViewCell.h"
#import "GSPriceTableViewCell.h"
#import "GSTableViewCell.h"
#import "GSBottomSelectView.h"
#import <Masonry.h>
#import "RecomendScrollTableViewCell.h"

@interface GrogShopViewController ()<UITableViewDataSource, UITableViewDelegate>//UIScrollViewDelegate

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)GSBottomSelectView *bottomSelectView;
@end

@implementation GrogShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomSelectView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(_bottomSelectView.mas_top);
    }];
    [_bottomSelectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.height.mas_equalTo(70);
    }];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 8)];
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, -8, 0);
        
        [_tableView registerNib:[UINib nibWithNibName:@"GSTopTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"GSTopTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"GSPriceTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"GSPriceTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"GSTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"GSTableViewCell"];
        
    }
    return _tableView;
}

- (GSBottomSelectView *)bottomSelectView {
    if (!_bottomSelectView) {
        _bottomSelectView = [[NSBundle mainBundle] loadNibNamed:@"GSBottomSelectView" owner:nil options:nil].firstObject;
        _bottomSelectView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomSelectView;
}

#pragma tableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
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
            GSTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GSTopTableViewCell" forIndexPath:indexPath];
            return cell;
        } else {
            GSPriceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GSPriceTableViewCell" forIndexPath:indexPath];
            return cell;
        }
    } else {
        GSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GSTableViewCell" forIndexPath:indexPath];
        return cell;
    }
}

#pragma tableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 134.5;
        } else {
            return 77;
        }
    } else {
        return  120.5;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 8;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

#pragma mark ---UIScrollViewDelegate
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat sectionHeaderHeight = 40;
//    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
//        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
//    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
//        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
