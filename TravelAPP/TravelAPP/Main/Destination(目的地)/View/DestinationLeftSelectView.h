//
//  DestinationLeftSelectView.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/4/30.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DestinationLeftSelectViewDelegate <NSObject>

- (void)clickDestinationSeletBtnAction:(UIButton *)sender;

@end

@interface DestinationLeftSelectView : UIView

@property (nonatomic, assign)id<DestinationLeftSelectViewDelegate> delegate;

+ (instancetype)initWithLeftSelectViewWithFrame:(CGRect)frame WithDataSource:(NSArray *)dataSoucre;

@end
