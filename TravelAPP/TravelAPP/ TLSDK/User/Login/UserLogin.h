//
//  UserLogin.h
//  sanda
//
//  Created by Mac on 17/4/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserLogin : NSObject
+(instancetype)shareUserLogin;
- (void)getLoginData:(NSDictionary*)param  WithDataBlock:(void(^)(id data))dataBLock useridBlock:(void(^)(id userdata))userBlock;

@end
