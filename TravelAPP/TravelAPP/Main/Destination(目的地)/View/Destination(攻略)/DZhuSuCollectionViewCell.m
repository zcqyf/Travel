//
//  DZhuSuCollectionViewCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/5/8.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "DZhuSuCollectionViewCell.h"
#import "DZhuSuBtn.h"

@implementation DZhuSuCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    CGFloat w = self.ScrollBackgoundView.frame.size.width;
    CGFloat h = 80;
    CGFloat btnW = SCREEN_W/3*2;
    NSInteger count = 3;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, h)];
    scrollView.contentSize = CGSizeMake(btnW * count, 0);
    
    for (int i = 0; i < count; i ++) {
        DZhuSuBtn *btn = [[[NSBundle mainBundle] loadNibNamed:@"DZhuSuBtn" owner:nil options:nil] objectAtIndex:0];
        btn.frame = CGRectMake(i*btnW, 0, btnW, h);
        btn.tag = 1000 + i;
        [scrollView addSubview:btn];
    }
    
    [self.ScrollBackgoundView addSubview:scrollView];
}

- (void)setupScrollView {
    
}

@end
