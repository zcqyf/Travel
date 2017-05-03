//
//  MineTopTableViewCell.m
//  TravelAPP
//
//  Created by qing on 2017/5/3.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "MineTopTableViewCell.h"
#import <Masonry.h>

@interface MineTopTableViewCell()

@property (nonatomic,strong)UIImageView *headImageView;
@property (nonatomic,strong)UILabel *memberId;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *countLabel;
@property (nonatomic,strong)UILabel *remainLabel;
@property (nonatomic,strong)UILabel *creditLabel;
@property (nonatomic,strong)UIButton *messageButton;
@property (nonatomic,strong)UIButton *settingButton;
@property (nonatomic,strong)UIButton *signinButton;

@end

@implementation MineTopTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:self.headImageView];
    [self addSubview:self.memberId];
    [self addSubview:self.nameLabel];
    [self addSubview:self.countLabel];
    [self addSubview:self.remainLabel];
    [self addSubview:self.creditLabel];
    [self addSubview:self.messageButton];
    [self addSubview:self.settingButton];
    [self addSubview:self.signinButton];
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(15);
        make.width.height.mas_equalTo(70);
    }];
    [_memberId mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(20);
        make.left.equalTo(_headImageView.mas_right).offset(10);
        make.right.equalTo(_messageButton.mas_left).offset(-10);
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_memberId.mas_bottom).offset(10);
        make.left.right.equalTo(_memberId);
    }];
    [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameLabel.mas_bottom).offset(10);
        make.left.right.equalTo(_memberId);
    }];
    [_remainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_countLabel.mas_bottom).offset(10);
        make.left.equalTo(_memberId);
        make.right.equalTo(_creditLabel.mas_left).offset(-10);
    }];
    [_messageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.width.height.mas_equalTo(26);
        make.right.equalTo(_settingButton.mas_left).offset(-5);
    }];
    [_settingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.width.height.mas_equalTo(20);
        make.right.equalTo(self).offset(-10);
    }];
    [_signinButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.width.height.mas_equalTo(40);
        make.right.equalTo(self).offset(-25);
    }];
    [_creditLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_remainLabel);
        make.right.equalTo(self).offset(-10);
    }];
    
}

- (UIImageView *)headImageView {
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] init];
        _headImageView.image = [UIImage imageNamed:@"car"];
        _headImageView.contentMode = UIViewContentModeScaleAspectFill;
        _headImageView.layer.cornerRadius = 35;
        _headImageView.layer.masksToBounds = YES;
    }
    return _headImageView;
}

- (UILabel *)memberId {
    if (!_memberId) {
        _memberId = [[UILabel alloc] init];
        _memberId.text = @"会员ID  233";
        _memberId.font = [UIFont systemFontOfSize:14];
    }
    return _memberId;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"里斯  VIP3";
        _nameLabel.font = [UIFont systemFontOfSize:14];
    }
    return _nameLabel;
}

- (UILabel *)countLabel {
    if (!_countLabel) {
        _countLabel = [[UILabel alloc] init];
        _countLabel.text = @"0粉丝  0关注";
        _countLabel.font = [UIFont systemFontOfSize:14];
    }
    return _countLabel;
}

- (UILabel *)remainLabel {
    if (!_remainLabel) {
        _remainLabel = [[UILabel alloc] init];
        _remainLabel.text = @"余额：234534.0";
        _remainLabel.font = [UIFont systemFontOfSize:14];
    }
    return _remainLabel;
}

- (UILabel *)creditLabel {
    if (!_creditLabel) {
        _creditLabel = [[UILabel alloc] init];
        _creditLabel.text = @"积分：3256";
        _creditLabel.font = [UIFont systemFontOfSize:14];
    }
    return _creditLabel;
}

- (UIButton *)messageButton {
    if (!_messageButton) {
        _messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_messageButton setImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
    }
    return _messageButton;
}

- (UIButton *)settingButton {
    if (!_settingButton) {
        _settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_settingButton setImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
    }
    return _settingButton;
}

- (UIButton *)signinButton {
    if (!_signinButton) {
        _signinButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_signinButton setImage:[UIImage imageNamed:@"signin"] forState:UIControlStateNormal];
    }
    return _signinButton;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
