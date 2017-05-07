//
//  MenRecommendDetialTableViewCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/6.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "MenRecommendDetialTableViewCell.h"

@implementation MenRecommendDetialTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.statLabel.layer.cornerRadius = 4.0;
    self.statLabel.layer.masksToBounds = YES;
    self.statLabel.backgroundColor = [UIColor orangeColor];
}

+ (instancetype)initCustomCellWithtableView:(UITableView *)tableView {
    static NSString *identifier = @"CELL";
    
    MenRecommendDetialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MenRecommendDetialTableViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    return cell;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
