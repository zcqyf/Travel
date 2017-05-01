//
//  HeaderCollectionReusableView.m
//  TravelAPP
//
//  Created by qing on 2017/4/29.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "HeaderCollectionReusableView.h"
#import <Masonry.h>

@interface HeaderCollectionReusableView()

@property (nonatomic,strong)UILabel *label;

@end

@implementation HeaderCollectionReusableView

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
    [self addSubview:self.label];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self);
    }];
}

- (void)setTitle:(NSString *)title {
    _label.text = title;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.text = @"精选折扣";
        _label.textColor = [UIColor darkGrayColor];
        _label.font = [UIFont systemFontOfSize:13];
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}



@end
