//
//  Hexconversion.h
//  sanda
//
//  Created by Mac on 17/3/30.
//  Copyright © 2017年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hexconversion : NSObject
//字符串转data
+(NSData*)hexToBytes:(NSString *)str;
//将十进制转化为十六进制
+ (NSString *)ToHex:(int)tmpid;
//Byte转NSData
+ (NSData*) byteToData:(Byte)value;
//十进制转二进制
+ (NSString *)toBinarySystemWithDecimalSystem:(int)num length:(int)length;
//二进制转十进制
+ (NSString *)toDecimalWithBinary:(NSString *)binary;
//16进制和2进制互转
+ (NSString *)getBinaryByhex:(NSString *)hex binary:(NSString *)binary;
//求和校验

@end
