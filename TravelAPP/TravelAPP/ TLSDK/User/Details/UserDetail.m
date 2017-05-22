//
//  UserDetail.m
//  sanda
//
//  Created by Mac on 17/4/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "UserDetail.h"
#import "AFNetworking.h"
#import "HttpConstant.h"

@implementation UserDetail
+ (instancetype)shareUserDetail {
    static UserDetail *share = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        share = [[UserDetail alloc]init];
    });
    return share;
}

- (void)getDetailData:(NSString *)user_id WithDataBlock:(void (^)(id data))dataBLock
{
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html", @"application/javascript", @"text/js",@"application/x-javascript", nil];
    [manager GET:KTLSDKDetailUrl parameters:@{@"user_id":@"16"} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        dataBLock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
//    [manager POST:KTLSDKDetailUrl parameters:@{@"user_id":user_id} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSMutableArray*detail = [NSMutableArray array];
//        
//        detail = responseObject[@"detail"];
//        
//        dataBLock(detail);
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"请求失败");
//        
//        dataBLock(@"0");
//        
//    }];
  
}
- (void)getmodifyDetail:(NSDictionary *)param WithDataBlock:(void (^)(id))modifyBLock
{
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html", @"application/javascript", @"text/js",@"application/x-javascript", nil];
    
    [manager POST:KTLSDKDetailUrl parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败");
        
    
    }];

}
@end
