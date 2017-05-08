//
//  TRJourneyBottomView.m
//  TravelAPP
//
//  Created by qing on 2017/5/8.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TRJourneyBottomView.h"

@implementation TRJourneyBottomView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.bottomReplyView.layer.cornerRadius = 5.0;
    self.bottomReplyView.layer.masksToBounds = YES;
    self.bottomReplyView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.bottomReplyView.layer.borderWidth = 0.5;
}

@end
