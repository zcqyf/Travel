//
//  BookingRemarkTableViewCell.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/5.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookingRemarkTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextView *myTextView;

+ (instancetype)initCustomCellWithTableView: (UITableView *)tableView;

@end
