//
//  GuidanceViewController.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/15.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "GuidanceViewController.h"
#import "LoginViewController.h"

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
        
//        CATransition *animation = [CATransition animation];
//        
//        animation.subtype = kCATransitionFromRight;
//        
//        animation.duration = 1;
//        
//        
//        
//        animation.type = @"camer_typeaIrisHollowClose";
//        
//        [self.imageView.layer addAnimation:animation forKey:nil];
        
//        [self.view removeFromSuperview];
        LoginViewController *vc = [LoginViewController new];
        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:[[UINavigationController alloc] initWithRootViewController:vc] animated:true completion:^{
        
        }];
        
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
