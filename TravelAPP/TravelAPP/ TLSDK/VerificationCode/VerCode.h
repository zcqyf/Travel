//
//  VerCode.h
//  Bluetoothlock
//
//  Created by Mac on 17/5/16.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VerCode : NSObject
+(instancetype)shareVerCode;
- (void)getVerCodeData:(NSDictionary*)param  WithDataBlock:(void(^)(id data))dataBLock ;
@end
