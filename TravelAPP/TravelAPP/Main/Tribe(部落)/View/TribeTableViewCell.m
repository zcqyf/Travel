//
//  TribeTableViewCell.m
//  TravelAPP
//
//  Created by qing on 2017/5/2.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TribeTableViewCell.h"
#import <Masonry.h>
#import "TribeDLView.h"
#import "InsideTribeImageCollectionViewCell.h"

@interface TribeTableViewCell()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UIImageView *headImgView;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *contentLabel;
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)TribeDLView *dlView;

@property (nonatomic,strong)UILabel *timeLabel;
@property (nonatomic,strong)UILabel *commentLabel;

@end


@implementation TribeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self addSubview:self.headImgView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.contentLabel];
    [self addSubview:self.collectionView];
    [self addSubview:self.dlView];
    [self addSubview:self.locationLable];
    [self addSubview:self.timeLabel];
    [self addSubview:self.commentLabel];
    
    [_headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self).offset(10);
        make.width.height.mas_equalTo(50);
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headImgView.mas_right).offset(10);
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(_headImgView);
    }];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameLabel.mas_bottom).offset(10);
        make.left.right.equalTo(_nameLabel);
    }];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_contentLabel.mas_bottom).offset(5);
        make.left.right.equalTo(_nameLabel);
        make.height.mas_equalTo(100);
    }];
    [_dlView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_nameLabel);
        make.top.equalTo(_collectionView.mas_bottom).offset(20);
    }];
    [_locationLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_dlView.mas_bottom).offset(15);
        make.left.equalTo(_nameLabel);
        make.right.equalTo(_timeLabel.mas_left).offset(-10);
    }];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_locationLable);
        make.right.equalTo(_commentLabel.mas_left).offset(-10);
        make.width.mas_equalTo(80);
    }];
    [_commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_locationLable);
        make.right.equalTo(_nameLabel);
        make.width.mas_equalTo(80);
        // TO DO自适应内容高度
    }];
    
}

- (void)setData:(NSDictionary *)data {
    _data = data;
    [self.collectionView reloadData];
    // 赋值其他值 -TODO
    
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [[UIImageView alloc] init];
        _headImgView.image = [UIImage imageNamed:@"hero"];
        _headImgView.contentMode = UIViewContentModeScaleAspectFill;
        _headImgView.layer.cornerRadius = 25;
        _headImgView.layer.masksToBounds = YES;
    }
    return _headImgView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"里思";
        _nameLabel.font = [UIFont systemFontOfSize:16];
    }
    return _nameLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.text = @"如果你无法表达你的想法，那直说明你还不够了解他";
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        layout.minimumLineSpacing = 10;
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[InsideTribeImageCollectionViewCell class] forCellWithReuseIdentifier:@"InsideTribeImageCollectionViewCell"];
    }
    return _collectionView;
}

- (TribeDLView *)dlView {
    if (!_dlView) {
        _dlView = [[TribeDLView alloc] init];
        
    }
    return _dlView;
}

- (UILabel *)locationLable {
    if (!_locationLable) {
        _locationLable = [[UILabel alloc] init];
        _locationLable.textColor = [UIColor greenColor];
//        _locationLable.text = @"希腊/塞浦路斯";
        _locationLable.font = [UIFont systemFontOfSize:12];
    }
    return _locationLable;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.text = @"16小时前";
        _timeLabel.textColor = [UIColor lightGrayColor];
        _timeLabel.font = [UIFont systemFontOfSize:12];
    }
    return _timeLabel;
}

- (UILabel *)commentLabel {
    if (!_commentLabel) {
        _commentLabel = [[UILabel alloc] init];
        _commentLabel.text = @"评论（11）";
        _commentLabel.textColor = [UIColor lightGrayColor];
        _commentLabel.font = [UIFont systemFontOfSize:12];
    }
    return _commentLabel;
}

#pragma collectionView dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *array = self.data[@"dataSource"];
    return array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    InsideTribeImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"InsideTribeImageCollectionViewCell" forIndexPath:indexPath];
    
    return cell;
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
    return CGSizeMake(self.collectionView.RL_Width/3, self.collectionView.RL_Height);
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
