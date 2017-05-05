//
//  ActivityCollectionViewCell.h
//  TravelAPP
//
//  Created by qing on 2017/4/29.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ActivityCollectionViewCellDelegate <NSObject>

- (void)clickedAt: (NSIndexPath *)indexPath title:(NSString *)title;

@end

@interface ActivityCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong)NSArray *data;

@property (nonatomic,weak)id<ActivityCollectionViewCellDelegate> delegate;

@end
