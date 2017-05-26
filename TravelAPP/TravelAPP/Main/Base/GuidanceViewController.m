//
//  GuidanceViewController.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/15.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "GuidanceViewController.h"
#import "LoginViewController.h"
#import "TabBarViewController.h"
#import "MyInfo.h"

@interface GuidanceViewController ()
    
@property (nonatomic, strong)NSTimer *timer;

@property (nonatomic, assign)int timeCount;

@property (nonatomic, strong)UILabel *countDownLabel;
    
@property (nonatomic, strong)UIImageView *imageView;



@end

@implementation GuidanceViewController

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
        _imageView.backgroundColor = [UIColor blackColor];
    }
    return _imageView;
}
- (UILabel *)countDownLabel {
    if (!_countDownLabel) {
        _countDownLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_W/2 -50, SCREEN_H/2 - 50, 100, 100)];
        _countDownLabel.textColor = [UIColor cyanColor];
        
        _countDownLabel.font = [UIFont systemFontOfSize:30];
    }
    return _countDownLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"mineInfo: %ld", (long)[MyInfo shareInstance].MemberType);
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.imageView];
    [self.view addSubview:self.countDownLabel];

    _timeCount = 2;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange:) userInfo:nil repeats:YES];

}

- (void)timeChange:(NSTimer *)timer {
    self.countDownLabel.text = [NSString stringWithFormat:@"%d",_timeCount];
    _timeCount --;
    if (_timeCount < 0) {
        [_timer invalidate];
        [self checkLaunchAndLoginState];
    }
}

- (void)checkLaunchAndLoginState {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (![userDefaults objectForKey:@"isFirstLaunch"]) {
        [NSUserDefaults.standardUserDefaults setObject:@"YES" forKey:@"isFirstLaunch"];
        LoginViewController *vc = [LoginViewController new];
        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:[[UINavigationController alloc] initWithRootViewController:vc] animated:true completion:nil];
    } else {
        #pragma MARK: 改成rootViewController还是直接present?
        //            UIApplication.sharedApplication.keyWindow.rootViewController = [TabBarViewController new];
        TabBarViewController *vc = [TabBarViewController new];
        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:vc animated:true completion:nil];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
