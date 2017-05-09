//
//  DestinationDetialViewController.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/8.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "DestinationDetialViewController.h"

#import "DestinationHeaderCell.h"
#import "DestinationJinNangCell.h"
#import "DImageViewCollectionViewCell.h"
#import "DTopToGoCollectionViewCell.h"
#import "DJingDianCollectionViewCell.h"
#import "DZhuSuCollectionViewCell.h"
#import "DWanFaTuiJianCell.h"
#import "MMGuangGaoCollectionViewCell.h"
#import "DTeSeCollectionViewCell.h"

#import "DJinNangCollectionReusableView.h"
#import "DfooterBtnCollectionReusableView.h"
#import "MMHeaderCollectionReusableView.h"

#define DestinationHeaderCellIdentifier @"DestinationHeaderCellIdentifier"
#define DestinationJinNangCellIdentifier @"DestinationJinNangCellIdentifier"
#define DImageViewCollectionViewCellIdentifier @"DImageViewCollectionViewCellIdentifier"
#define DTopToGoCollectionViewCellIdentifier @"DTopToGoCollectionViewCellIdentifier"
#define DJingDianCollectionViewCellIdentifier @"DJingDianCollectionViewCellIdentifier"
#define DZhuSuCollectionViewCellIdentifier @"DZhuSuCollectionViewCellIdentifier"
#define DWanFaTuiJianCellIdentifier @"DWanFaTuiJianCellIdentifier"
#define DTeSeCollectionViewCellIdentifier @"DTeSeCollectionViewCellIdentifier"

#define DTopGoToReusableViewIdentifier @"DTopGoToReusableViewIdentifier"
#define DJinNangCollectionReusableViewIdentifier @"DJinNangCollectionReusableViewIdentifier"
#define DfooterBtnCollectionReusableViewIdentfier @"DfooterBtnCollectionReusableViewIdentfier"
#define MMGuangGaoCollectionViewCellIdentifier @"MMGuangGaoCollectionViewCellIdentifier"

@interface DestinationDetialViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)UICollectionView *collectionView;

@property (nonatomic, strong)NSArray *JinNangDataSource;

@property (nonatomic, strong)NSArray *zhuSuTitle;

@end

@implementation DestinationDetialViewController

- (NSArray *)JinNangDataSource {
    if (!_JinNangDataSource) {
        _JinNangDataSource = @[@"城市概况", @"热门景点", @"当地美食", @"交通指南", @"特惠酒店", @"游记攻略", @"推荐路线", @"结伴出行"];
    }
    return _JinNangDataSource;
}

- (NSArray *)zhuSuTitle {
    if (!_zhuSuTitle) {
        _zhuSuTitle = @[@"景点", @"美食", @"购物"];
    }
    return _zhuSuTitle;
}


- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H-64 -35) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        _collectionView.backgroundColor = [UIColor clearColor];
        
        [_collectionView registerClass:[DestinationHeaderCell class] forCellWithReuseIdentifier:DestinationHeaderCellIdentifier];
        [_collectionView registerNib:[UINib nibWithNibName:@"DestinationJinNangCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:DestinationJinNangCellIdentifier];
        
        [_collectionView registerClass:[DImageViewCollectionViewCell class] forCellWithReuseIdentifier:DImageViewCollectionViewCellIdentifier];
        [_collectionView registerNib:[UINib nibWithNibName:@"DTopToGoCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:DTopToGoCollectionViewCellIdentifier];
        [_collectionView registerNib:[UINib nibWithNibName:@"DJingDianCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:DJingDianCollectionViewCellIdentifier];
        [_collectionView registerNib:[UINib nibWithNibName:@"DZhuSuCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:DZhuSuCollectionViewCellIdentifier];
        [_collectionView registerNib:[UINib nibWithNibName:@"DWanFaTuiJianCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:DWanFaTuiJianCellIdentifier];
        [_collectionView registerNib:[UINib nibWithNibName:@"MMGuangGaoCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:MMGuangGaoCollectionViewCellIdentifier];
        [_collectionView registerNib:[UINib nibWithNibName:@"DTeSeCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:DTeSeCollectionViewCellIdentifier];
        /*
         
         */
        [_collectionView registerNib:[UINib nibWithNibName:@"DJinNangCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DJinNangCollectionReusableViewIdentifier];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"MMHeaderCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DTopGoToReusableViewIdentifier];
        [_collectionView registerNib:[UINib nibWithNibName:@"DfooterBtnCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DfooterBtnCollectionReusableViewIdentfier];
        
    }
    return _collectionView;
}

- (void)viewWillAppear:(BOOL)animated {
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.collectionView];
    
}

#pragma mark ---UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 10;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
 
    if (section == 1) {
            return self.JinNangDataSource.count;
        }
    if (section == 3) {
        return 2;
    }
    if (section == 4) {
        return 6;
    }
    if (section == 5) {
        return 3;
    }
    if (section == 6) {
        return 4;
    }
    if (section == 9) {
        return 3;
    }

    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
            
    if (indexPath.section == 0 ) {
        DestinationHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DestinationHeaderCellIdentifier forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.section == 1 ) {
        DestinationJinNangCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DestinationJinNangCellIdentifier forIndexPath:indexPath];
        cell.myTitleLabel.text = self.JinNangDataSource[indexPath.row];
        return cell;
    }
    if (indexPath.section == 2) {
        DImageViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DImageViewCollectionViewCellIdentifier forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.section == 3) {
        DTopToGoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DTopToGoCollectionViewCellIdentifier forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.section == 4) {
        DJingDianCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DJingDianCollectionViewCellIdentifier forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.section == 5) {
        DestinationJinNangCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DestinationJinNangCellIdentifier forIndexPath:indexPath];
        cell.myTitleLabel.text = self.zhuSuTitle[indexPath.row];
        return cell;
    }
    if (indexPath.section == 6) {
        DTeSeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DTeSeCollectionViewCellIdentifier forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.section == 7) {
        DZhuSuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DZhuSuCollectionViewCellIdentifier forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.section == 8) {
        DWanFaTuiJianCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DWanFaTuiJianCellIdentifier forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.section == 9) {
        MMGuangGaoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MMGuangGaoCollectionViewCellIdentifier forIndexPath:indexPath];
        return  cell;
    }

    
    return [UICollectionViewCell new];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
        if (indexPath.section == 1 && kind == UICollectionElementKindSectionHeader) {
            DJinNangCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DJinNangCollectionReusableViewIdentifier forIndexPath:indexPath];
            view.myTitleLabel.text = @"香港锦囊";
            return view;
        }
    if (indexPath.section == 3 && kind == UICollectionElementKindSectionHeader) {
        MMHeaderCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DTopGoToReusableViewIdentifier forIndexPath:indexPath];
        view.myTitleLabel.text = @"TOP必去";
        
        return view;
    }
    if (indexPath.section == 5 && kind == UICollectionElementKindSectionHeader) {
        MMHeaderCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DTopGoToReusableViewIdentifier forIndexPath:indexPath];
        view.myTitleLabel.text = @"特色香港";
        
        return view;

    }
    
    if (indexPath.section == 4 && kind == UICollectionElementKindSectionFooter) {
        DfooterBtnCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DfooterBtnCollectionReusableViewIdentfier forIndexPath:indexPath];
        return view;
    }
    
    if (indexPath.section == 7 && kind == UICollectionElementKindSectionFooter ) {
        DfooterBtnCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:DfooterBtnCollectionReusableViewIdentfier forIndexPath:indexPath];
        [view.btn setTitle:@"查看全部" forState:UIWindowLevelNormal];
        return view;
    }
    if (indexPath.section == 9 && kind == UICollectionElementKindSectionHeader) {
        MMHeaderCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DTopGoToReusableViewIdentifier forIndexPath:indexPath];
        view.myTitleLabel.text = @"阅读更多";
        
        return view;
    }

    return [UICollectionReusableView new];
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (section == 4 || section == 7) {
        return CGSizeMake(SCREEN_W, 49);
    }
    return CGSizeMake(0, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {

    if (section == 1 || section == 3 || section == 9 || section == 5) {
        return CGSizeMake(SCREEN_W, 49);
    }
    
    return CGSizeMake(0, 0);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    

    if (section == 1) {
        return UIEdgeInsetsMake(20, 10, 20, 10);
    }
    if (section == 4) {
        return UIEdgeInsetsMake(2, 5, 10, 5);
    }
    if (section == 5) {
        return UIEdgeInsetsMake(0, (SCREEN_W-80)/4, 0, (SCREEN_W-80)/4);
    }
    if (section == 9) {
        return UIEdgeInsetsMake(5, 5, 5, 5);
    }

    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:
            return CGSizeMake(SCREEN_W, 200);
        case 1:
            return CGSizeMake((SCREEN_W-80)/4, (SCREEN_W-80)/4);
        case 2:
            return CGSizeMake(SCREEN_W, 100);
        case 3:
            return CGSizeMake(SCREEN_W /2, 150);
        case 4:
            return CGSizeMake((SCREEN_W-20)/3, 200);
        case 5:
            return CGSizeMake((SCREEN_W-80)/4, (SCREEN_W-80)/4);
        case 6:
            return CGSizeMake(SCREEN_W/2, 150);
        case 7:
            return CGSizeMake(SCREEN_W, 170);
        case 8:
            return CGSizeMake(SCREEN_W, 345);
        case 9:
            return CGSizeMake(SCREEN_W-10, 120);
        default:
            break;
    }
    
    return CGSizeMake(0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 5) {
        return (SCREEN_W-80)/16;
    }
    if (section == 9) {
        return 10;
    }
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
