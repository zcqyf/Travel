//
//  TOAnnounceViewController.m
//  TravelAPP
//
//  Created by qing on 2017/5/9.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TOAnnounceViewController.h"
#import "TOTopSelectView.h"
#import "TOPublishTableViewCell.h"
#import <Masonry.h>

@interface TOAnnounceViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong)TOTopSelectView *topSelectView;

@property (nonatomic,strong)UITableView *tableView;

@end

@implementation TOAnnounceViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.topSelectView];
    [self.view addSubview:self.tableView];
    [_topSelectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(40);
    }];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topSelectView.mas_bottom).offset(0);
        make.left.bottom.right.equalTo(self.view);
    }];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerNib:[UINib nibWithNibName:@"TOPublishTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TOPublishTableViewCell"];
    }
    return _tableView;
}

- (TOTopSelectView *)topSelectView {
    if (!_topSelectView) {
        _topSelectView = [[NSBundle mainBundle] loadNibNamed:@"TOTopSelectView" owner:nil options:nil].firstObject;
    }
    return _topSelectView;
}

#pragma tableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TOPublishTableViewCell" forIndexPath:indexPath];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 667;
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
