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

@interface TODetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSArray<NSDictionary *> *details;

@end

@implementation TODetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
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

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    return <#expression#>
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    return <#expression#>
//}

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
        return 10;
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
