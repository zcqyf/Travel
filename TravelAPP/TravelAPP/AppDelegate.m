//
//  AppDelegate.m
//  TravelAPP
//
//  Created by qing on 2017/5/1.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarViewController.h"
#import "GuidanceViewController.h"
#import "LoginViewController.h"
#import "MyInfo.h"

@interface AppDelegate ()

@property (nonatomic, strong)TabBarViewController *tabBarVC;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    [_window makeKeyAndVisible];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isLogin:) name:@"isLoginSuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isNotFirstLogin:) name:@"isNotFirstLaunch" object:nil];
    

    _window.rootViewController = [GuidanceViewController new];
    _tabBarVC = [[TabBarViewController alloc] init];
    //设置tabBarItem样式
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor blackColor]}   forState:UIControlStateNormal];
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    
    //是否第一次启动app 1:为是第一次登录
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    
    if (![[user objectForKey:@"isFirstLaunch"]  isEqual: @"1"]) {
        [user setObject:@"1" forKey:@"isFirstLaunch"];
    }
    
    return YES;
}

- (void)isLogin:(NSNotification *)notification {
    
    NSDictionary *dic = notification.userInfo;
    NSNumber *num = [dic objectForKey:@"isLoginSuccess"];
    
    if (num.intValue == 1) {
        
        if ([MyInfo shareInstance].MemberType == 1) {
            _tabBarVC.selectedIndex = 1;
        }else{
           _tabBarVC.selectedIndex = 0;
        }
       _window.rootViewController = _tabBarVC ;
        
    }
    
}

- (void)isNotFirstLogin:(NSNotification *)notification {

    _window.rootViewController = _tabBarVC ;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
