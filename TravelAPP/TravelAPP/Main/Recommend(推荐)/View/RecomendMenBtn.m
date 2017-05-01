//
//  RecomendMenBtn.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/4/29.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "RecomendMenBtn.h"

@implementation RecomendMenBtn

+(instancetype)initCustomBtnWithFrame:(CGRect)frame {
    RecomendMenBtn *btn = [[[NSBundle mainBundle] loadNibNamed:@"RecomendMenBtn" owner:nil options:nil] objectAtIndex:0];
    btn.frame = frame;
    btn.authorLabel.layer.cornerRadius = 5.0;
    btn.authorLabel.layer.masksToBounds = YES;
    return btn;
}

@end
