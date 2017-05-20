//
//  SocketManager.m
//  sanda
//
//  Created by Mac on 17/3/31.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import "SocketManager.h"
#import "GCDAsyncSocket.h"
@implementation SocketManager
+ (SocketManager *)sharedSocketManager
{
    static SocketManager *socket = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        socket = [[SocketManager alloc] init];
    });
    return socket;
}
@end
