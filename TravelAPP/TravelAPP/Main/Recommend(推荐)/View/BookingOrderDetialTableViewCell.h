//
//  BookingOrderDetialTableViewCell.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/5.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookingOrderDetialTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *myTextField;

@property (weak, nonatomic) IBOutlet UIButton *chooseBtn;
@property (weak, nonatomic) IBOutlet UILabel *mytitleLabel;

+ (instancetype)initCustomCellWithTableView: (UITableView *)tableView;

@end
