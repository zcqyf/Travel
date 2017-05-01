//
//  InsideChannelCollectionViewCell.m
//  TravelAPP
//
//  Created by qing on 2017/4/29.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "InsideChannelCollectionViewCell.h"
#import <Masonry.h>

@interface InsideChannelCollectionViewCell()

@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)UILabel *label;



@end

@implementation InsideChannelCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setData:(NSDictionary *)data {
    _data = data;
    _label.text = _data[@"text"];
}

- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.imageView];
    [self addSubview:self.label];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(10);
    }];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(_imageView.mas_bottom).offset(3);
    }];
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [UIImage imageNamed:@"start1"];
    }
    return _imageView;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.text = @"自由行";
        _label.textColor = [UIColor darkGrayColor];
        _label.font = [UIFont systemFontOfSize:12];
    }
    return _label;
}



@end






































