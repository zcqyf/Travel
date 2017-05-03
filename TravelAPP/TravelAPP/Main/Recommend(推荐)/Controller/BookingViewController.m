//
//  BookingViewController.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/3.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "BookingViewController.h"
#import "TLBookingJieShaoTableViewCell.h"
#import "TLBookingSelectdateTableViewCell.h"
#import "TLBookingDetialJieShaoTableViewCell.h"
#import "TravelLineDetialTableViewCell.h"

@interface BookingViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation BookingViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H +5) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self setupBottomBar];
   
}

- (void)setupBottomBar {
    UIView *bottomBarView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_H - 49, SCREEN_W, 49)];
    bottomBarView.backgroundColor = [UIColor whiteColor];
    bottomBarView.layer.borderWidth = 0.5;
    bottomBarView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    //收藏按钮
    UIButton *shouCangBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shouCangBtn.frame = CGRectMake(0, 0, 100, 49);
    [shouCangBtn setTitle:@"收藏" forState:UIControlStateNormal];
    [shouCangBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shouCangBtn.tag = 111;
    [shouCangBtn addTarget:self action:@selector(clickBtnAction:) forControlEvents:UIControlEventTouchDown];
    
    //预定按钮
    UIButton *bookingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bookingBtn.frame = CGRectMake(100, 0, SCREEN_W - 100, 49);
    [bookingBtn setTitle:@"立即预约" forState:UIControlStateNormal];
    [bookingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bookingBtn setBackgroundColor:[UIColor orangeColor]];
    bookingBtn.tag = 112;
    [bookingBtn addTarget:self action:@selector(clickBtnAction:) forControlEvents:UIControlEventTouchDown];
    
    
    [bottomBarView addSubview:shouCangBtn];
    [bottomBarView addSubview:bookingBtn];
    [self.view addSubview:bottomBarView];
}

- (void)clickBtnAction: (UIButton *)sender {
    if (sender.tag == 111) {
        NSLog(@"收藏");
    }
    if (sender.tag == 112) {
        NSLog(@"立即预约");
    }
}


#pragma mark ---UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 3) {
        return 4;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        TLBookingJieShaoTableViewCell *cell = [TLBookingJieShaoTableViewCell initCustomCellWithTableView:tableView];
        return cell;
    }
    if (indexPath.section == 1) {
        TLBookingSelectdateTableViewCell *cell = [TLBookingSelectdateTableViewCell initCustomCellWithTableView:tableView];
        return cell;
    }
    if (indexPath.section == 2) {
        TLBookingDetialJieShaoTableViewCell *cell = [TLBookingDetialJieShaoTableViewCell initCustomCellWithTableView:tableView];
        return cell;
    }
    if (indexPath.section == 3) {
        TravelLineDetialTableViewCell *cell = [TravelLineDetialTableViewCell initCustomCellWithTabelView:tableView];
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 200;
    }
    if (indexPath.section == 1) {
        return 72;
    }
    if (indexPath.section == 2) {
        return 300;
    }
    if (indexPath.section == 3) {
        return 130;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
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
