//
//  ConsultionHeaderTableViewCell.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/6.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConsultionHeaderTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *helloLabel;

@property (weak, nonatomic) IBOutlet UIButton *likeButton;

+ (instancetype)initCustomCellWithTableView:(UITableView *)tableView;

@end
