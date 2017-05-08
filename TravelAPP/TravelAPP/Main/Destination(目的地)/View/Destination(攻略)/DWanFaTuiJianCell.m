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
    CGFloat btnW = 300;
    CGFloat btnH = 300;
    NSInteger count = 3;
    
    self.backgoundScrollView.contentSize = CGSizeMake(btnW * count, 0);
    
    for (int i = 0; i < count; i++) {
        RecommendWanFaBtn *btn = [RecommendWanFaBtn initCustomBtnWithFrame:CGRectMake(btnW * i, 0, btnW, self.backgoundScrollView.frame.size.height)];
        btn.tag = 1000 + i;
        [self.backgoundScrollView addSubview:btn];
        
    }
}

@end
