//
//  TLCalendarTableViewCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/5.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TLCalendarTableViewCell.h"


@implementation TLCalendarTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 30) collectionViewLayout:flowLayout];
    [self addSubview:collectionView];
    collectionView.backgroundColor = [UIColor redColor];
    GYCalendarView *view = [[GYCalendarView alloc] initWithFrame:CGRectMake(0, 30, SCREEN_W-50, self.frame.size.height)];
    view.delegate = self;
    view.tag = 1000;
    [self addSubview:view];
}

+ (instancetype)initCustomCellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"CELL";
    TLCalendarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TLCalendarTableViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    return cell;
}

- (void)GYCalendarViewDidSelectDate:(UICollectionView *)collectionView IndexPath:(NSIndexPath *)indexPath {
    NSLog(@"11111");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
