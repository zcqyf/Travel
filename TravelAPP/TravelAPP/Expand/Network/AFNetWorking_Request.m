//
//  AFNetWorking_Request.m
//  AFnetWorking
//
//  Created by Gene_Ye on 16/10/18.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "AFNetWorking_Request.h"

@implementation AFNetWorking_Request

+ (void)reach:(dataBlock)block{
    /**
     AFNetworkReachabilityStatusUnknown          未知
     AFNetworkReachabilityStatusNotReachable     无连接
     AFNetworkReachabilityStatusReachableViaWWAN 流量
     AFNetworkReachabilityStatusReachableViaWiFi wifi
     */
    //检测网络
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        block(@(status));
        
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

+ (void)getRequestWithUrl:(NSString *)urlString Result:(dataBlock)block{
    
//    NSString *urlString = @"http://bilibili-service.daoapp.io/allrank";
    
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //absoluteString 完整的 url 字符串
    [manager GET:url.absoluteString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        block(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@",error.debugDescription);
    }];

    
    
}

+ (void)postRequestWithUrl:(NSString *)urlString WithPrameters:(NSDictionary *)dictionary Result:(dataBlock)block{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
//    NSDictionary *dic = @{@"content":@"极乐净土",@"page":@"0",@"count":@"10"};
    
    [manager POST:urlString parameters:dictionary progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error.debugDescription);
    }];

    
}



@end
