//
//  ConsultionHeaderTableViewCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/6.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "ConsultionHeaderTableViewCell.h"

@implementation ConsultionHeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.myImageView.layer.cornerRadius = (90 - 20)/2.0;
    self.myImageView.layer.masksToBounds = YES;
    
}

+(instancetype)initCustomCellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"Cell";
    
    ConsultionHeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ConsultionHeaderTableViewCell" owner:nil options:nil] objectAtIndex:0];
    }
    return  cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
