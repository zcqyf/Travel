//
//  DfooterBtnCollectionReusableView.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/8.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "DfooterBtnCollectionReusableView.h"

@implementation DfooterBtnCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.btn.layer.cornerRadius = 7.0;
    self.btn.layer.masksToBounds = YES;
    self.btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.btn.layer.borderWidth = 0.5;
   
}
- (IBAction)clickAction:(UIButton *)sender {
}

@end
