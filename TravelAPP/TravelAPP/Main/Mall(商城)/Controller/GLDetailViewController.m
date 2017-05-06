//
//  GLDetailViewController.m
//  TravelAPP
//
//  Created by qing on 2017/5/5.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "GLDetailViewController.h"
#import "GLDTopCollectionViewCell.h"
#import "GLDPurchaseCollectionViewCell.h"
#import "GLDCheckCollectionViewCell.h"
#import "GLDDescritionCollectionViewCell.h"
#import "GLDInfoCollectionViewCell.h"
#import "GLDCommentCollectionViewCell.h"
#import "GLDHeaderView.h"
#import "GLMapCollectionViewCell.h"
#import "GLRecommendCollectionViewCell.h"
#import "GLGrogShopCollectionViewCell.h"


@interface GLDetailViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView *collectionView;


@end

@implementation GLDetailViewController

- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = true;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    [self.view addSubview:self.collectionView];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"GLDTopCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"GLDTopCollectionViewCell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"GLDPurchaseCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"GLDPurchaseCollectionViewCell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"GLDCheckCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"GLDCheckCollectionViewCell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"GLDDescritionCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"GLDDescritionCollectionViewCell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"GLMapCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"GLMapCollectionViewCell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"GLDInfoCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"GLDInfoCollectionViewCell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"GLDCommentCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"GLDCommentCollectionViewCell"];
        
       [_collectionView registerNib:[UINib nibWithNibName:@"GLGrogShopCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"GLGrogShopCollectionViewCell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"GLRecommendCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"GLRecommendCollectionViewCell"];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"GLDHeaderView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"GLDHeaderView"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
        
        
    }
    return _collectionView;
}

#pragma collectionView dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 8;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    } else if (section == 1 || section == 2 || section == 4) {
        return 2;
    } else if (section == 5) {
        return 4;
    } else {
        return 1;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        GLDTopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GLDTopCollectionViewCell" forIndexPath:indexPath];
        
        return cell;
    } else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            GLDPurchaseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GLDPurchaseCollectionViewCell" forIndexPath:indexPath];
            
            return cell;
        } else {
            GLDCheckCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GLDCheckCollectionViewCell" forIndexPath:indexPath];
            
            return cell;
        }
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            GLDDescritionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GLDDescritionCollectionViewCell" forIndexPath:indexPath];
            
            return cell;
        } else {
            GLDCheckCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GLDCheckCollectionViewCell" forIndexPath:indexPath];
            
            return cell;
        }
    } else if (indexPath.section == 3) {
        GLMapCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GLMapCollectionViewCell" forIndexPath:indexPath];
        
        return cell;
    } else if (indexPath.section == 4) {
        if (indexPath.row == 0) {
            GLDInfoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GLDInfoCollectionViewCell" forIndexPath:indexPath];
            
            return cell;
        } else {
            GLDCheckCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GLDCheckCollectionViewCell" forIndexPath:indexPath];
            
            return cell;
        }
    } else if (indexPath.section == 5) {
        GLDCommentCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GLDCommentCollectionViewCell" forIndexPath:indexPath];
        
        return cell;
    } else if (indexPath.section == 6) {
        GLGrogShopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GLGrogShopCollectionViewCell" forIndexPath:indexPath];
        cell.navigationController = self.navigationController;
        return cell;
    } else {
        GLRecommendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GLRecommendCollectionViewCell" forIndexPath:indexPath];
        
        return cell;
    }
}

#pragma collectionView delegate

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        GLDHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"GLDHeaderView" forIndexPath:indexPath];
        
        return header;
    } else {
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer" forIndexPath:indexPath];
        footer.backgroundColor = [UIColor lightGrayColor];
        
        return footer;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", indexPath);
    
    
}

#pragma collectionView layout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section < 4) {
        return CGSizeMake(0, 0);
    } else {
        return CGSizeMake(SCREEN_W, 40);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(SCREEN_W, 8);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(SCREEN_W, 262);
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return CGSizeMake(SCREEN_W, 120);
        } else {
            return CGSizeMake(SCREEN_W, 50);
        }
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            return CGSizeMake(SCREEN_W, 90);
        } else {
            return CGSizeMake(SCREEN_W, 50);
        }
    } else if (indexPath.section == 3) {
        return CGSizeMake(SCREEN_W, 80);
    } else if (indexPath.section == 4) {
        if (indexPath.row == 0) {
            return CGSizeMake(SCREEN_W, 242);
        } else {
            return CGSizeMake(SCREEN_W, 50);
        }
    } else if (indexPath.section == 5) {
        return CGSizeMake(SCREEN_W, 188);
    } else if (indexPath.section == 6) {
        return CGSizeMake(SCREEN_W, 219);
    } else {
        return CGSizeMake(SCREEN_W, 169+6);
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
