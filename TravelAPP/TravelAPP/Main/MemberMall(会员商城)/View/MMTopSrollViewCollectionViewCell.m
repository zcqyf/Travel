//
//  TopSrollViewCollectionViewCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/2.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "MMTopSrollViewCollectionViewCell.h"
#import "TopScrollView.h"

@implementation MMTopSrollViewCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setupScrollView];
}


- (void)setupScrollView{
    TopScrollView *view = [[TopScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)];
    
    [self addSubview:view];
}

@end
