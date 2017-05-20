//
//  ShopDetail.m
//  sanda
//
//  Created by Mac on 17/5/10.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "ShopDetail.h"
#import "AFNetworking.h"
#import "LbModel.h"
#import "MJExtension.h"

@implementation ShopDetail
+ (instancetype)shareshopDetail{
    static ShopDetail*share = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        
    });
    return share;
    
}
- (void)LbDetail:(NSDictionary *)param DetaArray:(NSMutableArray*)DetailArray LbDataBlock:(void (^)(id data))LbBLock{
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    NSMutableArray * _LisrArray = [NSMutableArray array];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html", @"application/javascript", @"text/js",@"application/x-javascript", nil];
    
    [manager GET:@"" parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSMutableArray * _topDataArray = [NSMutableArray array];
//        NSMutableArray * _imageArray = [NSMutableArray array];
//        NSMutableArray * _idArray = [NSMutableArray array];
//        NSMutableArray *_titleArray = [NSMutableArray array];
        _topDataArray = [LbModel mj_objectArrayWithKeyValuesArray:responseObject[@"content"]];
        
    
        LbBLock(_topDataArray);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        LbBLock(_LisrArray);
    }];
}

- (void)ListDetail:(NSDictionary *)param ListDataBlock:(void (^)(id))ListBLock{
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html", @"application/javascript", @"text/js",@"application/x-javascript", nil];
    
    [manager GET:@"" parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSMutableArray * _topDataArray = [NSMutableArray array];
        _topDataArray = responseObject[@"list"];
        ListBLock(_topDataArray);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}

- (void)SeachDetail:(NSDictionary *)param seachDataBlock:(void (^)(id))seachBlock
{
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html", @"application/javascript", @"text/js",@"application/x-javascript", nil];
    
    [manager GET:@"" parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray * _Seachlist = [NSMutableArray array];
        _Seachlist = responseObject[@"list"];
        seachBlock(_Seachlist);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}
@end
