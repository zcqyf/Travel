//
//  SelecterToolsScrollView.m
//  UI_SelectTool
//
//  Created by Gene_Ye on 2016/11/1.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "SelecterToolsScrollView.h"



#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface SelecterToolsScrollView ()

@property (nonatomic,strong)NSMutableArray *titleArray;
@end

@implementation SelecterToolsScrollView



- (CGFloat)titleBtnWidth{
    if (!_titleBtnWidth) {
        _titleBtnWidth = 95;
    }
    return _titleBtnWidth;
}



- (instancetype)initWithFrame:(CGRect)frame SelecterConditionTitleArray:(NSArray *)titleArray andTypeStyle:(TypeStyle)typeStyle andBtnBlock:(BtnClick)btnClick{
    
    if (self = [super init]) {
      
        self.backgroundColor = [UIColor whiteColor];
        self.frame = frame;
        self.typeStyle = typeStyle;
        CGFloat fontSize = 15.0;
        
        if (typeStyle == homeStyle) {
            self.titleBtnWidth = frame.size.width/3;
        }
        else{
            self.titleBtnWidth = frame.size.width/5;
        }
        
        _btnArray = [NSMutableArray array];
        
        for (int i = 0 ; i < titleArray.count; i++) {
            
            UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            if (typeStyle == yiJianZiXun) {
                titleBtn.frame = CGRectMake(SCREEN_WIDTH/2 - 20, 0, self.titleBtnWidth, 40);
            }
            else{
                titleBtn.frame = CGRectMake(self.titleBtnWidth * i, 0, self.titleBtnWidth, 40);
            }
            
            [titleBtn setTitle:titleArray[i] forState:UIControlStateNormal];
            
            [titleBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
            
            titleBtn.tag = 300 + i;
            
            [titleBtn addTarget:self action:@selector(titleBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:titleBtn];
            
            [_btnArray addObject:titleBtn];
            
            if (typeStyle == homeStyle) {
                if (i == 0) {
                    _previousBtn = _btnArray[0];
                    _currentBtn = titleBtn;
                    titleBtn.selected = YES;
                }
            }
            else{
                if (i == 0) {
                    _previousBtn = titleBtn;
                    _currentBtn = titleBtn;
                    titleBtn.selected = YES;
                }
            }
            
        }
        
        NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
        
        CGSize size = [titleArray[0] boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
        
        CGFloat bottomScrollLineWidth = size.width + 4;
        
        _bottomScrollLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 3, bottomScrollLineWidth, 2)];
        
        _bottomScrollLine.backgroundColor = [UIColor redColor];
        
        _bottomScrollLine.center = CGPointMake(_currentBtn.center.x, _bottomScrollLine.center.y);
        
        [self addSubview:_bottomScrollLine];
        
        self.contentSize = CGSizeMake(self.titleBtnWidth * titleArray.count, 0);
        
        self.showsHorizontalScrollIndicator = NO;
        
        self.btnClick = btnClick;
        
        _titleArray = [NSMutableArray arrayWithArray:titleArray];
    }
    
    return self;
}

- (void)titleBtnAction:(UIButton *)sender{
    self.btnClick(sender);
}

- (void)updateSeletedToolsIndex:(NSInteger)index{
    
    UIButton *button = self.btnArray[index];
    
    [self changeSelectBtn:button];

}

- (void)changeSelectBtn:(UIButton *)button{
    
    _previousBtn = _currentBtn;
    _currentBtn = button;
    _previousBtn.selected = NO;
    _currentBtn.selected = YES;
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15.0]};
    
    CGSize size = [_titleArray[button.tag - 300] boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    [UIView animateWithDuration:0.3 animations:^{
        
        _bottomScrollLine.RL_Width = size.width + 4;
        
        _bottomScrollLine.center = CGPointMake(_currentBtn.center.x, _bottomScrollLine.center.y);
    }];
    
    if (_typeStyle == homeStyle) {
        return;
    }
    
        //toolBtn居中
        if (_currentBtn.center.x < SCREEN_WIDTH/2) {
            [self setContentOffset:CGPointZero animated:YES];
        }
        else if (_currentBtn.center.x > self.contentSize.width - SCREEN_WIDTH/2){
            [self setContentOffset:CGPointMake(self.contentSize.width - SCREEN_WIDTH, 0)];
        }
        else{
            [self setContentOffset:CGPointMake(_currentBtn.center.x - SCREEN_WIDTH/2, 0)];
        }
 
    
}

@end
