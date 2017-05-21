//
//  MyInfo.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/19.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "MyInfo.h"

static MyInfo *myInfo = nil;

@implementation MyInfo

+(MyInfo *)shareInstance {
    if (myInfo == nil) {
        myInfo = [[MyInfo alloc] init];
    }
    return myInfo;
}

//为了防止alloc或者new创建新的实例变量

+(id)allocWithZone:(struct _NSZone *)zone{
    
    /*
     @synchronized 创建一个互斥锁，保证此时没有其它线程对self对象进行修改，起到线程保护作用
     */
    @synchronized (self) {
        if (myInfo == nil) {
            myInfo = [super allocWithZone:zone];
        }
    }
    return myInfo;
}


@end
