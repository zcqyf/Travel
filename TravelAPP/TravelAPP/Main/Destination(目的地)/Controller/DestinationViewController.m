//
//  DestinationViewController.m
//  TravelAPP
//
//  Created by qing on 2017/4/27.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "DestinationViewController.h"
#import "DestinationLeftSelectView.h"
#import "DestinationSelectBtn.h"
#import "DestinationCollectionViewCell.h"

@interface DestinationViewController ()<DestinationLeftSelectViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong)DestinationLeftSelectView *selectView;

@property (nonatomic, strong)UICollectionView *collectionView;

@property (nonatomic, assign)NSInteger currentBtnTag;
@property (nonatomic, assign)NSInteger areaCount;


@end

@implementation DestinationViewController

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];

        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(100, 64, SCREEN_W- 100, SCREEN_H-64-49) collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

- (DestinationLeftSelectView *)selectView {
    if (!_selectView) {
        NSArray *array = @[@"热门目的地", @"人气海岛", @"港澳台" ,@"日韩朝", @"东南亚", @"亚洲其他", @"欧洲", @"德玛西亚", @"北美洲", @"南美洲", @"欧洲", @"非洲", @"澳洲"];
        _areaCount = array.count;
        _selectView = [DestinationLeftSelectView initWithLeftSelectViewWithFrame:CGRectMake(0, 64, 100, SCREEN_H-64 - 49) WithDataSource:array];
        _selectView.delegate = self;
    }
    return _selectView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _currentBtnTag = 100;

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"DestinationCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"CELL"];
    
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.selectView];
}

#pragma mark --- UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DestinationCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    
    return cell;
}

#pragma mark ---UICollectionViewFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((SCREEN_W- 100-30)/2, (SCREEN_W- 100-30)/2);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 0, 10);
}

#pragma mark --- DestinationLeftSelectViewDelegate

-(void)clickDestinationSeletBtnAction:(UIButton *)sender {

    UIScrollView *scrollView = [self.selectView viewWithTag:1000];
    
    for (int i = 0; i < _areaCount; i++) {
        
        DestinationSelectBtn *btn = [scrollView viewWithTag:100 + i];
        UILabel *label = [btn viewWithTag:1000];
        label.textColor = [UIColor blackColor];
        
        if (sender.tag != _currentBtnTag) {
            UILabel *label = [sender viewWithTag:1000];
            label.textColor = [UIColor cyanColor];
        }else{
            UILabel *label = [sender viewWithTag:1000];
            label.textColor = [UIColor cyanColor];
        }
    }
    _currentBtnTag = sender.tag;

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
