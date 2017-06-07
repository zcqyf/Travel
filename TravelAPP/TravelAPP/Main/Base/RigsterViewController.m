//
//  RigsterViewController.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/17.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "RigsterViewController.h"
#import "VerCode.h"
#import <SVProgressHUD.h>
#import "SetPasswordViewController.h"
#import "NavBarView.h"

@interface RigsterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UITextField *tuijianrenTextField;

@property (nonatomic,strong)NSMutableDictionary *params;
@property (nonatomic,strong)NSMutableDictionary *passDict;
@property (weak, nonatomic) IBOutlet UIView *navBarView;
@property (weak, nonatomic) IBOutlet UIButton *verifyCodeBtn;

@property (nonatomic,strong)NSTimer *timer;

@end

@implementation RigsterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self verifyCodeBtnStateNormal];
    
    NavBarView *pathView = [[NavBarView alloc] initWithFrame:self.navBarView.bounds];
    pathView.backgroundColor = [UIColor whiteColor];
    [self.navBarView insertSubview:pathView atIndex:0];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)verifyCodeBtnStateNormal {
    self.verifyCodeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    self.verifyCodeBtn.layer.borderWidth = 1.0;
    self.verifyCodeBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.verifyCodeBtn.layer.cornerRadius = 5.0;
    self.verifyCodeBtn.layer.masksToBounds = YES;
    self.verifyCodeBtn.backgroundColor = [UIColor colorWithRed:254/255.0 green:202/255.0 blue:66/255.0 alpha:1.0];
    [self.verifyCodeBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
}

- (void)verifyCodeBtnStatePressDown:(int)i {
    self.verifyCodeBtn.backgroundColor = [UIColor lightGrayColor];
    [self.verifyCodeBtn setTitle:[NSString stringWithFormat:@"%d秒后重新获取", i] forState:UIControlStateNormal];
    self.verifyCodeBtn.titleLabel.textColor = [UIColor whiteColor];
    self.verifyCodeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
}

- (NSMutableDictionary *)params {
    if (!_params) {
        _params = [[NSMutableDictionary alloc] init];
        _params[@"type"] = @"reg";
    }
    return _params;
}

- (NSMutableDictionary *)passDict {
    if (!_passDict) {
        _passDict = [[NSMutableDictionary alloc] init];
    }
    return _passDict;
}


- (IBAction)getCodeAction:(UIButton *)sender {
    [sender setEnabled:NO];
    if (![self checkTelNumber]) {
        [sender setEnabled:YES];
        return;
    } else {
        [self getVerifyCode:sender];
    }
}

- (BOOL)checkTelNumber {
    BOOL flag = NO;
    if (self.accountTextField.text.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"手机号码为空"];
    } else {
        if (![RegularExpression checkTelNumber:self.accountTextField.text]) {
            [SVProgressHUD showInfoWithStatus:@"手机号不合法"];
        } else {
            self.params[@"phone"] = self.accountTextField.text;
            flag = YES;
        }
    }
    return flag;
}

- (void)getVerifyCode:(UIButton *)sender {
    //倒计时
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDownToGetVerifyCode:) userInfo:nil repeats:YES];
    
    [VerCode.shareVerCode getVerCodeData:self.params WithDataBlock:^(id data) {
        if ([data isEqualToString:@"0"]) {//网络请求失败
            [SVProgressHUD showInfoWithStatus:@"网络请求失败"];
            [sender setEnabled:YES];
            [self verifyCodeBtnStateNormal];
        } else if ([data isEqualToString:@"1"]) {//账号已存在
            #pragma 存在问题：账号已存在也会发送验证码 TODO
            [SVProgressHUD showInfoWithStatus:@"账号已存在"];
            [sender setEnabled:YES];
            [self verifyCodeBtnStateNormal];
        } else {//成功获取验证码
            [SVProgressHUD showSuccessWithStatus:@"验证码获取成功"];
        }
    }];
}

- (void)countDownToGetVerifyCode:(NSTimer *)sender {
    static int i = 60;
    [self verifyCodeBtnStatePressDown:i];
    if (i <= 0) {
        [self.verifyCodeBtn setEnabled:YES];
        [self verifyCodeBtnStateNormal];
        i = 60;
        [_timer invalidate];
        _timer = nil;
    }
    i --;
}


- (IBAction)nextAction:(id)sender {
    if (![self checkTelNumber] || ![self checkVerifyCode]) {//缺验证码
        return;
    } else {
        [self navigateToViewController];
    }
}

- (BOOL)checkVerifyCode {
    BOOL flag = NO;
    
    if (self.codeTextField.text.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"请输入验证码"];
    } else {
        self.params[@"code"] = self.codeTextField.text;
        flag = YES;
    }
    
    return flag;
}

- (void)navigateToViewController {
    SetPasswordViewController *vc = [SetPasswordViewController new];
    vc.title = @"设置密码";
    [self assignValueToPassDict];
    vc.params = self.passDict;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)assignValueToPassDict {
    self.passDict[@"phone"] = self.accountTextField.text;
    self.passDict[@"loginname"] = @"";
    self.passDict[@"code"] = self.codeTextField.text;
    self.passDict[@"recommender"] = @"";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
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
