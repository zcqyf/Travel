//
//  RecomendHeaderView.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/4/29.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecomendHeaderView : UIView

@property (weak, nonatomic) IBOutlet UIButton *moreBtn;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;

+ (instancetype)initCustomHeaderViewWithFrame:(CGRect)frame;

@end
