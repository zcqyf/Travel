//
//  UserLogin.m
//  sanda
//
//  Created by Mac on 17/4/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "UserLogin.h"
#import "AFNetworking.h"
#import "HttpConstant.h"


@implementation UserLogin
+ (instancetype)shareUserLogin {
    static UserLogin *share = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        share = [[UserLogin alloc]init];
    });
    return share;
}
- (void)getLoginData:(NSDictionary*)param WithDataBlock:(void (^)(id data))dataBLock useridBlock:(void (^)(id userdata))userBlock
{
    NSLog(@"%@",param);
    if (![param[@"loginname"]isEqualToString:@""]||![param[@"password"]isEqualToString:@""]) {
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html", @"application/javascript", @"text/js",@"application/x-javascript", nil];
    
        [manager POST:KTLSDKLoginUrl parameters:@{@"post":param} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        //dataBLock(responseObject);
        if ([[NSString stringWithFormat:@"%@",responseObject[@"status"]]isEqualToString:@"10001"]) {
            dataBLock(@"1");
            NSMutableArray * loginArray = [NSMutableArray array];
            loginArray=responseObject;
            userBlock(responseObject[@"admin_user"]);
            
        }else{
            dataBLock(@"0");
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
        
        dataBLock(@"2");
        
    }];
    }else{
        dataBLock(@"3");
    }
}

@end
