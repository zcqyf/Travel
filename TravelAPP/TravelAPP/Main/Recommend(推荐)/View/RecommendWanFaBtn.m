//
//  RecommendWanFaBtn.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/7.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "RecommendWanFaBtn.h"

@implementation RecommendWanFaBtn

-(void)awakeFromNib {
    [super awakeFromNib];
    
    self.headerImageView.layer.cornerRadius = 39.0;
    self.headerImageView.layer.masksToBounds = YES;
}

+(instancetype)initCustomBtnWithFrame:(CGRect)frame {
    RecommendWanFaBtn *btn = [[[NSBundle mainBundle] loadNibNamed:@"RecommendWanFaBtn" owner:nil options:nil] objectAtIndex:0];
    
    btn.frame = frame;
    
    return btn;
}

@end
