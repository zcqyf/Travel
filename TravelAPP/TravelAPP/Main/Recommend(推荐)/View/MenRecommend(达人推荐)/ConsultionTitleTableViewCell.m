//
//  ConsultionTitleTableViewCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/7.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "ConsultionTitleTableViewCell.h"

@implementation ConsultionTitleTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.jianBtn.layer.cornerRadius = 2.0;
    self.jianBtn.layer.masksToBounds = YES;
    self.addBtn.layer.cornerRadius = 2.0;
    self.addBtn.layer.masksToBounds = YES;
    self.countLabel.layer.cornerRadius = 4.0;
    self.countLabel.layer.masksToBounds = YES;
    self.countLabel.layer.borderWidth = 0.5;
    self.countLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
}

+(instancetype)initCustomCellWithTableView:(UITableView *)tableView Type:(NSInteger)type {
    static NSString *identifier = @"CELL";
    ConsultionTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ConsultionTitleTableViewCell" owner:nil options:nil] objectAtIndex:0];
        if (type == 1) {
            cell.jianBtn.hidden = YES;
            cell.addBtn.hidden = YES;
            cell.countLabel.hidden = YES;
        }
    }
    return  cell;
}


- (IBAction)subtractionAndAddAction:(UIButton *)sender {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
