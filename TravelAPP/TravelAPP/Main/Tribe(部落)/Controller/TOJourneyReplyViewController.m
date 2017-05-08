//
//  TOJourneyReplyViewController.m
//  TravelAPP
//
//  Created by qing on 2017/5/8.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TOJourneyReplyViewController.h"
#import <Masonry.h>
#import "TOJourneyTopTableViewCell.h"
#import "TOJourneyBottomTableViewCell.h"
#import "TOJourneyReplyTableViewCell.h"

@interface TOJourneyReplyViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@end

@implementation TOJourneyReplyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.bottom.right.equalTo(self.view);
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
        
        [_tableView registerNib:[UINib nibWithNibName:@"TOJourneyTopTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TOJourneyTopTableViewCell"];
        
        [_tableView registerNib:[UINib nibWithNibName:@"TOJourneyReplyTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TOJourneyReplyTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"TOJourneyBottomTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TOJourneyBottomTableViewCell"];
    }
    return _tableView;
}



//- (void)clickToReply:(UIButton *)sender {
//    TRJourneyPublishViewController *vc = [TRJourneyPublishViewController new];
//    vc.title = @"发布问题";
//    [self.navigationController pushViewController:vc animated:YES];
//}

#pragma tableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        TOJourneyTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TOJourneyTopTableViewCell" forIndexPath:indexPath];
        
        return cell;
    } else if (indexPath.row == 1) {
        TOJourneyReplyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TOJourneyReplyTableViewCell" forIndexPath:indexPath];
        
        return cell;
    } else {
        TOJourneyBottomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TOJourneyBottomTableViewCell" forIndexPath:indexPath];
        
        return cell;
    }
}

#pragma tableView delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 71;
    } else if (indexPath.row == 1) {
        return 393 + 140;
    } else {
        return 50;
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
