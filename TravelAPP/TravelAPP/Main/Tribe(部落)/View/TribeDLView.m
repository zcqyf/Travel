//
//  TribeDLView.m
//  TravelAPP
//
//  Created by qing on 2017/5/2.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TribeDLView.h"
#import <Masonry.h>

@interface TribeDLView()

@property (nonatomic,strong)UIImageView *dateIcon;
@property (nonatomic,strong)UILabel *dateLabel;
@property (nonatomic,strong)UIImageView *locationIcon;
@property (nonatomic,strong)UILabel *locationLabel;

@end

@implementation TribeDLView

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
    [self addSubview:self.dateIcon];
    [self addSubview:self.dateLabel];
    [self addSubview:self.locationIcon];
    [self addSubview:self.locationLabel];
    
    [_dateIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
//        make.width.height.mas_equalTo(20);
    }];
    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_dateIcon.mas_right).offset(10);
        make.centerY.equalTo(_dateIcon);
        make.right.equalTo(_locationIcon.mas_left).offset(-10);
    }];
    [_locationIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_locationLabel.mas_left).offset(-10);
        make.centerY.equalTo(self);
//        make.width.height.mas_equalTo(20);
    }];
    [_locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.centerY.equalTo(_dateIcon);
        make.width.mas_equalTo(80);
    }];
    
}


- (void)setData:(NSDictionary *)data {
    
}

- (UIImageView *)dateIcon {
    if (!_dateIcon) {
        _dateIcon = [[UIImageView alloc] init];
//        _dateIcon.image = [UIImage imageNamed:@"star"];
    }
    return _dateIcon;
}

- (UILabel *)dateLabel {
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] init];
//        _dateLabel.text = @"2017-01-01";
        _dateLabel.textColor = [UIColor greenColor];
        _dateLabel.font = [UIFont systemFontOfSize:12];
    }
    return _dateLabel;
}

- (UIImageView *)locationIcon {
    if (!_locationIcon) {
        _locationIcon = [[UIImageView alloc] init];
//        _locationIcon.image = [UIImage imageNamed:@"star"];
    }
    return _locationIcon;
}

- (UILabel *)locationLabel {
    if (!_locationLabel) {
        _locationLabel = [[UILabel alloc] init];
//        _locationLabel.text = @"香港";
        _locationLabel.textColor = [UIColor greenColor];
        _locationLabel.font = [UIFont systemFontOfSize:12];
    }
    return _locationLabel;
}






@end
