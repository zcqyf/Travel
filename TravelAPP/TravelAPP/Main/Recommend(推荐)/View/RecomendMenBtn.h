//
//  RecomendMenBtn.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/4/29.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecomendMenBtn : UIButton
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *myTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *myContentLabel;

+ (instancetype)initCustomBtnWithFrame:(CGRect)frame;

@end
