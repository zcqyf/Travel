//
//  MenRecommendViewController.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/2.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "MenRecommendViewController.h"
#import "TLDescriptionTableViewCell.h"
#import "MenRecommendDetialTableViewCell.h"
#import "MenRecommendHeaderTableViewCell.h"
#import "MenRecommendWanFaTableViewCell.h"
#import "ConsultationViewController.h"

@interface MenRecommendViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation MenRecommendViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -42, SCREEN_W, SCREEN_H - 8) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (void)viewWillAppear:(BOOL)animated {

        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];


        self.tabBarController.tabBar.hidden = true;
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.tableView];
    [self setupButtomButton];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }else{
        return 2;
    }
    
}

- (void)setupButtomButton {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, SCREEN_H - 49, SCREEN_W, 49);
    [btn setTitle:@"咨询达人" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    btn.layer.borderWidth = 0.5;
    [btn addTarget:self action:@selector(clickBtnAction:) forControlEvents:UIControlEventTouchDown];
    btn.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:btn];
}


#pragma mark ---UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {

            if (indexPath.row == 0) {
                MenRecommendHeaderTableViewCell *cell = [MenRecommendHeaderTableViewCell initCustomCellWithTableView:tableView];
                return cell;
            }
            if (indexPath.row == 1) {
                MenRecommendDetialTableViewCell *cell = [MenRecommendDetialTableViewCell initCustomCellWithtableView:tableView];
                return cell;
            }
            if (indexPath.row == 2) {
                TLDescriptionTableViewCell *cell = [TLDescriptionTableViewCell initCustomCellWithTableView:tableView];
                
                return cell;
            }
    }else {
        MenRecommendWanFaTableViewCell *cell = [MenRecommendWanFaTableViewCell initCustomCellWithTableView:tableView];
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(8, 0, SCREEN_W, 40)];
        label.text = @"提供玩法";
        label.layer.borderWidth = 0.5;
        label.layer.borderColor = [UIColor lightGrayColor].CGColor;
        label.backgroundColor = [UIColor whiteColor];
        label.alpha = 0.7;
        label.textAlignment = NSTextAlignmentCenter;
        [label setFont:[UIFont systemFontOfSize:14]];
        return label;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 40;
    }
    return 0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                return 150;
            case 1:
                return 150;
            case 2:
                return 100;
            default:
                break;
        }
    }else{
        return 250;
    }
    return 0;
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat sectionHeaderHeight = 40;
//    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
//        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
//    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
//        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
//    }
//}

#pragma mark ---method
- (void)clickBtnAction:(UIButton *)sender {
    ConsultationViewController *vc = [ConsultationViewController new];
    [self.navigationController pushViewController:vc animated:true];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
















@end
