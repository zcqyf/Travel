//
//  DWanFaTuiJianCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/8.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "DWanFaTuiJianCell.h"
#import "RecommendWanFaBtn.h"

@implementation DWanFaTuiJianCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat h = self.bgView.frame.size.height;
    CGFloat w = self.bgView.frame.size.width;
    NSInteger count = 3;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
    scrollView.contentSize = CGSizeMake(300 * count, 0);

    [self.bgView addSubview:scrollView];
    
    for (int i = 0; i < 3; i++) {
        RecommendWanFaBtn *btn = [RecommendWanFaBtn initCustomBtnWithFrame:CGRectMake(300 * i, 0, 300, h)];
        btn.tag = 1000 + i;
        [scrollView addSubview:btn];
        
    }

    
}

@end
