//
//  TLBookingTicketTypeTableViewCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/5.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TLBookingTicketTypeTableViewCell.h"

@implementation TLBookingTicketTypeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.mytitleLabel.layer.cornerRadius = 4.0;
    self.mytitleLabel.layer.masksToBounds = YES;
    self.mytitleLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.mytitleLabel.layer.borderWidth = 0.5;
    self.addBtn.layer.cornerRadius = 2.0;
    self.addBtn.layer.masksToBounds = YES;
    self.reduceBtn.layer.cornerRadius = 2.0;
    self.reduceBtn.layer.masksToBounds = YES;
    self.countLabel.layer.cornerRadius = 4.0;
    self.countLabel.layer.masksToBounds = YES;
    self.countLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.countLabel.layer.borderWidth = 0.5;
}

+(instancetype)initCustomCellWithtableView:(UITableView *)tableView {
    static NSString *identifier = @"CELL";
    
    TLBookingTicketTypeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TLBookingTicketTypeTableViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
