//
//  BookingOrderViewController.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/5.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "BookingOrderViewController.h"
#import "BookingOrderHeaderTableViewCell.h"
#import "BookingOrderDetialTableViewCell.h"
#import "BookingRemarkTableViewCell.h"
#import "BookingPayTypeTableViewCell.h"

@interface BookingOrderViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation BookingOrderViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H+5) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self setupBottomView];
}

#pragma mark --- UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 6;
    }
    if (section == 2) {
        return 1;
    }
    if (section == 3) {
        return 3;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        BookingOrderHeaderTableViewCell *cell = [BookingOrderHeaderTableViewCell initCustomCellWithTableView:tableView];
        cell.selectionStyle = false;
        return cell;
    }
    if (indexPath.section == 1) {
        BookingOrderDetialTableViewCell *cell = [BookingOrderDetialTableViewCell initCustomCellWithTableView:tableView];
        
        cell.selectionStyle = false;
        cell.myTextField.tag = indexPath.row + 100;
        [cell.myTextField addTarget:self action:@selector(textFieldValueChange:) forControlEvents:UIControlEventValueChanged];

        switch (indexPath.row) {
            case 0:
                cell.mytitleLabel.text = @"中文姓名:";
                cell.chooseBtn.hidden = YES;
                return cell;
            case 1:
                cell.mytitleLabel.text = @"证件类型:";
                cell.myTextField.hidden = YES;
                return cell;
            case 2:
                cell.mytitleLabel.text = @"证件号码:";
                cell.chooseBtn.hidden = YES;
                return cell;
            case 3:
                cell.mytitleLabel.text = @"手机号码:";
                cell.chooseBtn.hidden = YES;
                return cell;
            case 4:
                cell.mytitleLabel.text = @"邮箱:";
                cell.chooseBtn.hidden = YES;
                return cell;
            case 5:
                cell.mytitleLabel.text = @"微信号:";
                cell.chooseBtn.hidden = YES;
                return cell;
            default:
                break;
        }
    }
    if (indexPath.section == 2) {
        BookingRemarkTableViewCell *cell = [BookingRemarkTableViewCell initCustomCellWithTableView:tableView];
        return cell;
    }
    
    if (indexPath.section == 3) {
        BookingPayTypeTableViewCell *cell = [BookingPayTypeTableViewCell initCustomCellWithTableView:tableView];
        cell.selectionStyle = false;
        switch (indexPath.row) {
            case 0:
                cell.myTitleLabel.text = @"微信支付";
                return cell;
            case 1:
                cell.myTitleLabel.text = @"支付宝";
                return cell;
            case 2:
                cell.myTitleLabel.text = @"余额支付";
                return cell;
            default:
                break;
        }
    }
    
    return [[UITableViewCell alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 200;
    }
    if (indexPath.section == 1) {
        return 49;
    }
    if (indexPath.section == 2) {
        return 100;
    }
    if (indexPath.section == 3) {
        return 49;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 1) {
        return 0;
    }
    return 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ---textFeild

- (void)textFieldValueChange:(UITextField *)textField {
    
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
    [button setTitle:@"提交订单" forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchDown];
    [bottomView addSubview:button];
    
    button.tag = 300;
    
    [self.view addSubview:bottomView];
    
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
