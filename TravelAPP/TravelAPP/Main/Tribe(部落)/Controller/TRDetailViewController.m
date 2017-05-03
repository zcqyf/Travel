//
//  TRDetailViewController.m
//  TravelAPP
//
//  Created by qing on 2017/5/2.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TRDetailViewController.h"
#import "TRTopTableViewCell.h"
#import "TribeTableViewCell.h"
#import <Masonry.h>

@interface TRDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *channels;
@property (nonatomic,strong)NSArray<NSDictionary *> *details;

@property (nonatomic,strong)NSDictionary *dict;


@end

@implementation TRDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    _dict = @{@"dataSource": self.channels, @"type": @"channel"};
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.left.equalTo(self.view);
    }];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [[UIColor alloc] initWithRed:0.96 green:0.96 blue:0.96 alpha:1.0];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[TRTopTableViewCell class] forCellReuseIdentifier:@"TRTopTableViewCell"];
        [_tableView registerClass:[TribeTableViewCell class] forCellReuseIdentifier:@"TribeTableViewCell"];
    }
    return _tableView;
}

- (NSArray *)channels {
    if (!_channels) {
        _channels = @[@{@"text": @"机加酒", @"image": @"star"}, @{@"text": @"出境游", @"image": @"star"}, @{@"text": @"国内游", @"image": @"star"}, @{@"text": @"酒店", @"image": @"star"}, @{@"text": @"旅行周边", @"image": @"star"}];
    }
    return _channels;
}

- (NSArray<NSDictionary *> *)details {
    if (!_details) {
        _details = @[@{@"dataSource": @[@"image1", @"image2", @"image3"]}, @{@"dataSource": @[@"image1", @"image2", @"image3"]}, @{@"dataSource": @[@"image1", @"image2", @"image3"]}, @{@"dataSource": @[@"image1", @"image2", @"image3"]}];
    }
    return _details;
}

#pragma tableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section < 2) {
        TRTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TRTopTableViewCell" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            cell.data = self.dict;
        } else {
            
        }
        return cell;
    } else {
        TribeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TribeTableViewCell" forIndexPath:indexPath];
        cell.data = self.details[indexPath.row];
        return cell;
    }
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    return <#expression#>
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    return <#expression#>
//}

#pragma tableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 70;
    } else if (indexPath.section == 1) {
        return 100;
    } else {
        return 250;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 5;
    } else if (section == 5) {
        return 0.001;
    } else {
        return  10;
    }
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
