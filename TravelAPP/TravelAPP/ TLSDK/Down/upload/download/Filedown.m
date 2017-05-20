//
//  Filedown.m
//  sanda
//
//  Created by Mac on 17/4/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "Filedown.h"
#import "AFNetworking.h"
#import "HttpConstant.h"

@implementation Filedown
+ (instancetype)shareFiledown{
    static Filedown*share = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        
    });
    return share;
  
}
-(void)Filedown:(NSDictionary*)param WithDataBlock:(void (^)(id data))dataBLock
{
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html", @"application/javascript", @"text/js",@"application/x-javascript", nil];
    
    [manager GET:@"" parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    

}
@end
