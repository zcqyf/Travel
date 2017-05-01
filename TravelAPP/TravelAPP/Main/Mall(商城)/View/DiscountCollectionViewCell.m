//
//  DiscountCollectionViewCell.m
//  TravelAPP
//
//  Created by qing on 2017/4/29.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "DiscountCollectionViewCell.h"
#import <Masonry.h>

@interface DiscountCollectionViewCell()

@property (nonatomic,strong)UIImageView *imgView;
@property (nonatomic,strong)UILabel *title;
@property (nonatomic,strong)UILabel *content;

@end

@implementation DiscountCollectionViewCell

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
    [self addSubview:self.imgView];
    [self addSubview:self.title];
    [self addSubview:self.content];
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(10);
        make.width.height.mas_equalTo(80);
    }];
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imgView.mas_top);
        make.left.equalTo(_imgView.mas_right).offset(10);
        make.right.equalTo(self).offset(-10);
        make.height.mas_equalTo(21);
    }];
    
    // 自适应高度 -TODO
    [_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_title.mas_bottom).offset(10);
        make.left.equalTo(_title.mas_left);
        make.right.equalTo(_title.mas_right);
    }];
    
}

- (void)setData:(NSDictionary *)data {
    _data = data;
    _imgView.image = [UIImage imageNamed:data[@"image"]];
    _title.text = data[@"title"];
    _content.text = data[@"content"];
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        _imgView.contentMode = UIViewContentModeScaleAspectFill;
        _imgView.clipsToBounds = YES;
        _imgView.image = [UIImage imageNamed:@"car"];
    }
    return _imgView;
}

- (UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.text = @"省五万元，五星马尔代夫";
        _title.textColor = [UIColor blackColor];
        _title.font = [UIFont boldSystemFontOfSize:15];
    }
    return _title;
}

- (UILabel *)content {
    if (!_content) {
        _content = [[UILabel alloc] init];
        _content.text = @"如果你五福简介的表达你的想法，那只能说明你还不够了解它";
        _content.textColor = [UIColor lightGrayColor];
        _content.font = [UIFont systemFontOfSize:12];
        _content.numberOfLines = 0;
    }
    return _content;
}


@end








