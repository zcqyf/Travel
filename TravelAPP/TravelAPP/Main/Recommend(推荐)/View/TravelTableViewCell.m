//
//  TravelTableViewCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/4/30.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TravelTableViewCell.h"

@implementation TravelTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)initCustomCellViewTableView:(UITableView *)tableView {
    static NSString *identifier = @"cell";
    
    TravelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TravelTableViewCell" owner:nil options:nil] objectAtIndex:0];
        cell.headImageView.layer.cornerRadius = 30;
        cell.headImageView.layer.masksToBounds = YES;
        cell.styleLabel.layer.cornerRadius = 5;
        cell.styleLabel.layer.masksToBounds = YES;
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
