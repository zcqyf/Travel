//
//  MineSettingViewController.m
//  TravelAPP
//
//  Created by qing on 2017/5/10.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "MineSettingViewController.h"
#import "MineSettingDetailViewController.h"

@interface MineSettingViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSMutableArray<NSDictionary *> *dataSource;

@end

@implementation MineSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    
    [self.view addSubview:self.tableView];
}

- (void)setData:(NSArray *)data {
    _data = data;
    _dataSource = [NSMutableArray new];
    NSArray *array1 = @[@"绑定手机", @"绑定邮箱", @"微信账号", @"QQ账号", @"微博账号", @"修改密码"];
    NSArray *array2 = @[@"头像", @"用户昵称", @"性别", @"常居城市", @"个人简介"];
    NSArray *array3 = @[@"私信提醒", @"帖子相关提醒", @"问答相关提醒", @"结伴相关提醒"];
    [_dataSource addObject:@{@"data": array1, @"title": @"账号密码"}];
    [_dataSource addObject:@{@"data": array2, @"title": @"个人信息"}];
    [_dataSource addObject:@{@"data": array3, @"title": @"推送设置"}];
    [_tableView reloadData];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

#pragma tableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.font = [UIFont systemFontOfSize:16];
    cell.textLabel.text = self.data[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image = [UIImage imageNamed:@"start"];
    return cell;
}

#pragma tableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < 3) {
        MineSettingDetailViewController *vc = [MineSettingDetailViewController new];
        vc.data = _dataSource[indexPath.row];
        vc.title = _dataSource[indexPath.row][@"title"];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 3) {
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"确定清除缓存？" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"OK Action");
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"Cancel Action");
        }];
        [ac addAction:okAction];           
        [ac addAction:cancelAction];
        [self presentViewController:ac animated:YES completion:nil];
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
