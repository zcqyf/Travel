//
//  SelecterContentsScrollView.m
//  UI_SelectTool
//
//  Created by Gene_Ye on 2016/11/1.
//  Copyright © 2016年 Gene. All rights reserved.
//

#import "SelecterContentsScrollView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation SelecterContentsScrollView

- (instancetype)initWithFrame:(CGRect)frame
     SelecterConditionVCArray:(NSArray *)vcArray
                     AndStyle:(TypeStyle)typeStyle
                  andBtnBlock:(ScrollPage)scrollPage{
    
    if (self = [super init]) {
        
        self.frame = frame;
        
        _vcArray = [NSArray arrayWithArray:vcArray];
        
        if (typeStyle == homeStyle) {
            [self lazyLoadVCFromIndex:1];
            [self updateVCViewFromIndex:1];
        }
        else{
            [self lazyLoadVCFromIndex:0];
        }
        
        self.pagingEnabled = YES;
        
        self.contentSize = CGSizeMake(SCREEN_WIDTH * vcArray.count, 0);
        
        self.scrollPage = scrollPage;
        self.delegate = self;
    }
    return self;
}

- (void)updateVCViewFromIndex:(NSInteger)index{
    [self setContentOffset:CGPointMake(SCREEN_WIDTH * index, 0) animated:YES];
}

- (void)lazyLoadVCFromIndex:(NSInteger)index{
    
    UIViewController *pageViewController = _vcArray[index];
    pageViewController.view.frame = CGRectMake(SCREEN_WIDTH * index, 0, SCREEN_WIDTH, self.frame.size.height);
    
    [self addSubview:pageViewController.view];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int pageNum = scrollView.contentOffset.x / SCREEN_WIDTH;
    
    [self lazyLoadVCFromIndex:pageNum];
    
    self.scrollPage(pageNum);
}




@end
