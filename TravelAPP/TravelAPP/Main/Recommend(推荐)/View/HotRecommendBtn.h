//
//  HotRecommendBtn.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/4/29.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotRecommendBtn : UIButton

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *mytitleLabel;

+ (instancetype)initCustomBtnWithFrame:(CGRect)frame;

@end
