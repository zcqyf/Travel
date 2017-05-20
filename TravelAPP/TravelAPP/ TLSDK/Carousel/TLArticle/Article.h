//
//  Article.h
//  Bluetoothlock
//
//  Created by Mac on 17/5/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject
+(instancetype)shareArticle;
- (void)getArtClasssData:(NSDictionary*)param  WithDataBlock:(void(^)(id data))dataBLock;

- (void)getArtListData:(NSDictionary *)param WithDataBlock:(void (^)(id data))dataBLock;

- (void)getArtDetailData:(NSDictionary *)param WithDataBlock:(void (^)(id data))dataBLock;
@end
