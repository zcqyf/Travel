//
//  TLCalendarTableViewCell.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/5.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSCalendar.h"

@protocol TLCalendarTableViewCellDelegate <NSObject>



@end

@interface TLCalendarTableViewCell : UITableViewCell

+ (instancetype)initCustomCellWithTableView: (UITableView *)tableView;

@end
