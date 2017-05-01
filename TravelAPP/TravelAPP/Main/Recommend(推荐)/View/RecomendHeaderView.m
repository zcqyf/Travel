//
//  RecomendHeaderView.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/4/29.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "RecomendHeaderView.h"

@implementation RecomendHeaderView

+ (instancetype)initCustomHeaderViewWithFrame:(CGRect)frame {
    RecomendHeaderView *view = [[[NSBundle mainBundle] loadNibNamed:@"RecomendHeaderView" owner:nil options:nil] objectAtIndex:0];
    view.frame = frame;
    return view;
}

- (IBAction)clickAction:(UIButton *)sender {
    
}

@end
