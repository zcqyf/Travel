//
//  SocketManager.h
//  sanda
//
//  Created by Mac on 17/3/31.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GCDAsyncSocket;
@interface SocketManager : NSObject
@property (strong, nonatomic)GCDAsyncSocket * mySocket;
+ (SocketManager *)sharedSocketManager;
@end
