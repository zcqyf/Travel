//
//  SelecterToolsScrollView.h
//  UI_SelectTool
//
//  Created by Gene_Ye on 2016/11/1.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BtnClick)(UIButton *btn);

//typedef enum {
//    
//    homeStyle,
//    notHomeStyle,
//    
//}TypeStyle;

typedef NS_ENUM(NSInteger,TypeStyle) {
        homeStyle,
        notHomeStyle,
        yiJianZiXun,
};

@interface SelecterToolsScrollView : UIScrollView


@property (nonatomic,strong)NSMutableArray *btnArray;
//记录前一个btn
@property (nonatomic,strong)UIButton *previousBtn;

@property (nonatomic,strong)UIButton *currentBtn;

@property (nonatomic,strong)UIView *bottomScrollLine;

@property (nonatomic,assign)CGFloat titleBtnWidth;

@property (nonatomic,copy)BtnClick btnClick;

@property (nonatomic,assign)TypeStyle typeStyle; //判断是否为主页的样式;

- (instancetype)initWithFrame:(CGRect)frame
  SelecterConditionTitleArray:(NSArray *)titleArray
                 andTypeStyle:(TypeStyle)typeStyle
                  andBtnBlock:(BtnClick)btnClick;

- (void)updateSeletedToolsIndex:(NSInteger)index;

@end
