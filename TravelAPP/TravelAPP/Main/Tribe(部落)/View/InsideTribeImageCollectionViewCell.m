//
//  InsideTribeImageCollectionViewCell.m
//  TravelAPP
//
//  Created by qing on 2017/5/2.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "InsideTribeImageCollectionViewCell.h"
#import <Masonry.h>

@interface InsideTribeImageCollectionViewCell()

@property (nonatomic,strong)UIImageView *imageView;

@end

@implementation InsideTribeImageCollectionViewCell

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
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self);
    }];
    
}


- (void)setImgName:(NSString *)imgName {
    _imgName = imgName;
    _imageView.image = [UIImage imageNamed:_imgName];
}


- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor lightGrayColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
//        _imageView.contentMode = UIViewContentModeScaleAspectFit;
//        _imageView.clipsToBounds = YES;
//        _imageView.image = [UIImage imageNamed:@"hero"];
    }
    return _imageView;
}


@end


