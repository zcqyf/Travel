//
//  SettingInfoTableViewCell.h
//  TravelAPP
//
//  Created by qing on 2017/5/11.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingInfoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgWidth;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgHeight;

@end
