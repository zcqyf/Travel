//
//  Forgetpassword.m
//  Bluetoothlock
//
//  Created by Mac on 17/5/19.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "Forgetpassword.h"
#import "HttpConstant.h"
#import "AFNetworking.h"

@implementation Forgetpassword
+ (instancetype)shareForget{
    static Forgetpassword *share = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        share = [[Forgetpassword alloc]init];
    });
    return share;
}
- (void)getForgetData:(NSDictionary *)param WithDataBlock:(void (^)(id data))dataBLock{
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html", @"application/javascript", @"text/js",@"application/x-javascript", nil];
    
    [manager POST:KTLSDKForgetData parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        dataBLock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
        
        
        
    }];

}
@end
