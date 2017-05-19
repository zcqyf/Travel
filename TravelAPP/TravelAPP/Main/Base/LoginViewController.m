//
//  LoginViewController.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/17.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "LoginViewController.h"
#import "RigsterViewController.h"
#import "UserLogin.h"

@interface LoginViewController ()
    @property (weak, nonatomic) IBOutlet UITextField *accountTextField;
    @property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

    @property (weak, nonatomic) IBOutlet UISegmentedControl *topSegementControl;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
}

/*
 选择：付费会员／普通会员
 */
- (IBAction)selectMemberTypeAction:(id)sender {
    
}

/*
 注册
 */
- (IBAction)registerAction:(UIButton *)sender {
    NSLog(@"1111");
    RigsterViewController *vc = [[RigsterViewController alloc] initWithNibName:@"RigsterViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:vc animated:true];
}
    
- (IBAction)forgetPasswordAction:(id)sender {
    
}
    
/*
 登录按钮
 */
- (IBAction)loginAction:(id)sender {
    
//    [[UserLogin shareUserLogin] getLoginData:<#(NSDictionary *)#> WithDataBlock:<#^(id data)dataBLock#> useridBlock:<#^(id userid)userBlock#>];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"isLoginSuccess" object:nil userInfo:@{@"isLoginSuccess":@1}];
}
    
    
/*
 tag：
 101: 微信登录
 102: QQ
 103: 新浪微博
 */
- (IBAction)thirdLoginAction:(UIButton *)sender {
    
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
