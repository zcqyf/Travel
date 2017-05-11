//
//  MemberMallViewController.m
//  TravelAPP
//
//  Created by qing on 2017/4/27.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "MemberMallViewController.h"
#import "MMGuangGaoCollectionViewCell.h"
#import "MMHeaderCollectionReusableView.h"
#import "MMRecommendCollectionViewCell.h"
#import "MMTopSrollViewCollectionViewCell.h"
#import "GLDetailViewController.h"
#import "BookingViewController.h"


#define MMGangGaoCell @"MMGangGaoCell"
#define TopSrollView @"TopSrollViewCollectionViewCell"

@interface MemberMallViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)UICollectionView *collectionView;

@property (nonatomic, strong)UISearchBar *searchBar;

@end

@implementation MemberMallViewController

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, SCREEN_W, 49)];
        _searchBar.barStyle = UIBarStyleDefault;
        
    }
    return _searchBar;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64+49, SCREEN_W, SCREEN_H-64-49 - 49) collectionViewLayout:flowLayout];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"MMGuangGaoCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:MMGangGaoCell];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"MMRecommendCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"RecommendCell"];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"MMTopSrollViewCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:TopSrollView];
        
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        //注册标题
        [_collectionView registerNib:[UINib nibWithNibName:@"MMHeaderCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
        
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.collectionView];
}

#pragma mark ---UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return  5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 4;
            break;
        case 2:
            return 1;
        case 3:
            return 6;
        case 4:
            return 3;
        default:
            break;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MMTopSrollViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:TopSrollView forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.section == 1) {
        MMGuangGaoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MMGangGaoCell forIndexPath:indexPath];
        //        cell.myTitleLabel.hidden = YES;
        return cell;

    }
    if(indexPath.section == 2){
        MMGuangGaoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MMGangGaoCell forIndexPath:indexPath];
//        cell.myTitleLabel.hidden = YES;
        return cell;
        
    }
    if (indexPath.section == 3){
        MMRecommendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RecommendCell" forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.section == 4){
        
        MMGuangGaoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MMGangGaoCell forIndexPath:indexPath];
        cell.myTitleLabel.hidden = NO;
        return cell;
    }
    
    return [[UICollectionViewCell alloc] init];

}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            return CGSizeMake(SCREEN_W, 200);
        case 1:
            return CGSizeMake((SCREEN_W-3)/2, (SCREEN_W-4)/2-50);
          
        case 2:
            return CGSizeMake(SCREEN_W, 100);
            
        case 3:
            return CGSizeMake((SCREEN_W - 15)/2, (SCREEN_W - 15)/2+70);
            
        case 4:
            return CGSizeMake(SCREEN_W, 200);
            
        default:
            break;
    }
    return CGSizeMake(0, 0);
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 1) {
        return UIEdgeInsetsMake(1, 1, 1, 1);
    }
    if (section == 3) {
        
        return UIEdgeInsetsMake(5, 5, 5, 5);
    }
    if (section == 4) {
        return UIEdgeInsetsMake(5, 0, 0, 0);
    }
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 1) {
        return 1;
    }
    if (section == 3) {
        return 5;
    }
    if (section == 4) {
        return 5;
    }
    return  0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    if (section == 1) {
        return 1;
    }
    if (section == 3) {
        return 5;
    }

    if (section == 4) {
        return 5;
    }
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        return CGSizeMake(SCREEN_W, 40);
    }
    
    else{
        return CGSizeMake(0, 0);
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 2) {
        MMHeaderCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        view.backgroundColor = [UIColor whiteColor];
        return view;
    }
    
    return [[UICollectionReusableView alloc] init];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 3) {
        BookingViewController *vc = [[BookingViewController alloc] init];
        [self.navigationController pushViewController:vc animated:true];
    }
    if (indexPath.section == 4) {
        GLDetailViewController *vc = [[GLDetailViewController alloc] init];
        [self.navigationController pushViewController:vc animated:true];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
