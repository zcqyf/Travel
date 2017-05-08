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
#import "DJinNangCollectionReusableView.h"

#define DestinationHeaderCellIdentifier @"DestinationHeaderCellIdentifier"
#define DestinationJinNangCellIdentifier @"DestinationJinNangCellIdentifier"
#define DJinNangCollectionReusableViewIdentifier @"DJinNangCollectionReusableViewIdentifier"

@interface DestinationDetialViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, assign)NSInteger currentTag;

@property (nonatomic, strong)UIView *selectView;

@property (nonatomic, strong)UICollectionView *collectionView;

@property (nonatomic, strong)NSArray *JinNangDataSource;

@end

@implementation DestinationDetialViewController

- (NSArray *)JinNangDataSource {
    if (!_JinNangDataSource) {
        _JinNangDataSource = @[@"城市概况", @"热门景点", @"当地美食", @"交通指南", @"特惠酒店", @"游记攻略", @"推荐路线", @"结伴出行"];
    }
    return _JinNangDataSource;
}

- (UIView *)selectView {
    if (!_selectView) {
        _selectView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_W, 40)];
        self.currentTag = 100;
        NSArray *titleArray = @[@"攻略",@"商城",@"我的收藏"];
        
        for (int i = 0; i < titleArray.count; i++) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:titleArray[i] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchDown];
            button.tag = 100 + i;
            button.frame = CGRectMake(i * SCREEN_W/3, 0, SCREEN_W/3, 40);
            
            if (button.tag == _currentTag) {
                [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            }else{
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            }
            
            [_selectView addSubview:button];
        }
    }
    return _selectView;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64+40, SCREEN_W, SCREEN_H - 104) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        _collectionView.backgroundColor = [UIColor clearColor];
        
        [_collectionView registerClass:[DestinationHeaderCell class] forCellWithReuseIdentifier:DestinationHeaderCellIdentifier];
        [_collectionView registerNib:[UINib nibWithNibName:@"DestinationJinNangCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:DestinationJinNangCellIdentifier];
        
        
        /*
         
         */
        [_collectionView registerNib:[UINib nibWithNibName:@"DJinNangCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DJinNangCollectionReusableViewIdentifier];
        
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.selectView];
    [self.view addSubview:self.collectionView];
    
}

#pragma mark ---UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 1) {
        return self.JinNangDataSource.count;
    }
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        DestinationHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DestinationHeaderCellIdentifier forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.section == 1) {
        DestinationJinNangCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DestinationJinNangCellIdentifier forIndexPath:indexPath];
        cell.myTitleLabel.text = self.JinNangDataSource[indexPath.row];
        return cell;
    }
    
    return [UICollectionViewCell new];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
 
    if (indexPath.section == 1 && kind == UICollectionElementKindSectionHeader) {
        DJinNangCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DJinNangCollectionReusableViewIdentifier forIndexPath:indexPath];
        view.myTitleLabel.text = @"香港锦囊";
        return view;
    }
    return [UICollectionReusableView new];
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(0, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return CGSizeMake(SCREEN_W, 49);
    }
    return CGSizeMake(0, 0);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    if (section == 1) {
        return UIEdgeInsetsMake(20, 10, 20, 10);
    }
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
       return CGSizeMake(SCREEN_W, 200);
    }
    
    if (indexPath.section == 1) {
        return CGSizeMake((SCREEN_W-80)/4, (SCREEN_W-80)/4);
    }
    
    return CGSizeMake(0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}



- (void)selectAction:(UIButton *)sender{
    for (int i = 0; i < self.selectView.subviews.count; i++) {
        
        UIButton *btn = (UIButton *)self.selectView.subviews[i];
        if (sender.tag == btn.tag) {
            
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
