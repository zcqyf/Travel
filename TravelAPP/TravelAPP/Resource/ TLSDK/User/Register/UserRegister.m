//
//  UserRegister.m
//  sanda
//
//  Created by Mac on 17/4/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "UserRegister.h"
#import <AFNetworking.h>
#import "HttpConstant.h"

@implementation UserRegister
+ (instancetype)shareUserRegister {
    static UserRegister *share = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        share = [[UserRegister alloc]init];
    });
    return share;
}
- (void)getRegisterData:(NSDictionary *)param WithDataBlock:(void (^)(id data))dataBLock
{
    
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html", @"application/javascript", @"text/js",@"application/x-javascript", nil];
    
    [manager POST:KTLSDKRegisterUrl parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        dataBLock(responseObject);
        if ([[NSString stringWithFormat:@"%@",responseObject[@"status"]]isEqualToString:@"10001"]) {
            dataBLock(@"1");//成功
        }else if([[NSString stringWithFormat:@"%@",responseObject[@"status"]]isEqualToString:@"10002"]){
            dataBLock(@"0");//账号已存在
        }else{
            dataBLock(@"3");//账号或密码错误
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
        
        dataBLock(@"2");//网络访问失败
        
    }];
    
}

@end
