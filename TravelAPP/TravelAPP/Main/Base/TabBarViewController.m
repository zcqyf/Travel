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
#import "MineViewController.h"
#import <Masonry.h>
//#import "BaseNavigationController.h"

typedef void(^sendAddressDic)(NSDictionary *dic);

@interface TabBarViewController ()<UITabBarDelegate, UINavigationControllerDelegate>


@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupViewControllers];
    [self setupMineViewController];
}

- (void)setupViewControllers {
    [self addChildViewControllerWithName:[MemberMallViewController new] title:@"会员商城" imageName:@"start1"];
    [self addChildViewControllerWithName:[RecommendViewController new] title:@"推荐" imageName:@"start1"];
    [self addChildViewControllerWithName:[DestinationViewController new] title:@"目的地" imageName:@"start1"];
    [self addChildViewControllerWithName:[MallViewController new] title:@"商城" imageName:@"start1"];
    [self addChildViewControllerWithName:[TribeViewController new] title:@"部落" imageName:@"start1"];
    [self addChildViewControllerWithName:[MineViewController new] title:@"我的" imageName:@"start1"];
}

- (void)addChildViewControllerWithName:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName {
    
//    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
//    vc.tabBarItem.selectedImage = [UIImage imageNamed:imageName];//待改进
    vc.title = title;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.delegate = self;
    [self addChildViewController:nav];
}

- (void)setupMineViewController {
    [self.view addSubview:self.mineBtn];
    [_mineBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(40);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.view).offset(-59);
    }];
}

- (UIButton *)mineBtn {
    if (!_mineBtn) {
        _mineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _mineBtn.tag = 5;
        [_mineBtn setImage:[UIImage imageNamed:@"mine"] forState:UIControlStateNormal];
        [_mineBtn addTarget:self action:@selector(clickMineBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mineBtn;
}

- (void)clickMineBtn:(UIButton *)sender {
    [self setSelectedIndex:sender.tag];
}

#pragma tabBar delegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    
    
    
    
}

#pragma navigation delegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([viewController isKindOfClass:[MemberMallViewController class]] || [viewController isKindOfClass:[RecommendViewController class]] || [viewController isKindOfClass:[DestinationViewController class]] || [viewController isKindOfClass:[MallViewController class]] || [viewController isKindOfClass:[MineViewController class]]) {// TODO 与 == 的区别   || [viewController isKindOfClass:[TribeViewController class]]
        [self.tabBar setHidden:NO];
        [self.mineBtn setHidden:NO];
    } else if ([viewController isKindOfClass:[TribeViewController class]]) {
        TribeViewController *vc = (TribeViewController *)viewController;
        if (vc.currentIndex == 1) {
            [self.tabBar setHidden:YES];
            [self.mineBtn setHidden:YES];
        } else {
            [self.tabBar setHidden:NO];
            [self.mineBtn setHidden:NO];
        }
    } else {
        [self.tabBar setHidden:YES];
        [self.mineBtn setHidden:YES];
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

