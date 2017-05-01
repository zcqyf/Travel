//
//  BlankCollectionReusableView.m
//  TravelAPP
//
//  Created by qing on 2017/4/29.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "BlankCollectionReusableView.h"

@implementation BlankCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [[UIColor alloc] initWithRed:0.96 green:0.96 blue:0.96 alpha:1.0];
}

@end
