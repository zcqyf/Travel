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


@interface RigsterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UITextField *tuijianrenTextField;

@property (nonatomic,strong)NSMutableDictionary *params;

@end

@implementation RigsterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (NSMutableDictionary *)params {
    if (!_params) {
        _params = [[NSMutableDictionary alloc] init];
        _params[@"type"] = @"reg";
    }
    return _params;
}


- (IBAction)getCodeAction:(id)sender {
    [self checkTelNumber];
    [self getVerifyCode];
}

- (void)checkTelNumber {
    if (self.accountTextField.text.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"手机号码为空"];
    } else {
        if (![RegularExpression checkTelNumber:self.accountTextField.text]) {
            [SVProgressHUD showInfoWithStatus:@"手机号不合法"];
        } else {
            self.params[@"phone"] = self.accountTextField.text;
        }
    }
}

- (void)getVerifyCode {
    [VerCode.shareVerCode getVerCodeData:self.params WithDataBlock:^(id data) {
        if ([data isEqualToString:@"0"]) {//网络请求失败
            [SVProgressHUD showInfoWithStatus:@"网络请求失败"];
        } else if ([data isEqualToString:@"1"]) {//账号已存在
            [SVProgressHUD showInfoWithStatus:@"账号已存在"];
        } else {//成功获取验证码
            [SVProgressHUD showInfoWithStatus:@"验证码获取成功"];
        }
    }];
}

- (IBAction)nextAction:(id)sender {
    [self checkTelNumber];
    [self navigateToViewController];
}

- (void)navigateToViewController {
    SetPasswordViewController *vc = [SetPasswordViewController new];
    vc.title = @"设置密码";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"phone"] = self.accountTextField.text;
    vc.params = dict;
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
