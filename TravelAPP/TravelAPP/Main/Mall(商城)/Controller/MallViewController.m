//
//  MallViewController.m
//  TravelAPP
//
//  Created by qing on 2017/4/27.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "MallViewController.h"
#import "ImageSliderCollectionViewCell.h"
#import "ChannelCollectionViewCell.h"
#import "DiscountCollectionViewCell.h"
#import "SeasonHotCollectionViewCell.h"
#import "GuessLikeCollectionViewCell.h"
#import "HeaderCollectionReusableView.h"
#import "BlankCollectionReusableView.h"
#import "InsideActivityCollectionViewCell.h"
#import "ActivityPurchaseViewController.h"


@interface MallViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView *collectionView;

@property (nonatomic,strong)NSArray *titles;//header数据源
@property (nonatomic,strong)NSArray *channels;//频道数据源(section == 0)
@property (nonatomic,strong)NSArray *activities;//活动数据源(section == 1)
@property (nonatomic,strong)NSArray<NSDictionary *> *discounts;//精品折扣数据源(section == 2)
@property (nonatomic,strong)NSArray<NSDictionary *> *currentHots;//当季热门数据源(section == 3)
@property (nonatomic,strong)NSArray<NSDictionary *> *guessLikes;//猜你喜欢数据源(section == 4)

@end

@implementation MallViewController

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
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
//        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        [_collectionView registerClass:[InsideActivityCollectionViewCell class] forCellWithReuseIdentifier:@"InsideActivityCollectionViewCell"];
        [_collectionView registerClass:[ImageSliderCollectionViewCell class] forCellWithReuseIdentifier:@"ImageSliderCollectionViewCell"];
        [_collectionView registerClass:[ChannelCollectionViewCell class] forCellWithReuseIdentifier:@"ChannelCollectionViewCell"];
        [_collectionView registerClass:[DiscountCollectionViewCell class] forCellWithReuseIdentifier:@"DiscountCollectionViewCell"];
        [_collectionView registerClass:[SeasonHotCollectionViewCell class] forCellWithReuseIdentifier:@"SeasonHotCollectionViewCell"];
        [_collectionView registerClass:[GuessLikeCollectionViewCell class] forCellWithReuseIdentifier:@"GuessLikeCollectionViewCell"];
        [_collectionView registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderCollectionReusableView"];
        [_collectionView registerClass:[BlankCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"BlankCollectionReusableView"];
    }
    return _collectionView;
}

- (NSArray *)titles {
    if (!_titles) {
        _titles = [[NSArray alloc] initWithObjects:@"精品折扣", @"当季热门", @"猜你喜欢", nil];
    }
    return _titles;
}

- (NSArray *)channels {
    if (!_channels) {
        _channels = @[@{@"text": @"机加酒", @"image": @"star"}, @{@"text": @"出境游", @"image": @"star"}, @{@"text": @"国内游", @"image": @"star"}, @{@"text": @"酒店", @"image": @"star"}, @{@"text": @"旅行周边", @"image": @"star"}, @{@"text": @"签证", @"image": @"star"}, @{@"text": @"自由行", @"image": @"star"}, @{@"text": @"旅游保险", @"image": @"star"}, @{@"text": @"接送包车", @"image": @"star"}, @{@"text": @"游轮", @"image": @"star"}];
    }
    return _channels;
}

- (NSArray *)activities {
    if (!_activities) {
        _activities = [[NSArray alloc] initWithObjects:@"天天特惠", @"上新精品", @"尾货甩单", @"拼团特卖", nil];
    }
    return _activities;
}

- (NSArray<NSDictionary *> *)discounts {
    if (!_discounts) {
        _discounts = [[NSArray alloc] initWithObjects:@{@"image": @"car", @"title": @"五星马尔代夫", @"content": @"如果你无法简介表达你的想法，那只能说明你还不够了解它"}, @{@"image": @"car", @"title": @"五星马尔代夫", @"content": @"如果你无法简介表达你的想法，那只能说明你还不够了解它"}, nil];
    }
    return _discounts;
}

