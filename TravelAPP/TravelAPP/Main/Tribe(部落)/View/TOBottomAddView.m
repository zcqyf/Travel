//
//  TOBottomAddView.m
//  TravelAPP
//
//  Created by qing on 2017/5/9.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TOBottomAddView.h"
#import <Masonry.h>


@implementation TOBottomAddView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.addBtn];
//    [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self);
//        make.right.mas_equalTo(-10);
//        make.width.height.mas_equalTo(self.RL_Height - 20);
//    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.mas_equalTo(-10);
        make.width.height.mas_equalTo(self.RL_Height - 20);
    }];
    
}

- (UIButton *)addBtn {
    if (!_addBtn) {
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _addBtn.backgroundColor = [UIColor orangeColor];
    }
    return _addBtn;
}



@end
