//
//  MenRecommendHeaderTableViewCell.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/6.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenRecommendHeaderTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;

@property (weak, nonatomic) IBOutlet UIImageView *backgourdImageView;

+(instancetype)initCustomCellWithTableView: (UITableView *)tableView;
@end
