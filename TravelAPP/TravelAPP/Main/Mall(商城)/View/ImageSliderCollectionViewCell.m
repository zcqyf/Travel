//
//  ImageSliderCollectionViewCell.m
//  TravelAPP
//
//  Created by qing on 2017/4/29.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "ImageSliderCollectionViewCell.h"
#import "RLScrollPic.h"

@interface ImageSliderCollectionViewCell()

@property (nonatomic,strong)RLScrollPic *scrollPic;

@property (nonatomic,strong)NSArray *images;

@end

@implementation ImageSliderCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self setupUI];
    }
   return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.scrollPic];
}


- (RLScrollPic *)scrollPic {
    if (!_scrollPic) {
        _scrollPic = [[RLScrollPic alloc] initWithFrame:self.bounds WithImageName:@[@"car", @"hero", @"timg"]];
    }
    return _scrollPic;
}

- (void)setImages:(NSArray *)images {
    
    
    
}

@end
