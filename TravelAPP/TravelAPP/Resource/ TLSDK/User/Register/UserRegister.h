//
//  UserRegister.h
//  sanda
//
//  Created by Mac on 17/4/23.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserRegister : NSObject
+(instancetype)shareUserRegister;
- (void)getRegisterData:(NSDictionary*)param  WithDataBlock:(void(^)(id data))dataBLock;

@end
