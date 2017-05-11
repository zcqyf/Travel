//
//  CALayer+XibBorderColor.m
//  TravelAPP
//
//  Created by qing on 2017/5/12.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "CALayer+XibBorderColor.h"

@implementation CALayer (XibBorderColor)

- (void)setBorderColorWithUIColor:(UIColor *)color {
    self.borderColor = color.CGColor;
}

@end
