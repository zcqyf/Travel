//
//  BookingOrderHeaderTableViewCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/5.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "BookingOrderHeaderTableViewCell.h"

@implementation BookingOrderHeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)initCustomCellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"CELL";
    BookingOrderHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BookingOrderHeaderTableViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    return  cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
