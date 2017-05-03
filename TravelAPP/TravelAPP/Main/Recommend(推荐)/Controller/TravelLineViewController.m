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
#import "TLDescriptionTableViewCell.h"
#import "TLGuangGaoTableViewCell.h"

@interface TravelLineViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation TravelLineViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H+ 49) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = true;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView ];

    self.navigationItem.title = @"旅游路线推荐";

}

#pragma mark ---UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section != 0) {
        return 5;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        TravelLineTableViewCell *cell = [TravelLineTableViewCell initCustomCellWithTableView:tableView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else {
        
        if (indexPath.row == 0) {
            TravelLineDetialTableViewCell *cell = [TravelLineDetialTableViewCell initCustomCellWithTabelView:tableView];
            cell.selectionStyle = false;
            return cell;
        }else if (indexPath.row == 1) {
            TLDescriptionTableViewCell *cell = [TLDescriptionTableViewCell initCustomCellWithTableView:tableView];
            cell.selectionStyle = false;
            return cell;
        }else {
            TLGuangGaoTableViewCell *cell = [TLGuangGaoTableViewCell initCustomViewWithTableView:tableView];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
        
    }
    
    return [[UITableViewCell alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 250;
    }else {
        switch (indexPath.row) {
            case 0:
                return 130;
            
            case 1:
                return 100;
                
            default:
                return 80;
        }
        
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
