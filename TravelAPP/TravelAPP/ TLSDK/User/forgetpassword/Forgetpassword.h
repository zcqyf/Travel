//
//  Forgetpassword.h
//  Bluetoothlock
//
//  Created by Mac on 17/5/19.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Forgetpassword : NSObject
+(instancetype)shareForget;
- (void)getForgetData:(NSDictionary*)param  WithDataBlock:(void(^)(id data))dataBLock;
@end
