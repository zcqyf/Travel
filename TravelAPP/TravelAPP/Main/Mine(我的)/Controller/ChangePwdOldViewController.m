//
//  ChangePwdOldViewController.m
//  TravelAPP
//
//  Created by qing on 2017/5/12.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "ChangePwdOldViewController.h"
#import "ChangePwdOldTableViewCell.h"
#import "ChangePwdNewViewController.h"

@interface ChangePwdOldViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@end

@implementation ChangePwdOldViewController

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
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerNib:[UINib nibWithNibName:@"ChangePwdOldTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ChangePwdOldTableViewCell"];
    }
    return _tableView;
}

- (void)clickToChangePwd {
    ChangePwdNewViewController *vc = [ChangePwdNewViewController new];
    vc.title = @"修改密码";
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma tableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChangePwdOldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChangePwdOldTableViewCell" forIndexPath:indexPath];
    
    [cell.changeBtn addTarget:self action:@selector(clickToChangePwd) forControlEvents:UIControlEventTouchUpInside];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma tableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return SCREEN_H;
}

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
