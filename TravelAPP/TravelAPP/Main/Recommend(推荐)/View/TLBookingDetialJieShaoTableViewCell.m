//
//  TLBookingDetialJieShaoTableViewCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/3.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TLBookingDetialJieShaoTableViewCell.h"

@implementation TLBookingDetialJieShaoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.detialLabel.layer.cornerRadius = 5.0;
    self.detialLabel.layer.masksToBounds = YES;
    self.detialLabel.layer.borderColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1].CGColor;
    self.detialLabel.layer.borderWidth = 0.5;
}

+ (instancetype)initCustomCellWithTableView: (UITableView *)tableView {
    static NSString *identifier = @"Cell";
    
    TLBookingDetialJieShaoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TLBookingDetialJieShaoTableViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
