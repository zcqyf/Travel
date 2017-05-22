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
#import "UserLogin.h"
#import "NavBarView.h"

@interface LoginViewController ()
//账号
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
//密码
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (nonatomic, strong)MyInfo *myInfo;

@property (weak, nonatomic) IBOutlet UIView *navBarView;

@property (nonatomic,strong)NSMutableDictionary *params;

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

- (NSMutableDictionary *)params {
    if (!_params) {
        _params = [[NSMutableDictionary alloc] init];
        _params[@"type"] = @"login";
    }
    return _params;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //默认为付费会员
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes: @{NSForegroundColorAttributeName:[UIColor whiteColor]}];//设置title颜色
    [self setUpView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:true];
}

- (void)setUpView {
    self.segementBgView.layer.borderWidth = 1;
    self.segementBgView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.segementBgView.layer.cornerRadius = 15.0;
    self.segementBgView.layer.masksToBounds = YES;
    
    _PayMemberBtn.tag = 101;
    _ordinaryMemberBtn.tag = 102;
    
    _accountTextField.tag = 201;
    _passwordTextField.tag = 202;
//    [_accountTextField addTarget:self action:@selector(myTextFieldvalueChange:) forControlEvents:UIControlEventValueChanged];
//    [_passwordTextField addTarget:self action:@selector(myTextFieldvalueChange:) forControlEvents:UIControlEventValueChanged];
    
    [MyInfo shareInstance].MemberType = _PayMemberBtn.tag-100;
    
    NavBarView *pathView = [[NavBarView alloc] initWithFrame:self.navBarView.bounds];
    pathView.backgroundColor = [UIColor whiteColor];
    [self.navBarView insertSubview:pathView atIndex:0];
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
    vc.title = @"会员注册";
    [self.navigationController pushViewController:vc animated:true];
}
    
- (IBAction)forgetPasswordAction:(id)sender {
    
}
    
/*
 登录按钮
 */
- (IBAction)loginAction:(id)sender {
    
    self.params[@"username"] = _accountTextField.text;
    self.params[@"password"] = _passwordTextField.text;
    NSLog(@"%@",self.params);
    
    [[UserLogin shareUserLogin] getLoginData:self.params WithDataBlock:^(id data) {
        NSLog(@"%@",data);
    } useridBlock:^(id userid) {
        
    }];
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"isLoginSuccess" object:nil userInfo:@{@"isLoginSuccess":@1}];
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
