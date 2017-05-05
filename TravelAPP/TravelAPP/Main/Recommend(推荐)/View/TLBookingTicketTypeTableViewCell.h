//
//  TLBookingTicketTypeTableViewCell.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/5.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLBookingTicketTypeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *mytitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *reduceBtn;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

+ (instancetype)initCustomCellWithtableView:(UITableView *)tableView;

@end
