//
//  BookingOrderDetialTableViewCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/5.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "BookingOrderDetialTableViewCell.h"

@implementation BookingOrderDetialTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.chooseBtn.layer.cornerRadius = 5.0;
    self.chooseBtn.layer.masksToBounds = YES;
    self.chooseBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.chooseBtn.layer.borderWidth = 0.5;
}

+ (instancetype)initCustomCellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"Cell";
    
    BookingOrderDetialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BookingOrderDetialTableViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
