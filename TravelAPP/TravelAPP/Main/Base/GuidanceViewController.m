//
//  GuidanceViewController.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/15.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "GuidanceViewController.h"
#import "AppDelegate.h"

@interface GuidanceViewController ()
    
@property (nonatomic, strong)NSTimer *timer;

@property (nonatomic, assign)int timeCount;

@property (nonatomic, strong)UILabel *countDownLabel;

@end

@implementation GuidanceViewController
    
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
    
    [self.view addSubview:self.countDownLabel];

    _timeCount = 4;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange:) userInfo:nil repeats:YES];

}

- (void)timeChange:(NSTimer *)timer {
    self.countDownLabel.text = [NSString stringWithFormat:@"%d",_timeCount];
    _timeCount --;
    
    if (_timeCount < 0) {
        [_timer invalidate];
        
//        [UIView animateWithDuration:10 animations:^{
//            self.view.alpha = 0.5;
//            
//        }];
        
        [self.view removeFromSuperview];
       
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
