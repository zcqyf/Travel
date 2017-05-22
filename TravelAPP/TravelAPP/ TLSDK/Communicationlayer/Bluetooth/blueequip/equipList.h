//
//  equipList.h
//  Bluetoothlock
//
//  Created by Mac on 17/5/22.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface equipList : NSObject
+(instancetype)shareequipList;
- (void)getequipList:(NSDictionary*)param  WithDataBlock:(void(^)(id data))dataBLock ;
@end
