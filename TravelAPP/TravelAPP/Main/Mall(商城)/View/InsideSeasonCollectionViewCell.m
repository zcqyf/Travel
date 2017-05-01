//
//  InsideSeasonCollectionViewCell.m
//  TravelAPP
//
//  Created by qing on 2017/4/29.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "InsideSeasonCollectionViewCell.h"
#import <Masonry.h>

@interface InsideSeasonCollectionViewCell()

@property (nonatomic,strong)UIImageView *topImageView;
@property (nonatomic,strong)UILabel *priceLabel;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UIImageView *guidIcon;
@property (nonatomic,strong)UILabel *guidLabel;
@property (nonatomic,strong)UIImageView *locationIcon;
@property (nonatomic,strong)UILabel *locationLabel;
@property (nonatomic,strong)UIImageView *starImageView;
@property (nonatomic,strong)UILabel *commentLalbel;



@end

@implementation InsideSeasonCollectionViewCell

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
    [self addSubview:self.topImageView];
    [self addSubview:self.priceLabel];
    [self addSubview:self.titleLabel];
    [self addSubview:self.guidIcon];
    [self addSubview:self.guidLabel];
    [self addSubview:self.locationIcon];
    [self addSubview:self.locationLabel];
    [self addSubview:self.starImageView];
    [self addSubview:self.commentLalbel];
    
    [_topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.left.equalTo(self).offset(15);
        make.right.equalTo(self).offset(-15);
        make.height.mas_equalTo(150);
    }];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_topImageView).offset(8);
        make.bottom.equalTo(_topImageView).offset(-8);
        make.right.equalTo(_topImageView).offset(-8);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topImageView.mas_bottom).offset(5);
        make.left.equalTo(_topImageView.mas_left);
        make.right.equalTo(_topImageView.mas_right);
        make.height.mas_equalTo(21);
    }];
    [_guidIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(0);
        make.left.equalTo(_topImageView);
        make.width.height.mas_equalTo(26);
    }];
    [_guidLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_guidIcon);
        make.left.equalTo(_guidIcon.mas_right).offset(5);
        make.right.equalTo(_locationIcon.mas_left).offset(0);
    }];
    
    [_locationIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_guidIcon.mas_top);
        make.right.equalTo(_locationLabel.mas_left).offset(-5);
        make.width.height.mas_equalTo(26);
    }];
    [_locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_locationIcon);
        make.right.equalTo(_topImageView);
        make.width.mas_equalTo(80); 
    }];
    [_starImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_guidIcon.mas_bottom).offset(0);
        make.left.equalTo(_guidIcon.mas_left);
        make.width.height.mas_equalTo(26);
    }];
    [_commentLalbel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_starImageView);
        make.right.equalTo(_topImageView.mas_right);
        make.left.equalTo(_starImageView.mas_right);
    }];
}

- (void)setData:(NSDictionary *)data {
    
}

- (UIImageView *)topImageView {
    if (!_topImageView) {
        _topImageView = [[UIImageView alloc] init];
        _topImageView.contentMode = UIViewContentModeScaleAspectFill;
        _topImageView.clipsToBounds = YES;
        _topImageView.image = [UIImage imageNamed:@"timg"];
    }
    return _topImageView;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.text = @"¥ 759 天/车";
        _priceLabel.textColor = [UIColor whiteColor];
        _priceLabel.font = [UIFont boldSystemFontOfSize:15];
    }
    return _priceLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"寻找镜头下的风景";
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titleLabel;
}

- (UIImageView *)guidIcon {
    if (!_guidIcon) {
        _guidIcon = [[UIImageView alloc] init];
        _guidIcon.image = [UIImage imageNamed:@"start1"];
    }
    return _guidIcon;
}

- (UILabel *)guidLabel {
    if (!_guidLabel) {
        _guidLabel = [[UILabel alloc] init];
        _guidLabel.text = @"向导服务";
        _guidLabel.textColor = [UIColor blackColor];
        _guidLabel.font = [UIFont systemFontOfSize:12];
    }
    return _guidLabel;
}

- (UIImageView *)locationIcon {
    if (!_locationIcon) {
        _locationIcon = [[UIImageView alloc] init];
        _locationIcon.image = [UIImage imageNamed:@"start1"];
    }
    return _locationIcon;
}

- (UILabel *)locationLabel {
    if (!_locationLabel) {
        _locationLabel = [[UILabel alloc] init];
        _locationLabel.text = @"曼谷";
        _locationLabel.textColor = [UIColor blackColor];
        _locationLabel.font = [UIFont systemFontOfSize:12];
    }
    return _locationLabel;
}

- (UIImageView *)starImageView {
    if (!_starImageView) {
        _starImageView = [[UIImageView alloc] init];
        _starImageView.image = [UIImage imageNamed:@"start1"];
    }
    return _starImageView;
}

- (UILabel *)commentLalbel {
    if (!_commentLalbel) {
        _commentLalbel = [[UILabel alloc] init];
        _commentLalbel.text = @"11条评价";
        _commentLalbel.textColor = [UIColor blackColor];
        _commentLalbel.textAlignment = NSTextAlignmentRight;
        _commentLalbel.font = [UIFont systemFontOfSize:12];
    }
    return _commentLalbel;
}


@end



















































