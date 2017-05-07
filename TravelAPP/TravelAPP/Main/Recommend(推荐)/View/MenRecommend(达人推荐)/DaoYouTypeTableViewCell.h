//
//  DaoYouTypeTableViewCell.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/7.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DaoYouTypeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *selectBtn;

+(instancetype)initCustomCellWithTableView:(UITableView *)tableView;

@end
