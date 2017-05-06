//
//  GLRecommendCollectionViewCell.m
//  TravelAPP
//
//  Created by qing on 2017/5/6.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "GLRecommendCollectionViewCell.h"
#import "GLDRecommendCollectionViewCell.h"

@interface GLRecommendCollectionViewCell()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation GLRecommendCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"GLDRecommendCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"GLDRecommendCollectionViewCell"];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
}

#pragma collectionView dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GLDRecommendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GLDRecommendCollectionViewCell" forIndexPath:indexPath];
    
    return cell;
}

#pragma collectionView delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}



@end
