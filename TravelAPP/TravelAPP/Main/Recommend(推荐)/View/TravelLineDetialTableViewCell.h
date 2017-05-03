//
//  TravelLineDetialTableViewCell.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/2.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TravelLineDetialTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *myTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *LikeButton;
@property (weak, nonatomic) IBOutlet UILabel *startLabel;
@property (weak, nonatomic) IBOutlet UILabel *pointLabel;
@property (weak, nonatomic) IBOutlet UILabel *paiHangLabel;
@property (weak, nonatomic) IBOutlet UILabel *peopleLabel;

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@property (weak, nonatomic) IBOutlet UILabel *destinationLabel;

+ (instancetype)initCustomCellWithTabelView: (UITableView *)tableView;

@end
