//
//  BookingRemarkTableViewCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/5.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "BookingRemarkTableViewCell.h"

@implementation BookingRemarkTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.myTextView.layer.cornerRadius = 5.0;
    self.myTextView.layer.masksToBounds = YES;
    self.myTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.myTextView.layer.borderWidth = 0.5;
}

+ (instancetype)initCustomCellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"CElL";
    
    BookingRemarkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BookingRemarkTableViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
