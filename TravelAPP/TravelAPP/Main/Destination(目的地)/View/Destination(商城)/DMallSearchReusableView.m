//
//  DMallSearchReusableView.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/9.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "DMallSearchReusableView.h"

@implementation DMallSearchReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.searchBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.searchBtn.layer.borderWidth = 0.5;
    self.searchBtn.layer.cornerRadius = 5.0;
    self.searchBtn.layer.masksToBounds = YES;
    
}
- (IBAction)searchAction:(UIButton *)sender {
    if ([self.deleagte respondsToSelector:@selector(searchAction:)]) {
        [self.deleagte searchAction:sender];
    }
}

@end
