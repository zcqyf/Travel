//
//  MineSettingDetailViewController.m
//  TravelAPP
//
//  Created by qing on 2017/5/10.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "MineSettingDetailViewController.h"
#import "ChangePwdOldViewController.h"
#import "SettingInfoTableViewCell.h"
#import "SettingPushTableViewCell.h"
#import "ChangeNickNameViewController.h"

@interface MineSettingDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@end

@implementation MineSettingDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    [self.view addSubview:self.tableView];
}

- (void)setData:(NSDictionary *)data {
    _data = data;
    [_tableView reloadData];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [_tableView registerNib:[UINib nibWithNibName:@"SettingInfoTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SettingInfoTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"SettingPushTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"SettingPushTableViewCell"];
        
    }
    return _tableView;
}

#pragma tableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *array = self.data[@"data"];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //此处判断是哪种类型创建不同cell TODO  3种cell
    if ([self.data[@"title"] isEqualToString:@"账号密码"]) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        NSArray *array = self.data[@"data"];
        cell.textLabel.text = array[indexPath.row];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.imageView.image = [UIImage imageNamed:@"start"];
        return cell;
    } else if ([self.data[@"title"] isEqualToString:@"个人信息"]) {
        SettingInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingInfoTableViewCell" forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row == 0) {
            
        } else {
            cell.name.text = @"旅游";
            cell.imgWidth.constant = 0;
            cell.imgHeight.constant = 0;
        }
        return cell;
    } else {
        SettingPushTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SettingPushTableViewCell" forIndexPath:indexPath];
        
        return cell;
    }
    
}

#pragma tableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.data[@"title"]  isEqual: @"账号密码"]) {
        NSArray *array = self.data[@"data"];
        if (indexPath.row == array.count - 1) {
            ChangePwdOldViewController *vc = [ChangePwdOldViewController new];
            vc.title = @"修改密码";
            [self.navigationController pushViewController:vc animated:YES];
        }
    } else if ([self.data[@"title"]  isEqual: @"个人信息"]) {
        ChangeNickNameViewController *vc = [ChangeNickNameViewController new];
        vc.title = @"修改昵称";
        [self.navigationController pushViewController:vc animated:YES];
    }
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
