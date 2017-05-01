//
//  SeasonHotCollectionViewCell.m
//  TravelAPP
//
//  Created by qing on 2017/4/29.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "SeasonHotCollectionViewCell.h"
#import <Masonry.h>
#import "InsideSeasonCollectionViewCell.h"

@interface SeasonHotCollectionViewCell()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UIImageView *topImageView;
@property (nonatomic,strong)UICollectionView *collectionView;

@end

@implementation SeasonHotCollectionViewCell

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
    [self addSubview:self.collectionView];
    [_topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(120);
    }];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topImageView.mas_bottom);
        make.left.bottom.right.equalTo(self);
    }];
}

- (void)setData:(NSDictionary *)data {
    _data = data;
    [self.collectionView reloadData];
}

- (UIImageView *)topImageView {
    if (!_topImageView) {
        _topImageView = [[UIImageView alloc] init];
        _topImageView.contentMode = UIViewContentModeScaleAspectFill;
        _topImageView.clipsToBounds = YES;
        _topImageView.image = [UIImage imageNamed:@"hero"];
    }
    return _topImageView;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[InsideSeasonCollectionViewCell class] forCellWithReuseIdentifier:@"InsideSeasonCollectionViewCell"];
    }
    return _collectionView;
}

#pragma collectionView dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *array = self.data[@"dataSource"];
    return array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    InsideSeasonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"InsideSeasonCollectionViewCell" forIndexPath:indexPath];
    //数据待补充
    return cell;
}

#pragma collectionView delegate

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    
//}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma collectionView layout
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
//    
//}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
//    
//}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.collectionView.frame.size.height, self.collectionView.frame.size.height);
}


@end





































