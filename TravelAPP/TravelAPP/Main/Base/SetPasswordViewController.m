//
//  SetPasswordViewController.m
//  TravelAPP
//
//  Created by qing on 2017/5/20.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "SetPasswordViewController.h"
#import "UserRegister.h"
#import "RegularExpression.h"
#import <SVProgressHUD.h>
#import "LoginViewController.h"
#import "NavBarView.h"

@interface SetPasswordViewController ()

@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;
@property (weak, nonatomic) IBOutlet UIView *navBarView;

@end

@implementation SetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NavBarView *pathView = [[NavBarView alloc] initWithFrame:self.navBarView.bounds];
    pathView.backgroundColor = [UIColor whiteColor];
    [self.navBarView insertSubview:pathView atIndex:0];
}


- (IBAction)clickToFinish:(UIButton *)sender {
    [self getPassword];
}

- (void)popToViewController {
    for (UIViewController *vc in self.navigationController.viewControllers) {
        if ([vc isKindOfClass:[LoginViewController class]]) {
            [self.navigationController popToViewController:vc animated:YES];
            return;
        }
    }
}

- (void)dealwithResult:(id)data {
    int value = [data intValue];
    switch (value) {
        case 0://账号已存在
        {
            [SVProgressHUD showInfoWithStatus:@"账号已存在"];
        }
            break;
            
        case 1://注册成功
        {
            [SVProgressHUD showInfoWithStatus:@"注册成功"];
            [self popToViewController];
        }
            break;
            
        case 2://网络访问失败
        {
            [SVProgressHUD showInfoWithStatus:@"网络访问失败"];
        }
            break;
            
        case 3://账号或密码错误
        {
            [SVProgressHUD showInfoWithStatus:@"账号或密码错误"];
        }
            break;
            
        case 4://请把信息填完整
        {
            [SVProgressHUD showInfoWithStatus:@"请把信息填完整"];
        }
            break;
            
        default:
            break;
    }
}

- (void)getPassword {
    if (self.password.text.length == 0 || self.confirmPassword.text.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"密码不能为空"];
        
    } else {
        [self checkPassword];
    }
    
}

- (void)checkPassword {
    if (![RegularExpression checkPassword:self.password.text] || ![RegularExpression checkPassword:self.confirmPassword.text]) {
        [SVProgressHUD showInfoWithStatus:@"密码格式不正确"];
    } else {
        [self comparePassword];
    }
}

- (void)comparePassword {
    if (![self.password.text isEqualToString:self.confirmPassword.text]) {
        [SVProgressHUD showInfoWithStatus:@"两次密码输入不一致"];
    } else {
        //        phone password username  缺少username 设置密码界面
        self.params[@"password"] = self.password.text;
        [UserRegister.shareUserRegister getRegisterData:self.params Recommender:@"" WithDataBlock:^(id data) {
            [self dealwithResult:data];
        }];
//        [UserRegister.shareUserRegister getRegisterData:self.params WithDataBlock:^(id data) {
//            [self dealwithResult:data];
//        }];
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
