//
//  NSString+NSStringExtension.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/11.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "NSString+NSStringExtension.h"

@implementation NSString (NSStringExtension)

- (CGFloat)getTextHeightWithWidth:(CGFloat)width FontSzie:(CGFloat )fontSize {
 
    CGSize size = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
    
    return size.height;
}

@end
