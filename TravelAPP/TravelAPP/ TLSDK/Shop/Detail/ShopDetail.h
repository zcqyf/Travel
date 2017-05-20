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
//轮播
- (void)LbDetail:(NSDictionary*)param :(NSMutableArray*)DetailArray LbDataBlock:(void(^)(id data))LbBLock;
//cell
- (void)ListDetail:(NSDictionary*)param  ListDataBlock:(void(^)(id data))ListBLock;
//搜索
- (void)SeachDetail:(NSDictionary*)param seachDataBlock:(void(^)(id data))seachBlock;
@end
