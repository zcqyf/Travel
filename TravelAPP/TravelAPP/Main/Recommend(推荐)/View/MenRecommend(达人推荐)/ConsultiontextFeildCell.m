//
//  ConsultiontextFeildCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/7.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "ConsultiontextFeildCell.h"

@implementation ConsultiontextFeildCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.myTextView.layer.cornerRadius = 5.0;
    self.myTextView.layer.masksToBounds = YES;
    self.myTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.myTextView.layer.borderWidth = 0.5;
}

+(instancetype)initCustomCellWithTableView:(UITableView *)tableView {
    static NSString *identifier = @"CELL";
    ConsultiontextFeildCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ConsultiontextFeildCell" owner:nil options:nil] objectAtIndex:0];
    }
    return  cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
