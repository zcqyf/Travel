//
//  ConsultionTitleTableViewCell.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/7.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConsultionTitleTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *myTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@property (weak, nonatomic) IBOutlet UIButton *jianBtn;

+(instancetype)initCustomCellWithTableView:(UITableView *)tableView Type:(NSInteger)type;

@end
