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
#import "RegularExpression.h"
#import "NavBarView.h"

@interface RigsterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UITextField *tuijianrenTextField;

@property (nonatomic,strong)NSMutableDictionary *params;
@property (nonatomic,strong)NSMutableDictionary *passDict;
@property (weak, nonatomic) IBOutlet UIView *navBarView;

@end

@implementation RigsterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NavBarView *pathView = [[NavBarView alloc] initWithFrame:self.navBarView.bounds];
    pathView.backgroundColor = [UIColor whiteColor];
    [self.navBarView insertSubview:pathView atIndex:0];
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


- (IBAction)getCodeAction:(id)sender {
    if (![self checkTelNumber]) {
        return;
    } else {
        [self getVerifyCode];
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

- (void)getVerifyCode {
    [VerCode.shareVerCode getVerCodeData:self.params WithDataBlock:^(id data) {
        if ([data isEqualToString:@"0"]) {//网络请求失败
            [SVProgressHUD showInfoWithStatus:@"网络请求失败"];
        } else if ([data isEqualToString:@"1"]) {//账号已存在
            #pragma 存在问题：账号已存在也会发送验证码 TODO
            [SVProgressHUD showInfoWithStatus:@"账号已存在"];
        } else {//成功获取验证码
            [SVProgressHUD showInfoWithStatus:@"验证码获取成功"];
        }
    }];
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
//        param :phone,password,loginname ，code
        flag = YES;
    }
    
    return flag;
}

- (void)navigateToViewController {
    SetPasswordViewController *vc = [SetPasswordViewController new];
    vc.title = @"设置密码";
    self.passDict[@"phone"] = self.accountTextField.text;
    vc.params = self.passDict;
    [self.navigationController pushViewController:vc animated:YES];
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
