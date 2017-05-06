//
//  GLGrogShopCollectionViewCell.m
//  TravelAPP
//
//  Created by qing on 2017/5/6.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "GLGrogShopCollectionViewCell.h"
#import "GLDGrogshopCollectionViewCell.h"

@interface GLGrogShopCollectionViewCell()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation GLGrogShopCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"GLDGrogshopCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"GLDGrogshopCollectionViewCell"];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
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
     GLDGrogshopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GLDGrogshopCollectionViewCell" forIndexPath:indexPath];
    
    return cell;
}

#pragma collectionView delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
