//
//  MyInfo.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/19.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyInfo : NSObject

//1: 付费会员  2: 普通会员
@property (nonatomic, assign)NSInteger MemberType;

+(MyInfo *)shareInstance;

@end
