//
//  TLBookingJieShaoTableViewCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/3.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TLBookingJieShaoTableViewCell.h"

@implementation TLBookingJieShaoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.picCountLabel.layer.cornerRadius = 4.0;
    self.picCountLabel.layer.masksToBounds = YES;
}

+ (instancetype)initCustomCellWithTableView:(UITableView *)tableView {
    
    static NSString *identifier = @"CELL";
    
    TLBookingJieShaoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TLBookingJieShaoTableViewCell" owner:nil options:nil] objectAtIndex:0];
        
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
