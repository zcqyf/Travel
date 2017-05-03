//
//  TRTopTableViewCell.m
//  TravelAPP
//
//  Created by qing on 2017/5/2.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TRTopTableViewCell.h"
#import "InsideTRTopCollectionViewCell.h"
#import "InsideChannelCollectionViewCell.h"
#import <Masonry.h>

@interface TRTopTableViewCell()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView *collectionView;

@end

@implementation TRTopTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self);
    }];
}

- (void)setData:(NSDictionary *)data {
    _data = data;
    [self.collectionView reloadData];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
//        layout.sectionInset = UIEdgeInsetsMake(10, 10, -10, -10);
//        layout.itemSize = CGSizeMake(160, 80);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[InsideChannelCollectionViewCell class] forCellWithReuseIdentifier:@"InsideChannelCollectionViewCell"];
        [_collectionView registerClass:[InsideTRTopCollectionViewCell class] forCellWithReuseIdentifier:@"InsideTRTopCollectionViewCell"];
    }
    return _collectionView;
}

#pragma collectionView dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([self.data[@"type"] isEqualToString:@"channel"]) {
        NSArray *array = self.data[@"dataSource"];
        return array.count;
    } else {
        return 4;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.data[@"type"] isEqualToString:@"channel"]) {//如果是频道，则注册频道cell
        InsideChannelCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"InsideChannelCollectionViewCell" forIndexPath:indexPath];
        NSArray *array = self.data[@"dataSource"];
        cell.data = array[indexPath.row];
        return cell;
    } else {
        InsideTRTopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"InsideTRTopCollectionViewCell" forIndexPath:indexPath];
        
        return cell;
    }
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
   if ([self.data[@"type"] isEqualToString:@"channel"]) {
       return CGSizeMake(self.RL_Width/5, self.RL_Height);
   } else {
       return CGSizeMake(160, self.RL_Height - 20);
   }
}

//最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if ([self.data[@"type"] isEqualToString:@"channel"]) {
        return 0;
    } else {
        return 10;
    }
}

//最小列间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//    if ([self.data[@"type"] isEqualToString:@"channel"]) {
//        return 0;
//    } else {
//        return 10;
//    }
//}

//上下左右边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if ([self.data[@"type"] isEqualToString:@"channel"]) {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    } else {
        return UIEdgeInsetsMake(10, 10, 10, 10);
    }
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


