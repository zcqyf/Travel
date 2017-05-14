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
#import "MineSettingViewController.h"
#import "MineCollectionViewController.h"
#import "MinePackageViewController.h"
#import "MineJourneyViewController.h"
#import "MineOrderViewController.h"
#import "MineDiscountViewController.h"
#import "MineQAViewController.h"
#import "MinePartnerViewController.h"
#import "MineTrackViewController.h"
#import "MineRechargeViewController.h"
#import "MineTeamViewController.h"
#import "AboutUsViewController.h"

@interface MineViewController ()<UITableViewDelegate, UITableViewDataSource, TRTopTableViewCellDelegate>

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
        _channels = @[@{@"text": @"我的收藏", @"image": @"start"}, @{@"text": @"我的锦囊", @"image": @"start"}, @{@"text": @"我的行程", @"image": @"start"}];
    }
    return _channels;
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[@"我的订单", @"我的优惠券", @"我的足迹", @"我发布的帖子", @"我的问答", @"我的结伴", @"会员充值", @"会员商城", @"我的团队", @"联系我们"];
    }
    return _dataSource;
}

//设置按钮
- (void)clickToSet:(UIButton *)sender {
    MineSettingViewController *vc = [MineSettingViewController new];
    vc.title = @"设置";
    vc.data = @[@"账号密码", @"个人信息", @"推送设置", @"清除缓存", @"检测最新版本", @"意见反馈", @"联系我们"];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma TRTopTableViewCellDelegate
- (void)didSelectAt:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MineCollectionViewController *vc = [MineCollectionViewController new];
        vc.title = @"我的收藏";
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 1) {
        MinePackageViewController *vc = [MinePackageViewController new];
        vc.title = @"我的锦囊";
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        MineJourneyViewController *vc = [MineJourneyViewController new];
        vc.title = @"我的行程";
        [self.navigationController pushViewController:vc animated:YES];
    }
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
            [cell.settingButton addTarget:self action:@selector(clickToSet:) forControlEvents:UIControlEventTouchUpInside];
            return cell;
        } else {
            TRTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TRTopTableViewCell" forIndexPath:indexPath];
            cell.data = self.dict;
            // TODO 公用cell问题：另外遵循此代理的是否会一同触发
            cell.delegate = self;
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
    if (indexPath.section > 0) {
        switch (indexPath.row) {
            case 0://我的订单
            {
                MineOrderViewController *vc = [MineOrderViewController new];
                vc.title = @"我的订单";
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 1://我的优惠券
            {
                MineDiscountViewController *vc = [MineDiscountViewController new];
                vc.title = @"我的优惠券";
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 2://我的足迹
            {
                MineTrackViewController *vc = [MineTrackViewController new];
                vc.title = @"我的足迹";
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 3://我发布的帖子
            {
                //TODO 帖子
                
            }
                break;
            case 4://我的问答
            {
                MineQAViewController *vc = [MineQAViewController new];
                vc.title = @"我的问答";
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 5://我的结伴
            {
                MinePartnerViewController *vc = [MinePartnerViewController new];
                vc.title = @"我的结伴";
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 6://会员充值
            {
                MineRechargeViewController *vc = [MineRechargeViewController new];
                vc.title = @"会员充值";
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 7://会员商城
            {
                MineTeamViewController *vc = [MineTeamViewController new];
                vc.title = @"我的团队";
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 8://我的团队
            {
                MineTeamViewController *vc = [MineTeamViewController new];
                vc.title = @"我的团队";
                [self.navigationController pushViewController:vc animated:YES];}
                break;
            case 9://联系我们
            {
                AboutUsViewController *vc = [AboutUsViewController new];
                vc.title = @"联系我们";
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            default:
                break;
        }
        
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
