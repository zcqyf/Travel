//
//  DestinationLeftSelectView.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/4/30.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "DestinationLeftSelectView.h"
#import "DestinationSelectBtn.h"

@implementation DestinationLeftSelectView

+ (instancetype)initWithLeftSelectViewWithFrame:(CGRect)frame WithDataSource:(NSArray *)dataSoucre {
    DestinationLeftSelectView *selectView = [[DestinationLeftSelectView alloc] init];
    selectView.frame = frame;
    
    [selectView createSelectBtnInViewWithDataSource:dataSoucre Size: CGSizeMake(100, 50)];
    
    return selectView;
    
}

- (void)createSelectBtnInViewWithDataSource:(NSArray *)dataSoucre Size:(CGSize)size {
    
    CGFloat btnWidth = size.width;
    CGFloat btnHeight = size.height;
    NSInteger count = dataSoucre.count;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    scrollView.tag = 1000;
    
    scrollView.contentSize = CGSizeMake(0, count * btnHeight);

    for (int i = 0; i < count; i++) {
        
        DestinationSelectBtn *btn = [DestinationSelectBtn initCustomBtnWithTitle:dataSoucre[i]];
        if (i == 0) {
            btn.myTitle.textColor = [UIColor cyanColor];
        }
        btn.frame = CGRectMake(0 , i * btnHeight, btnWidth, btnHeight);
        btn.tag = 100+i;
        [btn addTarget:self action:@selector(clickBtnAction:) forControlEvents:UIControlEventTouchDown];
        [scrollView addSubview:btn];
        
    }
    
    [self addSubview:scrollView];
}

- (void)clickBtnAction:(UIButton *)sender{
    
    if ([self.delegate respondsToSelector:@selector(clickDestinationSeletBtnAction:)]) {
        [self.delegate clickDestinationSeletBtnAction:sender];
    }
    
    
}

@end
