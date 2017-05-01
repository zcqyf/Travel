//
//  SelecterContentsScrollView.h
//  UI_SelectTool
//
//  Created by Gene_Ye on 2016/11/1.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelecterToolsScrollView.h"

typedef void(^ScrollPage)(int num);

@interface SelecterContentsScrollView : UIScrollView<UIScrollViewDelegate>

@property (nonatomic,strong)NSArray *vcArray;

@property (nonatomic,copy)ScrollPage scrollPage;

- (instancetype)initWithFrame:(CGRect)frame
     SelecterConditionVCArray:(NSArray *)vcArray
                     AndStyle:(TypeStyle)typeStyle
                  andBtnBlock:(ScrollPage)scrollPage;

- (void)updateVCViewFromIndex:(NSInteger)index;


@end
