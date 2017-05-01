//
//  DestinationCollectionViewCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/4/30.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "DestinationCollectionViewCell.h"

@implementation DestinationCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.myLabel.layer.cornerRadius = 5.0;
    self.myLabel.layer.masksToBounds = YES;
}

@end
