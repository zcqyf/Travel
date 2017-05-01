//
//  InsideActivityCollectionViewCell.m
//  TravelAPP
//
//  Created by qing on 2017/4/29.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "InsideActivityCollectionViewCell.h"
#import <Masonry.h>

@interface InsideActivityCollectionViewCell()

@property (nonatomic,strong)UIButton *button;

@end

@implementation InsideActivityCollectionViewCell

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
    [self addSubview:self.button];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).offset(5);
        make.bottom.right.equalTo(self).offset(-5);
    }];
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.titleLabel.font = [UIFont systemFontOfSize:14];
        _button.layer.borderWidth = 0.5;
        _button.layer.borderColor = [[UIColor grayColor] CGColor];
        _button.layer.cornerRadius = 5.0;
        _button.layer.masksToBounds = YES;
        [_button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    return _button;
}

- (void)setData:(NSString *)data {
    [_button setTitle:data forState:UIControlStateNormal];
}


@end
