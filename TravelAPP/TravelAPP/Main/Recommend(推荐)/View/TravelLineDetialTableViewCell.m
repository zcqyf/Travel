//
//  TravelLineDetialTableViewCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/2.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TravelLineDetialTableViewCell.h"

@implementation TravelLineDetialTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)initCustomCellWithTabelView:(UITableView *)tableView {
    static NSString *identifier = @"TravelLineDetialTableViewCell";
    
    TravelLineDetialTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TravelLineDetialTableViewCell" owner:nil options:nil] objectAtIndex:0];
        
    }
    return cell;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
