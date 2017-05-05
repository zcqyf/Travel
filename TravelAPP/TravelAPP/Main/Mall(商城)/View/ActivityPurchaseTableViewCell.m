//
//  ActivityPurchaseTableViewCell.m
//  TravelAPP
//
//  Created by qing on 2017/5/4.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "ActivityPurchaseTableViewCell.h"

@implementation ActivityPurchaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.purchaseBtn.layer.cornerRadius = 5.0;
    self.purchaseBtn.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
