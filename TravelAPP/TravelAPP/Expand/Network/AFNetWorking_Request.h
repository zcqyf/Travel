//
//  AFNetWorking_Request.h
//  AFnetWorking
//
//  Created by Gene_Ye on 16/10/18.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef void (^dataBlock)(id result);

@interface AFNetWorking_Request : NSObject

+ (void)getRequestWithUrl:(NSString *)urlString
                   Result:(dataBlock)block;

+ (void)postRequestWithUrl:(NSString *)urlString
             WithPrameters:(NSDictionary *)dictionary
                    Result:(dataBlock)block;

//检测网络连接状态  
+ (void)reach:(dataBlock)block;


@end








