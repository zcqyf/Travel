//
//  BaseViewController.m
//  TravelAPP
//
//  Created by qing on 2017/4/27.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "BaseViewController.h"
#import <SVProgressHUD.h>

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setForegroundColor:[UIColor blackColor]]; //字体颜色
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:230/255.0 green:231/255.0 blue:238/255.0 alpha:1.0]];   //背景颜色 RGB(230, 231, 238)
}

- (void)setTopView {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
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
