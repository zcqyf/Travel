//
//  equipList.m
//  Bluetoothlock
//
//  Created by Mac on 17/5/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "equipList.h"
#import "HttpConstant.h"
#import "AFNetworking.h"

@implementation equipList
+ (instancetype)shareequipList{
    static equipList * share = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        share = [[equipList alloc]init];
    });
    return share;
}
- (void)getequipList:(NSDictionary*)param  WithDataBlock:(void(^)(id data))dataBLock{
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html", @"application/javascript", @"text/js",@"application/x-javascript", nil];
    [manager GET:KTLSDKVerCode parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
//        if ([[NSString stringWithFormat:@"%@",responseObject[@"status"]]isEqualToString:@"10001"]) {
//            dataBLock(responseObject[@"regcode"]);
//        }else {
//            dataBLock(@"1");//账号已存在
//        }
        dataBLock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        dataBLock(@"0");//网络请求失败
    }];
  
}
@end
