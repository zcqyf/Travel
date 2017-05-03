//
//  TLGuangGaoTableViewCell.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/3.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLGuangGaoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bgView;

+ (instancetype)initCustomViewWithTableView:(UITableView *)tableView;

@end
