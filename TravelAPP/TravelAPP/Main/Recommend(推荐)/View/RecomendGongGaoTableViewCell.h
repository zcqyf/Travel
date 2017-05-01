//
//  RecomendGongGaoTableViewCell.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/4/30.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecomendGongGaoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *myTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *myContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *styleLabel;

+ (instancetype)initCustomCellWithTableView:(UITableView *)tableView;

@end
