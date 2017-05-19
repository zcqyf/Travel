//
//  RigsterViewController.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/17.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "RigsterViewController.h"
#import "UserRegister.h"

@interface RigsterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;
@property (weak, nonatomic) IBOutlet UITextField *tuijianrenTextField;

@end

@implementation RigsterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)getCodeAction:(id)sender {
    
}
- (IBAction)nextAction:(id)sender {
    UserRegister *userRegister = [UserRegister shareUserRegister];
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
