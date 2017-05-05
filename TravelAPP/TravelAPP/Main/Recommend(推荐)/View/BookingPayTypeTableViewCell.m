//
//  BookingPayTypeTableViewCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/5.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "BookingPayTypeTableViewCell.h"

@implementation BookingPayTypeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectBtn.layer.cornerRadius = 3.0;
    self.selectBtn.layer.masksToBounds = YES;
    self.selectBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.selectBtn.layer.borderWidth = 0.5;
}

+ (instancetype)initCustomCellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"CELL";
    BookingPayTypeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BookingPayTypeTableViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
