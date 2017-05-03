//
//  TribeTitleSelectView.h
//  TravelAPP
//
//  Created by qing on 2017/5/2.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TribeTitleSelectViewDelegate <NSObject>

- (void)clickedAt: (NSInteger)Index;

@end

@interface TribeTitleSelectView : UIView

@property (nonatomic,copy)NSMutableArray<UIButton *> *buttons;

@property (nonatomic,strong)NSArray *titles;

@property (nonatomic,weak)id<TribeTitleSelectViewDelegate> delegate;

@end
