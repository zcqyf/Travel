//
//  HotRecommendBtn.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/4/29.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "HotRecommendBtn.h"

@implementation HotRecommendBtn

+(instancetype)initCustomBtnWithFrame:(CGRect)frame {
    HotRecommendBtn *btn = [[[NSBundle mainBundle] loadNibNamed:@"HotRecommendBtn" owner:nil options:nil] objectAtIndex:0];
    
    btn.frame = frame;
    
    return btn;
}
@end
