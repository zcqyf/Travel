//
//  ShopDetail.h
//  sanda
//
//  Created by Mac on 17/5/10.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopDetail : NSObject
+(instancetype)shareshopDetail;
- (void)LbDetail:(NSDictionary*)param  LbDataBlock:(void(^)(id data))LbBLock;
- (void)ListDetail:(NSDictionary*)param  ListDataBlock:(void(^)(id data))ListBLock;

@end
