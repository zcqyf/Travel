//
//  UserDetail.h
//  sanda
//
//  Created by Mac on 17/4/24.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDetail : NSObject
+(instancetype)shareUserDetail;
- (void)getDetailData:(NSString*)user_id  WithDataBlock:(void(^)(id data))dataBLock;

@end
