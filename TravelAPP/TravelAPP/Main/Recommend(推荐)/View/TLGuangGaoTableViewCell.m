//
//  TLGuangGaoTableViewCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/3.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "TLGuangGaoTableViewCell.h"

@implementation TLGuangGaoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.bgView.layer.borderColor = [UIColor blackColor].CGColor;
    self.bgView.layer.borderWidth = 0.5;
}

+ (instancetype)initCustomViewWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"CELL";
    TLGuangGaoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TLGuangGaoTableViewCell" owner:nil options:nil] objectAtIndex:0];
        
    }
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
