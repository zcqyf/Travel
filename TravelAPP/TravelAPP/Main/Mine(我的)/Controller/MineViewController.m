//
//  MineViewController.m
//  TravelAPP
//
//  Created by qing on 2017/4/27.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "MineViewController.h"
#import "TRTopTableViewCell.h"
#import "MineTopTableViewCell.h"

@interface MineViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *channels;
@property (nonatomic,strong)NSDictionary *dict;
@property (nonatomic,strong)NSArray *dataSource;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[MineTopTableViewCell class] forCellReuseIdentifier:@"MineTopTableViewCell"];
        [_tableView registerClass:[TRTopTableViewCell class] forCellReuseIdentifier:@"TRTopTableViewCell"];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableView;
}

- (NSDictionary *)dict {
    if (!_dict) {
        _dict = @{@"dataSource": self.channels, @"type": @"channel"};
    }
    return _dict;
}

- (NSArray *)channels {
    if (!_channels) {
        _channels = @[@{@"text": @"机加酒", @"image": @"star"}, @{@"text": @"出境游", @"image": @"star"}, @{@"text": @"国内游", @"image": @"star"}];
    }
    return _channels;
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[@"我的订单", @"我的优惠券", @"我的足迹", @"我发布的帖子", @"我的问答", @"我的结伴", @"会员充值", @"会员商城", @"我的团队", @"联系我们"];
    }
    return _dataSource;
}

#pragma tableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    } else {
        return self.dataSource.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            MineTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineTopTableViewCell" forIndexPath:indexPath];
            
            return cell;
        } else {
            TRTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TRTopTableViewCell" forIndexPath:indexPath];
            cell.data = self.dict;
            return cell;
        }
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = self.dataSource[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.imageView.image = [UIImage imageNamed:@"start"];
        
        
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
        if (indexPath.row == 0) {
            return 140;
        } else {
            return 70;
        }
    } else {
        return 44;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 10;
    } else {
        return 0.01;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
