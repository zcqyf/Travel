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
    
}

+ (instancetype)initCustomCellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"CELL";
    TLCalendarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TLCalendarTableViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    return cell;
}

//- (void)GYCalendarViewDidSelectDate:(UICollectionView *)collectionView IndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"11111");
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
