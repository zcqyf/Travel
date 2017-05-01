//
//  DestinationSelectBtn.h
//  TravelAPP
//
//  Created by Gene_Ye on 2017/4/30.
//  Copyright © 2017年 qing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DestinationSelectBtn : UIButton

@property (weak, nonatomic) IBOutlet UILabel *myTitle;

+ (instancetype)initCustomBtnWithTitle:(NSString *)title;

@end
