//
//  MenRecommendHeaderTableViewCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/6.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "MenRecommendHeaderTableViewCell.h"

@implementation MenRecommendHeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.headerImageView.layer.cornerRadius = 35;
    self.headerImageView.layer.masksToBounds = YES;
}

+ (instancetype)initCustomCellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"CELL";
    MenRecommendHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MenRecommendHeaderTableViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    return cell;
}

- (void)setupAddImageButton {
    

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
