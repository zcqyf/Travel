//
//  RecommendViewController.m
//  TravelAPP
//
//  Created by qing on 2017/4/27.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "RecommendViewController.h"
#import "TopScrollView.h"
#import "RecomendScrollTableViewCell.h"
#import "RecomendHeaderView.h"
#import "RecomendGongGaoTableViewCell.h"
#import "TravelTableViewCell.h"

@interface RecommendViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)TopScrollView *topScrollView;

@property (nonatomic, strong)UISearchBar *searchBar;

@end

@implementation RecommendViewController

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, SCREEN_W, 49)];
        _searchBar.barStyle = UIBarStyleDefault;
        
    }
    return _searchBar;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 49+64, SCREEN_W, SCREEN_H+8-64-49-49) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        TopScrollView *view = [[TopScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableHeaderView = view;
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.tableView];
}


#pragma mark ---UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        RecomendScrollTableViewCell *cell = [RecomendScrollTableViewCell initCustomScrollViwCellWithTableView:tableView WithStyle:1];
        
        cell.selectionStyle = false;
        return cell;
    }else if (indexPath.section == 1){
        RecomendScrollTableViewCell *cell = [RecomendScrollTableViewCell initCustomScrollViwCellWithTableView:tableView WithStyle:2];
        
        cell.selectionStyle = false;
        return cell;
    }else if (indexPath.section == 2){
        RecomendGongGaoTableViewCell *cell = [RecomendGongGaoTableViewCell initCustomCellWithTableView:tableView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        TravelTableViewCell *cell = [TravelTableViewCell initCustomCellViewTableView:tableView];
        return cell;
    }
    
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        RecomendHeaderView *headerView = [RecomendHeaderView initCustomHeaderViewWithFrame:CGRectMake(0, 0, SCREEN_W, 30)];
        headerView.headerLabel.text = @"热门推荐";
        return headerView;
    }else if(section == 1){
        RecomendHeaderView *headerView = [RecomendHeaderView initCustomHeaderViewWithFrame:CGRectMake(0, 0, SCREEN_W, 30)];
        headerView.headerLabel.text = @"推荐达人";
        return headerView;
    }else{
        UIView *view = [[UIView alloc] init];
        return view;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0 || section == 1) {
        return 40;
    }else{
        return 0;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 8;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 200;
    }else if (indexPath.section == 1){
        return 200;
    }else if (indexPath.section == 2){
        return 200;
    }else{
        return 300;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"11");
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
