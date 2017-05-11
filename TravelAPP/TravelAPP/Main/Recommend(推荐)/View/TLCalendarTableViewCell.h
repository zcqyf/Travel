//
//  TLCalendarTableViewCell.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/5.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GYCalendarView.h"

@protocol TLCalendarTableViewCellDelegate <NSObject>



@end

@interface TLCalendarTableViewCell : UITableViewCell <GYCalendarViewDelegate>

+ (instancetype)initCustomCellWithTableView: (UITableView *)tableView;

@end
