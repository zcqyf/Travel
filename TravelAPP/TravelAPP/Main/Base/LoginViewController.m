//
//  LoginViewController.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/17.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "LoginViewController.h"
#import "RigsterViewController.h"
#import "MyInfo.h"
//#import "UserLogin.h"

@interface LoginViewController ()
//账号
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
//密码
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (nonatomic, strong)MyInfo *myInfo;


/*
 选择付费／普通会员
 */

@property (weak, nonatomic) IBOutlet UIView *segementBgView;
//付费会员:101
@property (weak, nonatomic) IBOutlet UIButton *PayMemberBtn;
//普通会员:102
@property (weak, nonatomic) IBOutlet UIButton *ordinaryMemberBtn;




@end

@implementation LoginViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    //默认为付费会员
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [self setUpView];
    
    
    
}
- (void)setUpView {
    self.segementBgView.layer.borderWidth = 1;
    self.segementBgView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.segementBgView.layer.cornerRadius = 15.0;
    self.segementBgView.layer.masksToBounds = YES;
    
    _PayMemberBtn.tag = 101;
    _ordinaryMemberBtn.tag = 102;
    
      [MyInfo shareInstance].MemberType = _PayMemberBtn.tag-100;

}

/*
 选择：付费会员／普通会员
 */
- (IBAction)selectMemberType:(UIButton *)sender {
    if (sender.tag == _PayMemberBtn.tag) {
        _PayMemberBtn.backgroundColor = [UIColor whiteColor];
        [_PayMemberBtn setTitleColor:LoginSegementColor forState:UIControlStateNormal];
        
        _ordinaryMemberBtn.backgroundColor = [UIColor clearColor];
        [_ordinaryMemberBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else if (sender.tag == _ordinaryMemberBtn.tag) {
        _PayMemberBtn.backgroundColor = [UIColor clearColor];
        [_PayMemberBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        _ordinaryMemberBtn.backgroundColor = [UIColor whiteColor];
        [_ordinaryMemberBtn setTitleColor:LoginSegementColor forState:UIControlStateNormal];
    }
    [MyInfo shareInstance].MemberType = sender.tag-100;
    
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
