//
//  VerCode.m
//  Bluetoothlock
//
//  Created by Mac on 17/5/16.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "VerCode.h"
#import "AFNetworking.h"
#import "HttpConstant.h"

@implementation VerCode
+ (instancetype)shareVerCode{
    static VerCode *share = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        share = [[VerCode alloc]init];
    });
    return share;
}
- (void)getVerCodeData:(NSDictionary*)param  WithDataBlock:(void(^)(id data))dataBLock{
    NSLog(@"%@",param);
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html", @"application/javascript", @"text/js",@"application/x-javascript", nil];
    [manager GET:KTLSDKVerCode parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        if ([[NSString stringWithFormat:@"%@",responseObject[@"status"]]isEqualToString:@"10000"]) {
            dataBLock(responseObject[@"regcode"]);
        }else if ([[NSString stringWithFormat:@"%@",responseObject[@"status"]]isEqualToString:@"10001"]){
            dataBLock(@"1");//账号已存在
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
            dataBLock(@"0");//网络请求失败
    }];
    
}
@end
