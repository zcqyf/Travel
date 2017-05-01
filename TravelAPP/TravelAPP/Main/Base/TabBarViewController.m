//
//  TabBarViewController.m
//  TravelAPP
//
//  Created by qing on 2017/4/27.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TabBarViewController.h"
#import "MemberMallViewController.h"
#import "RecommendViewController.h"
#import "DestinationViewController.h"
#import "MallViewController.h"
#import "TribeViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewControllers];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setupViewControllers {
    [self addChildViewControllerWithName:[MemberMallViewController new] title:@"会员商城" imageName:@"start1"];
    [self addChildViewControllerWithName:[RecommendViewController new] title:@"推荐" imageName:@"start1"];
    [self addChildViewControllerWithName:[DestinationViewController new] title:@"目的地" imageName:@"start1"];
    [self addChildViewControllerWithName:[MallViewController new] title:@"商城" imageName:@"start1"];
    [self addChildViewControllerWithName:[TribeViewController new] title:@"部落" imageName:@"start1"];
}

- (void)addChildViewControllerWithName:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName {
    
//    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
//    vc.tabBarItem.selectedImage = [UIImage imageNamed:imageName];//待改进
    vc.title = title;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
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

