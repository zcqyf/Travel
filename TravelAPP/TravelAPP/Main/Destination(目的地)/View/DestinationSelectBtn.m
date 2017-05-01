//
//  DestinationSelectBtn.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/4/30.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "DestinationSelectBtn.h"

@implementation DestinationSelectBtn

+(instancetype)initCustomBtnWithTitle:(NSString *)title {
    
    DestinationSelectBtn *btn = [[[NSBundle mainBundle] loadNibNamed:@"DestinationSelectBtn" owner:nil options:nil] objectAtIndex:0];
    btn.myTitle.text = title;
    btn.myTitle.tag = 1000;
    return btn;
    
}

@end
