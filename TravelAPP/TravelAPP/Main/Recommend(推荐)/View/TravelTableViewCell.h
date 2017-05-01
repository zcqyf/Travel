//
//  TravelTableViewCell.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/4/30.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TravelTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *myTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *myContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *styleLabel;

+ (instancetype)initCustomCellViewTableView:(UITableView *)tableView;

@end
