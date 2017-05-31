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
    [SVProgressHUD setMinimumDismissTimeInterval:1.0];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]]; //字体颜色
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]]; //背景颜色
    
    //隐藏系统back按钮
    self.navigationController.navigationItem.hidesBackButton = true;
    [self setNavigationBarBackItem];
}

- (void)setupNavigationBar {
//    self.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
//    self.navigationBar.shadowImage = UIImage()
//    self.navigationBar.translucent = true
    
    //设置背景
    UIColor *bgColor = [UIColor colorWithRed:251/255.0 green:103/255.0 blue:57/255.0 alpha:1.0];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:bgColor] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.translucent = YES;
    
    //naviggationBarTitle样式
    UIColor *textColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:textColor}];
    
}

- (void)setNavigationBarHidden {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.translucent = YES;
    //naviggationBarTitle样式
    UIColor *textColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:textColor}];
}

- (void)setNavigationBarBackItem{

        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
        [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
        self.navigationItem.backBarButtonItem = backItem;

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
