//
//  DZhuSuBtn.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/8.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "DZhuSuBtn.h"

@implementation DZhuSuBtn

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.backgoundView.layer.borderWidth = 0.5;
    self.backgoundView.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

@end
