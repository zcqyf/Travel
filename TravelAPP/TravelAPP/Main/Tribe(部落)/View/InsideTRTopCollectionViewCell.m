//
//  InsideTRTopCollectionViewCell.m
//  TravelAPP
//
//  Created by qing on 2017/5/2.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "InsideTRTopCollectionViewCell.h"
#import <Masonry.h>

@interface InsideTRTopCollectionViewCell()

@property (nonatomic,strong)UILabel *title;

@property (nonatomic,strong)UIImageView *imageView;


@end

@implementation InsideTRTopCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.imageView];
    [self addSubview:self.title];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self);
    }];
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_imageView);
        make.width.mas_equalTo(self.frame.size.width - 50);
        make.height.mas_equalTo(30);
    }];
    
}

- (void)setData:(NSDictionary *)data {
    _data = data;
    _title.text = _data[@"title"];
    _imageView.image = [UIImage imageNamed:_data[@"image"]];
}

- (UILabel *)title {
    if (!_title) {
        _title = [[UILabel alloc] init];
        _title.text = @"小长假";
        _title.backgroundColor = [UIColor whiteColor];
        _title.layer.cornerRadius = 3.0;
        _title.layer.masksToBounds = YES;
        _title.font = [UIFont systemFontOfSize:14];
        _title.textAlignment = NSTextAlignmentCenter;
    }
    return _title;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor lightGrayColor];
        _imageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _imageView;
}

@end
