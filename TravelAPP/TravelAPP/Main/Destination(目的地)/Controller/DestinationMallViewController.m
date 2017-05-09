//
//  DestinationMallViewController.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/8.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "DestinationMallViewController.h"
#import "DMallSelectTypeCell.h"
#import "MMTopSrollViewCollectionViewCell.h"
#import "DMallSearchCell.h"
#import "DMallSearchReusableView.h"


#define TopSrollView @"TopSrollViewCollectionViewCell"
#define DMallSelectTypeCellIdentifier @"DMallSelectTypeCellIdentifier"
#define DMallSearchCellIdentifier @"DMallSearchCellIdentifier"
#define DMallSearchReusableViewIdentifier @"DMallSearchReusableViewIdentifier"


@interface DestinationMallViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, DMallSearchReusableViewDelegate>

@property (nonatomic, strong)UICollectionView *collectionView;

@property (nonatomic, strong)NSArray *selectTitleArray;

@end

@implementation DestinationMallViewController

- (NSArray *)selectTitleArray {
    if (!_selectTitleArray) {
        _selectTitleArray = @[@"全部目的地", @"智能排序", @"更多筛选"];
    }
    return _selectTitleArray;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H - 64 - 30)collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"MMTopSrollViewCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:TopSrollView];
        [_collectionView registerNib:[UINib nibWithNibName:@"DMallSelectTypeCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:DMallSelectTypeCellIdentifier];
        [_collectionView registerNib:[UINib nibWithNibName:@"DMallSearchCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:DMallSearchCellIdentifier];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"DMallSearchReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DMallSearchReusableViewIdentifier];
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
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 3;
        case 2:
            return 3;
        default:
            break;
    }
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MMTopSrollViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:TopSrollView forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.section == 1) {
        DMallSelectTypeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DMallSelectTypeCellIdentifier forIndexPath:indexPath];
        cell.myTitleLabel.text = self.selectTitleArray[indexPath.row];
        return cell;
    }
    if (indexPath.section == 2) {
        DMallSearchCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:DMallSearchCellIdentifier forIndexPath:indexPath];
        return cell;
    }
    return [UICollectionViewCell new];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            return CGSizeMake(SCREEN_W, 200);
        case 1:
            return CGSizeMake(SCREEN_W/3, 49);
        case 2:
            return CGSizeMake(SCREEN_W, 120);
        default:
            break;
    }
    return CGSizeMake(0, 0);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2 && kind == UICollectionElementKindSectionHeader) {
        DMallSearchReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:DMallSearchReusableViewIdentifier forIndexPath:indexPath];
        view.deleagte = self;
        [view.myTextField addTarget:self action:@selector(textFieldValueChange:) forControlEvents:UIControlEventEditingChanged];
        return view;
    }
    return [UICollectionReusableView new];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 2) {
        return UIEdgeInsetsMake(5, 0, 5, 0);
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        return CGSizeMake(SCREEN_W, 49);
    }
    return CGSizeMake(0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

#pragma mark --- DMallSearchReusableViewDelegate

- (void)searchAction:(UIButton *)sender {
    NSLog(@"搜索");
}

- (void)textFieldValueChange: (UITextField *)textField {
    NSLog(@"%@",textField.text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
