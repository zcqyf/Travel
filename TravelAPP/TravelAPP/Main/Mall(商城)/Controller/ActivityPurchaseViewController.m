//
//  ActivityPurchaseViewController.m
//  TravelAPP
//
//  Created by qing on 2017/5/4.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "ActivityPurchaseViewController.h"
#import "ActivityPurchaseTableViewCell.h"

@interface ActivityPurchaseViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@end

@implementation ActivityPurchaseViewController

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
        [_tableView registerNib:[UINib nibWithNibName:@"ActivityPurchaseTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ActivityPurchaseTableViewCell"];
    }
    return _tableView;
}


#pragma tableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ActivityPurchaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActivityPurchaseTableViewCell" forIndexPath:indexPath];
    
    return cell;
}


#pragma tableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 175;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 8;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
