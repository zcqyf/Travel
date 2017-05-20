//
//  Filedown.h
//  sanda
//
//  Created by Mac on 17/4/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Filedown : NSObject
+(instancetype)shareFiledown;
- (void)Filedown:(NSDictionary*)param  WithDataBlock:(void(^)(id data))dataBLock;

@end
