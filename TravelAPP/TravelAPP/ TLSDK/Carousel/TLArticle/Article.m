//
//  Article.m
//  Bluetoothlock
//
//  Created by Mac on 17/5/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "Article.h"
#import "HttpConstant.h"
#import "AFNetworking.h"

@implementation Article
+ (instancetype)shareArticle{
    static Article *share = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        share = [[Article alloc]init];
    });
    return share;
}
- (void)getArtClasssData:(NSDictionary *)param WithDataBlock:(void (^)(id data))dataBLock{
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html", @"application/javascript", @"text/js",@"application/x-javascript", nil];
    [manager GET:KTLSDKArticleclass parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        dataBLock(responseObject);
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

}

- (void)getArtListData:(NSDictionary *)param WithDataBlock:(void (^)(id data))dataBLock{
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html", @"application/javascript", @"text/js",@"application/x-javascript", nil];
    [manager GET:KTLSDKArticlelist parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        dataBLock(responseObject);
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
 
}

- (void)getArtDetailData:(NSDictionary *)param WithDataBlock:(void (^)(id data))dataBLock
{
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html", @"application/javascript", @"text/js",@"application/x-javascript", nil];
    [manager GET:KTLSDKArticledetail parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        dataBLock(responseObject);
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
    }];

}
@end
