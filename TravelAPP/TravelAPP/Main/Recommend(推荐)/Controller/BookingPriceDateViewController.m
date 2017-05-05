//
//  BookingPriceDateViewController.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/4.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "BookingPriceDateViewController.h"
#import "TLBookingTextTableViewCell.h"
#import "TLBookingTicketTypeTableViewCell.h"
#import "TLCalendarTableViewCell.h"
#import "BookingOrderViewController.h"

@interface BookingPriceDateViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation BookingPriceDateViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H-64 - 49 + 5) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
       
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    
    [self setupBottomView];
    
}

- (void)setupBottomView{
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_H-49, SCREEN_W, 49)];
    bottomView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    bottomView.layer.borderWidth = 0.5;
    bottomView.backgroundColor = [UIColor whiteColor];
    bottomView.tag = 100;
    
    UILabel *totalPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W/2, 49)];
    totalPriceLabel.text = @"合计xxxxx元";
    totalPriceLabel.textAlignment = NSTextAlignmentCenter;
    [bottomView addSubview:totalPriceLabel];
    totalPriceLabel.tag = 200;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(SCREEN_W/2, 0, SCREEN_W/2, 49);
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"下一步，填写信息" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchDown];
    [bottomView addSubview:button];

    button.tag = 300;
    
    [self.view addSubview:bottomView];
    
}

#pragma mark ---UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return 3;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        TLBookingTextTableViewCell *cell = [TLBookingTextTableViewCell initCustomCellWithTableView:tableView];
        return cell;
    }
    if (indexPath.section == 1) {
        TLBookingTicketTypeTableViewCell *cell = [TLBookingTicketTypeTableViewCell initCustomCellWithtableView:tableView];
        return cell;
    }
    if (indexPath.section == 2) {
        TLCalendarTableViewCell *cell = [TLCalendarTableViewCell initCustomCellWithTableView:tableView];
        return cell;
    }
    return [[UITableViewCell alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100;
    }
    if (indexPath.section == 1) {
        return 49;
    }
    if (indexPath.section == 2) {
        return 300;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return 30;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(8, 0, SCREEN_W, 30)];
        label.text = @"   购票类型";
        [label setFont:[UIFont systemFontOfSize:14]];
        return label;
    }
    return nil;
}

#pragma mark ---action
- (void)pushAction:(UIButton *)sender{
    BookingOrderViewController *vc = [[BookingOrderViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:true];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
