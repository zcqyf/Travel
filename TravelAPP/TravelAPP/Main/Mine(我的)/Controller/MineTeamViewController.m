//
//  MineTeamViewController.m
//  TravelAPP
//
//  Created by qing on 2017/5/10.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "MineTeamViewController.h"
#import <Masonry.h>
#import "MTTopTableViewCell.h"
#import "MTMoneyTableViewCell.h"

@interface MineTeamViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSArray *data;

@end

@implementation MineTeamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.bottom.equalTo(self.view);
    }];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.0];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerNib:[UINib nibWithNibName:@"MTTopTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"MTTopTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"MTMoneyTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"MTMoneyTableViewCell"];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    
    return _tableView;
}

- (NSArray *)data {
    if (!_data) {
        _data = @[@"分销佣金", @"分销订单", @"我的团队", @"我的二维码", @"团队业绩奖励"];
    }
    return _data;
}


#pragma tableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MTTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MTTopTableViewCell" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.row == 1) {
        MTMoneyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MTMoneyTableViewCell" forIndexPath:indexPath];
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        cell.textLabel.text = self.data[indexPath.row - 2];
        return cell;
    }
}


#pragma tableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 162;
    } else if (indexPath.row == 1) {
        return 102;
    } else {
        return 44;
    }
}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 5;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
