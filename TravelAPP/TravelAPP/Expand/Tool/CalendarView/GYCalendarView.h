//
//  GYCalendarView.h
//  oc_日历
//
//  Created by Gene_Ye on 2017/5/4.
//  Copyright © 2017年 Gene. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GYCalendarViewDelegate <NSObject>

- (void)GYCalendarViewDidSelectDate:(UICollectionView *)collectionView IndexPath:(NSIndexPath *)indexPath;

@end

@interface GYCalendarView : UIView<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak)id<GYCalendarViewDelegate> delegate;

@end
