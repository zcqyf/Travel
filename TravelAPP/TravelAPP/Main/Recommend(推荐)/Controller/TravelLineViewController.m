//
//  TravelLineViewController.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/2.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TravelLineViewController.h"
#import "TravelLineTableViewCell.h"
#import "TravelLineDetialTableViewCell.h"

@interface TravelLineViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation TravelLineViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView ];

    self.navigationItem.title = @"旅游路线推荐";

}

#pragma mark ---UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        TravelLineTableViewCell *cell = [TravelLineTableViewCell initCustomCellWithTableView:tableView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    if (indexPath.section == 1) {
        TravelLineDetialTableViewCell *cell = [TravelLineDetialTableViewCell initCustomCellWithTabelView:tableView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 250;
    }
    if (indexPath.section == 1) {
        return 130;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
