//
//  ChangePwdNewViewController.m
//  TravelAPP
//
//  Created by qing on 2017/5/12.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "ChangePwdNewViewController.h"
#import "ChangePwdNewTableViewCell.h"

@interface ChangePwdNewViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@end

@implementation ChangePwdNewViewController

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
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"ChangePwdNewTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ChangePwdNewTableViewCell"];
    }
    return _tableView;
}

- (void)clickToChangePwd {
//    ChangePwdNewViewController *vc = [ChangePwdNewViewController new];
//    vc.title = @"修改密码";
//    [self.navigationController pushViewController:vc animated:YES];
    // pop 回设置 -TODO
    NSLog(@"点击回到设置");
}

#pragma tableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChangePwdNewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChangePwdNewTableViewCell" forIndexPath:indexPath];
    [cell.clickToFinish addTarget:self action:@selector(clickToChangePwd) forControlEvents:UIControlEventTouchUpInside];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma tableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return SCREEN_H;
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