- (NSArray<NSDictionary *> *)currentHots {
    if (!_currentHots) {
        _currentHots = [[NSArray alloc] initWithObjects:@{@"image": @"herol", @"dataSource":@[@"寻找镜头下的风景", @"寻找镜头下的风景", @"寻找镜头下的风景"]}, @{@"image": @"herol", @"dataSource":@[@"寻找镜头下的风景", @"寻找镜头下的风景", @"寻找镜头下的风景"]}, @{@"image": @"herol", @"dataSource":@[@"寻找镜头下的风景", @"寻找镜头下的风景", @"寻找镜头下的风景"]}, nil];
    }
    return _currentHots;
}

- (NSArray<NSDictionary *> *)guessLikes {
    if (!_guessLikes) {
        _guessLikes = [[NSArray alloc] initWithObjects:@{@"image": @"star", @"title": @"五星马尔代夫", @"content": @"如果你无法简介表达你的想法，那只能说明你还不够了解它"}, @{@"image": @"star", @"title": @"五星马尔代夫", @"content": @"如果你无法简介表达你的想法，那只能说明你还不够了解它"}, @{@"image": @"star", @"title": @"五星马尔代夫", @"content": @"如果你无法简介表达你的想法，那只能说明你还不够了解它"}, nil];
    }
    return _guessLikes;
}

#pragma collectionView dataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    } else if (section == 1) {
        return self.activities.count;
    } else if (section == 2) {
        return 2;
    } else if (section == 3) {
        return 3;
    } else {
        return 3;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            ImageSliderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageSliderCollectionViewCell" forIndexPath:indexPath];
            //待补充数据
            return cell;
        } else {
            ChannelCollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"ChannelCollectionViewCell" forIndexPath:indexPath];
            cell.data = self.channels;
            return cell;
        }
    } else if (indexPath.section == 1) {
        
        InsideActivityCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"InsideActivityCollectionViewCell" forIndexPath:indexPath];
        cell.layer.cornerRadius = 5.0;
        cell.layer.masksToBounds = YES;
        cell.layer.borderColor = [UIColor darkGrayColor].CGColor;
        cell.layer.borderWidth = 0.5;
        cell.data = self.activities[indexPath.row];
        
        return cell;
    } else if (indexPath.section == 2 ) {
        DiscountCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DiscountCollectionViewCell" forIndexPath:indexPath];
        cell.data = self.discounts[indexPath.row];
        return cell;
    } else if (indexPath.section == 3) {
        SeasonHotCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SeasonHotCollectionViewCell" forIndexPath:indexPath];
        cell.data = self.currentHots[indexPath.row];
        return cell;
    } else {
        GuessLikeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GuessLikeCollectionViewCell" forIndexPath:indexPath];
        cell.data = self.guessLikes[indexPath.row];
        return cell;
    }
}

#pragma collectionView delegate

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        HeaderCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderCollectionReusableView" forIndexPath:indexPath];
        if (indexPath.section > 1) {
            header.title = self.titles[indexPath.section - 2];
        }
        return header;
    } else {
        BlankCollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"BlankCollectionReusableView" forIndexPath:indexPath];
        
        return footer;
    }
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        ActivityPurchaseViewController *vc = [ActivityPurchaseViewController new];
        vc.title = self.activities[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}


#pragma collectionView layout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0 || section ==1) {
        return CGSizeMake(0, 0);
    } else {
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, 44);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (section == 4) {
        return CGSizeZero;
    } else {
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, 8);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return CGSizeMake([UIScreen mainScreen].bounds.size.width, 200);
        } else {    
         return CGSizeMake([UIScreen mainScreen].bounds.size.width, 140);
        }
    } else if (indexPath.section == 1) {
//        return CGSizeMake([UIScreen mainScreen].bounds.size.width, 160);
        
        return CGSizeMake((SCREEN_W-24)/2, (160-24)/2);
        
    } else if (indexPath.section == 2) {
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, 150);
    } else if (indexPath.section == 3) {
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, 370);
    } else {
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, 130);
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 1) {
        return 8;
    } else {
        return 0;
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 1) {
        return 8;
    } else {
        return 0;
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 1) {
        return UIEdgeInsetsMake(8, 8, 8, 8);
    } else {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
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

