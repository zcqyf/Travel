//
//  ConsultationViewController.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/6.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "ConsultationViewController.h"
#import "ConsultionHeaderTableViewCell.h"
#import "ConsultionWanFaTableViewCell.h"
#import "DaoYouTypeTableViewCell.h"
#import "ConsultionTitleTableViewCell.h"
#import "ConsultiontextFeildCell.h"

@interface ConsultationViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation ConsultationViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self setupButtomButton];
    self.navigationItem.title = @"咨询";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 2) {
        return 2;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ConsultionHeaderTableViewCell *cell = [ConsultionHeaderTableViewCell initCustomCellWithTableView:tableView];
        return cell;
    }
    if (indexPath.section == 1) {
        ConsultionWanFaTableViewCell *cell = [ConsultionWanFaTableViewCell initCustomCellWithTableView:tableView];
        return cell;
    }
    if (indexPath.section == 2) {
        DaoYouTypeTableViewCell *cell = [DaoYouTypeTableViewCell initCustomCellWithTableView:tableView];
        return cell;
    }
    if (indexPath.section == 3) {
        ConsultionTitleTableViewCell *cell = [ConsultionTitleTableViewCell initCustomCellWithTableView:tableView Type:1];
        cell.myTitleLabel.text = @"请选择出行日期";
        return cell;
    }
    if (indexPath.section == 4) {
        ConsultionTitleTableViewCell *cell = [ConsultionTitleTableViewCell initCustomCellWithTableView:tableView Type:0] ;
        cell.myTitleLabel.text = @"本次游玩出行人数";
        return cell;
    }
    if (indexPath.section == 5) {
        ConsultiontextFeildCell *cell = [ConsultiontextFeildCell initCustomCellWithTableView:tableView];
        return cell;
    }
    return [[UITableViewCell alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 90;
    }
    if (indexPath.section == 1) {
        return 100;
    }
    if (indexPath.section == 2) {
        return 70;
    }
    if (indexPath.section == 3 || indexPath.section == 4) {
        return 49;
    }
    if (indexPath.section == 5){
        return 150;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 2 ) {
        return 5;
    }else if (section == 0) {
        return 0;
    }else {
        return 40;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(8, 0, SCREEN_W, 40)];
    
    label.layer.borderWidth = 0.5;
    label.layer.borderColor = [UIColor lightGrayColor].CGColor;
    label.textAlignment = NSTextAlignmentLeft;
    [label setFont:[UIFont systemFontOfSize:16]];
    switch (section) {
        case 1:
            label.text = @"  你选择的玩法";
            break;
        case 3:
            label.text = @"  需要我服务的大概日期";
            break;
        case 4:
            label.text = @"  出行人数";
            break;
        case 5:
            label.text = @"  其它您关心的问题";
            break;
        default:
            break;
    }
    return label;
}




- (void)setupButtomButton {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, SCREEN_H - 49, SCREEN_W, 49);
    [btn setTitle:@"发送消息" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    btn.layer.borderWidth = 0.5;
    [btn addTarget:self action:@selector(clickBtnAction:) forControlEvents:UIControlEventTouchDown];
    btn.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btn];
}

#pragma mark ---method
- (void)clickBtnAction:(UIButton *)sender {
//    ConsultationViewController *vc = [ConsultationViewController new];
//    [self.navigationController pushViewController:vc animated:true];
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
