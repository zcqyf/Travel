//
//  Carousel.m
//  Bluetoothlock
//
//  Created by Mac on 17/5/17.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "Carousel.h"
#import "AFNetworking.h"
#import "HttpConstant.h"
#import "Carousel.h"
#import "MJExtension.h"
@implementation Carousel
+ (instancetype)shareCarousel{
    static Carousel *share = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        share = [[Carousel alloc]init];
    });
    return share;
}
- (void)getCarouselData:(NSDictionary *)param WithDataBlock:(void (^)(id data))dataBLock{
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"text/json",@"application/json",@"text/javascript",@"text/html", @"application/javascript", @"text/js",@"application/x-javascript", nil];
    [manager GET:KTLSDKCarousel parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //dataBLock(responseObject);
        NSLog(@"%@",responseObject);
        NSMutableArray *Adlist = [NSMutableArray array];
        Adlist = [Carousel mj_objectArrayWithKeyValuesArray:responseObject];
        dataBLock(Adlist);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

@end
