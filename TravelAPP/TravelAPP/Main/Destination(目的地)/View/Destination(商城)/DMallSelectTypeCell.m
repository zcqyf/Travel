//
//  DMallSelectTypeCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/9.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "DMallSelectTypeCell.h"

@implementation DMallSelectTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.myTitleLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.myTitleLabel.layer.borderWidth = 0.5;
}

@end
