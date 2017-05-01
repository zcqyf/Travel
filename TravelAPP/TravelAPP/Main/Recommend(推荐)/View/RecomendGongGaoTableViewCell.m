//
//  RecomendGongGaoTableViewCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/4/30.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "RecomendGongGaoTableViewCell.h"

@implementation RecomendGongGaoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)initCustomCellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"cell";
    
    RecomendGongGaoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"RecomendGongGaoTableViewCell" owner:nil options:nil] objectAtIndex:0];
        cell.styleLabel.layer.cornerRadius = 5.0;
        cell.styleLabel.layer.masksToBounds = YES;
    }
    return cell;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
