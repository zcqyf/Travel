//
//  DMallSearchReusableView.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/9.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DMallSearchReusableViewDelegate <NSObject>

- (void)searchAction:(UIButton *)sender;

@end

@interface DMallSearchReusableView : UICollectionReusableView

@property (nonatomic, weak)id<DMallSearchReusableViewDelegate> deleagte;

@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;

@end
