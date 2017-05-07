//
//  MenRecommendDetialTableViewCell.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/6.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenRecommendDetialTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *statLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *replyLabel;
@property (weak, nonatomic) IBOutlet UILabel *browseLabel;
@property (weak, nonatomic) IBOutlet UILabel *assessLabel;

+ (instancetype)initCustomCellWithtableView:(UITableView *)tableView;

@end
