//
//  CalendarCollectionViewCell.m
//  oc_日历
//
//  Created by Gene_Ye on 2017/5/4.
//  Copyright © 2017年 Gene. All rights reserved.
//

#import "CalendarCollectionViewCell.h"

@implementation CalendarCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.myTitleLabel.layer.cornerRadius = 10.0;
    self.myTitleLabel.layer.masksToBounds = YES;
}

@end
