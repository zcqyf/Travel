//
//  TRJourneyViewController.m
//  TravelAPP
//
//  Created by qing on 2017/5/8.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TRJourneyViewController.h"
#import <Masonry.h>
#import "TRJourneyTopTableViewCell.h"
#import "TRJourneyDescriptionTableViewCell.h"
#import "TRJourneyBottomView.h"
#import "TRJourneyPublishViewController.h"

@interface TRJourneyViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)TRJourneyBottomView *bottomView;

@end

@implementation TRJourneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(_bottomView.mas_top);
    }];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(50);
    }];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [[UIColor alloc] initWithRed:0.96 green:0.96 blue:0.96 alpha:1.0];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 5)];
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, -5, 0);
        [_tableView registerNib:[UINib nibWithNibName:@"TRJourneyTopTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TRJourneyTopTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"TRJourneyDescriptionTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TRJourneyDescriptionTableViewCell"];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableView;
}

- (TRJourneyBottomView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[NSBundle mainBundle] loadNibNamed:@"TRJourneyBottomView" owner:nil options:nil].firstObject;
        [_bottomView.bottomReplyView addTarget:self action:@selector(clickToReply:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomView;
}

- (void)clickToReply:(UIButton *)sender {
    TRJourneyPublishViewController *vc = [TRJourneyPublishViewController new];
    vc.title = @"发布问题";
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma tableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        TRJourneyTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TRJourneyTopTableViewCell" forIndexPath:indexPath];
        
        return cell;
    } else if (indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
        cell.textLabel.font = [UIFont systemFontOfSize:16];
        cell.textLabel.text = @"希腊/塞浦路斯版的帖子";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    } else {
        TRJourneyDescriptionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TRJourneyDescriptionTableViewCell" forIndexPath:indexPath];
        
        return cell;
    }
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    return <#expression#>
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    return <#expression#>
//}

#pragma tableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 229;
    } else if (indexPath.section == 1) {
        return 60;
    } else {
        return 259;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 2) {
        return 0.001;
    } else {
        return 5;
    }
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//
//}

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
