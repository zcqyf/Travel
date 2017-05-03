//
//  TribeTitleSelectView.m
//  TravelAPP
//
//  Created by qing on 2017/5/2.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TribeTitleSelectView.h"
#import <Masonry.h>

@interface TribeTitleSelectView()

@property (nonatomic,strong)UIView *lineView;

@property (nonatomic,strong)UIView *bottomLine;

@end

@implementation TribeTitleSelectView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    _buttons = [NSMutableArray new];
    NSArray *titleArray = @[@"推荐", @"户外出行"];
    for (int i = 0; i < titleArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_buttons addObject:button];
    }
    [_buttons[0] setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [_buttons[0] setEnabled:NO];
    [self addSubview:_buttons[0]];
    [self addSubview:_buttons[1]];
    [self addSubview:self.lineView];
    [self addSubview:self.bottomLine];
    
    [_buttons[0] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.equalTo(self);
        make.width.mas_equalTo((self.frame.size.width-1)/2);
    }];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(_buttons[0].mas_right);
        make.width.mas_equalTo(0.5);
    }];
    [_buttons[1] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(self);
        make.width.mas_equalTo((self.frame.size.width-1)/2);
    }];
    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self);
        make.height.mas_equalTo(0.5);
    }];
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
//        _lineView.backgroundColor = [[UIColor alloc] initWithRed:0.96 green:0.96 blue:0.96 alpha:1.0];
        _lineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineView;
}

- (UIView *)bottomLine {
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = [UIColor lightGrayColor];
    }
    return _bottomLine;
}

- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    
    
}

- (void)buttonClick: (UIButton *)sender {
    [sender setEnabled:NO];
    switch (sender.tag) {
        case 0: {
            [_buttons[1] setEnabled:YES];
            [_buttons[1] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [_buttons[0] setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
            break;
        case 1: {
            [_buttons[0] setEnabled:YES];
            [_buttons[0] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [_buttons[1] setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
            break;
        default:
            break;
    }
    
    if ([self.delegate respondsToSelector:@selector(clickedAt:)]) {
        [_delegate clickedAt:sender.tag];
    }
}


@end
