//
//  TRTopTableViewCell.h
//  TravelAPP
//
//  Created by qing on 2017/5/2.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TRTopTableViewCellDelegate <NSObject>

- (void)didSelectAt:(NSIndexPath *)indexPath;

@end

@interface TRTopTableViewCell : UITableViewCell

@property (nonatomic,strong)NSDictionary *data;

@property (nonatomic,weak)id<TRTopTableViewCellDelegate> delegate;

@end
