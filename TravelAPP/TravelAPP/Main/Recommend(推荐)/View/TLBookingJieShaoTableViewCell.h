//
//  TLBookingJieShaoTableViewCell.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/3.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLBookingJieShaoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *picCountLabel;

+ (instancetype)initCustomCellWithTableView:(UITableView *)tableView;

@end
