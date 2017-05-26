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
#import "LoginViewController.h"
#import "MyInfo.h"
#import <SVProgressHUD.h>

typedef void(^sendAddressDic)(NSDictionary *dic);

@interface TabBarViewController ()<UITabBarDelegate, UINavigationControllerDelegate>


@property (nonatomic,strong)UINavigationController *mineNav;

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
    
    if ([NSUserDefaults.standardUserDefaults objectForKey:@"MemberType"]) {
        NSString *memberType = [NSUserDefaults.standardUserDefaults objectForKey:@"MemberType"];
        switch ([memberType intValue]) {
            case 1://付费会员
                [self addChildViewControllerWithName:[MemberMallViewController new] title:@"会员商城" imageName:@"icon_star_Default" selectedIamgeName:@"icon_star_highlight"];
                [self commonViewControllers];
                break;
            case 2://普通用户
                [self commonViewControllers];
                break;
            default:
                break;
        }
    } else {//未登录
        [self commonViewControllers];
    }
}

- (void)commonViewControllers {
    [self addChildViewControllerWithName:[RecommendViewController new] title:@"推荐" imageName:@"icon_star_Default" selectedIamgeName:@"icon_star_highlight"];
    [self addChildViewControllerWithName:[DestinationViewController new] title:@"目的地" imageName:@"icon_star_Default" selectedIamgeName:@"icon_star_highlight"];
    [self addChildViewControllerWithName:[MallViewController new] title:@"商城" imageName:@"icon_star_Default" selectedIamgeName:@"icon_star_highlight"];
    [self addChildViewControllerWithName:[TribeViewController new] title:@"部落" imageName:@"icon_star_Default" selectedIamgeName:@"icon_star_highlight"];
}

- (void)addChildViewControllerWithName:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName selectedIamgeName: (NSString *)selectedImageName{
    
//    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//待改进
    vc.title = title;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.delegate = self;
    [self addChildViewController:nav];
}

- (void)setupMineViewController {
    [self.view addSubview:self.mineBtn];
    [_mineBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.height.mas_equalTo(40);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.view).offset(-59);
    }];
}

- (UIButton *)mineBtn {
    if (!_mineBtn) {
        _mineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _mineBtn.tag = 5;
        [_mineBtn setImage:[UIImage imageNamed:@"btn_me"] forState:UIControlStateNormal];
        [_mineBtn addTarget:self action:@selector(clickMineBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mineBtn;
}


- (UINavigationController *)mineNav {
    if (!_mineNav) {
        MineViewController *vc = [MineViewController new];
        vc.title = @"我的";
        _mineNav = [[UINavigationController alloc] initWithRootViewController:vc];
        _mineNav.view.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H - 49);
    }
    return _mineNav;
}


- (void)clickMineBtn:(UIButton *)sender {
    [self.view addSubview:self.mineNav.view];
}

#pragma tabBar delegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    [self.mineNav.view removeFromSuperview];
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

