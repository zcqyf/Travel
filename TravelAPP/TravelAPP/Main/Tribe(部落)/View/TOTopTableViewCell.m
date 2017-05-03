//
//  TOTopTableViewCell.m
//  TravelAPP
//
//  Created by qing on 2017/5/2.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TOTopTableViewCell.h"
#import <Masonry.h>

@implementation TOTopTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    NSArray *titleArray = @[@"出发时间", @"目的地"];
    for (int i = 0; i < 2; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.tag = i;
        button.layer.cornerRadius = 3.0;
        button.layer.masksToBounds = YES;
        button.backgroundColor = [UIColor whiteColor];
        button.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        button.layer.borderWidth = 0.5;
        [self addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(2);
            make.bottom.equalTo(self).offset(-2);
            make.left.equalTo(self).offset(i * (SCREEN_W/2) + 2);// TODO - 为什么不能获取cell.width？
            make.width.mas_equalTo((SCREEN_W-6)/2);
        }];
    }
    
}

- (void)buttonClick: (UIButton *)sender {
    
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
