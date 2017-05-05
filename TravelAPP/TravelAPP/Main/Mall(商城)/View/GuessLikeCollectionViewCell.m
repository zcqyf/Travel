//
//  GuessLikeCollectionViewCell.m
//  TravelAPP
//
//  Created by qing on 2017/4/29.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "GuessLikeCollectionViewCell.h"
#import <Masonry.h>

@interface GuessLikeCollectionViewCell()

@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UIImageView *starImageView;
@property (nonatomic,strong)UILabel *markLabel;
@property (nonatomic,strong)UILabel *rankLabel;
@property (nonatomic,strong)UIButton *likeButton;
@property (nonatomic,strong)UILabel *countLabel;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *distanceLabel;

@property (nonatomic,strong)UIView *bottomLine;

@end

@implementation GuessLikeCollectionViewCell

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
    [self addSubview:self.imageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.starImageView];
    [self addSubview:self.markLabel];
    [self addSubview:self.rankLabel];
    [self addSubview:self.likeButton];
    [self addSubview:self.countLabel];
    [self addSubview:self.nameLabel];
    [self addSubview:self.distanceLabel];
    [self addSubview:self.bottomLine];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(10);
        make.width.height.mas_equalTo(100);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageView.mas_top);
        make.left.equalTo(_imageView.mas_right).offset(10);
        make.right.equalTo(_likeButton.mas_left).offset(0);
        make.height.mas_equalTo(21);
    }];
    [_likeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imageView.mas_top);
        make.right.equalTo(self).offset(-10);
        make.width.height.mas_equalTo(26);
    }];
    [_starImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(0);
        make.left.equalTo(_titleLabel.mas_left);
        make.width.height.mas_equalTo(26);
    }];
    [_markLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_starImageView);
        make.left.equalTo(_starImageView.mas_right).offset(10);
        make.width.mas_equalTo(35);
    }];
    [_rankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_markLabel.mas_right).offset(0);
        make.right.equalTo(self).offset(10);
        make.centerY.equalTo(_starImageView);
    }];
    [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_starImageView.mas_bottom).offset(10);
        make.left.equalTo(_titleLabel.mas_left);
        make.right.equalTo(self).offset(10);
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_imageView.mas_bottom);
        make.left.equalTo(_titleLabel.mas_left);
        make.right.equalTo(_distanceLabel.mas_left).offset(-10);
    }];
    [_distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_imageView.mas_bottom);
        make.right.equalTo(self).offset(-10);
        make.width.mas_equalTo(80);
    }];
    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self);
        make.height.mas_equalTo(0.5);
    }];
}

- (void)setData:(NSDictionary *)data {
    
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = YES;
        _imageView.image = [UIImage imageNamed:@"car"];
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"香港迪士尼乐园";
        _titleLabel.font = [UIFont boldSystemFontOfSize:15];
    }
    return _titleLabel;
}

- (UIImageView *)starImageView {
    if (!_starImageView) {
        _starImageView = [[UIImageView alloc] init];
        _starImageView.image = [UIImage imageNamed:@"start1"];
    }
    return _starImageView;
}

- (UILabel *)markLabel {
    if (!_markLabel) {
        _markLabel = [[UILabel alloc] init];
        _markLabel.text = @"9.8";
        _markLabel.textColor = [UIColor lightGrayColor];
        _markLabel.font = [UIFont systemFontOfSize:12];
    }
    return _markLabel;
}

- (UILabel *)rankLabel {
    if (!_rankLabel) {
        _rankLabel = [[UILabel alloc] init];
        _rankLabel.text = @"景点观光第1名";
        _rankLabel.textColor = [UIColor lightGrayColor];
        _rankLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return _rankLabel;
}

- (UIButton *)likeButton {
    if (!_likeButton) {
        _likeButton = [[UIButton alloc] init];
        [_likeButton setImage:[UIImage imageNamed:@"star"] forState:UIControlStateNormal];
    }
    return _likeButton;
}

- (UILabel *)countLabel {
    if (!_countLabel) {
        _countLabel = [[UILabel alloc] init];
        _countLabel.text = @"11114455人去过";
        _countLabel.textColor = [UIColor lightGrayColor];
        _countLabel.font = [UIFont systemFontOfSize:12];
    }
    return _countLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"主题公园/游乐场";
        _nameLabel.textColor = [UIColor lightGrayColor];
        _nameLabel.font = [UIFont systemFontOfSize:12];
    }
    return _nameLabel;
}

- (UILabel *)distanceLabel {
    if (!_distanceLabel) {
        _distanceLabel = [[UILabel alloc] init];
        _distanceLabel.text = @"32km";
        _distanceLabel.textAlignment = NSTextAlignmentRight;
        _distanceLabel.textColor = [UIColor lightGrayColor];
        _distanceLabel.font = [UIFont systemFontOfSize:12];
    }
    return _distanceLabel;
}

- (UIView *)bottomLine {
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc] init];
        _bottomLine.backgroundColor = [UIColor lightGrayColor];
    }
    return _bottomLine;
}



@end
