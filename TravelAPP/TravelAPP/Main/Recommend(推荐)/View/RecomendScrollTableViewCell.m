//
//  RecomendScrollTableViewCell.m
//  TravelAPP
//
//  Created by Gene_Ye on 2017/4/29.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "RecomendScrollTableViewCell.h"
#import "HotRecommendBtn.h"
#import "RecomendMenBtn.h"
#import "RecommendWanFaBtn.h"

@implementation RecomendScrollTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

+ (instancetype)initCustomScrollViwCellWithTableView:(UITableView *)tableView WithStyle:(NSInteger)style{
    
    static NSString *identifier = @"cell";
    
    RecomendScrollTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"RecomendScrollTableViewCell" owner:nil options:nil] objectAtIndex:0];
        
        cell.backgroundColor = [UIColor cyanColor];
        
        CGSize cellSize;
        if (style == 1) {
            cellSize = CGSizeMake(200, 200);
        }else if (style == 2){
            cellSize = CGSizeMake(200, 200);
        }else if (style == 3) {
            cellSize = CGSizeMake(300, 300);
        }
        
        
        [cell createScrollViewWithItemFrame:cellSize ItemCount:6 Style:style];
    }
    return cell;
}

- (void)createScrollViewWithItemFrame:(CGSize)size ItemCount:(NSInteger)count Style:(NSInteger)style{
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, size.height)];
    
    CGFloat btnHeight = size.height;
    CGFloat btnWidth = size.width;
    
    
    scrollView.contentSize = CGSizeMake(btnWidth * count, 0);
    
    scrollView.backgroundColor = [UIColor whiteColor];
    
    if (style == 1) {
        for (int i = 0; i < count; i++) {
            
            HotRecommendBtn *btn = [HotRecommendBtn initCustomBtnWithFrame:CGRectMake(btnWidth * i, 0, btnWidth, btnHeight)];
            
            btn.tag = 100+i;
            [btn addTarget:self action:@selector(clickBtnAction:) forControlEvents:UIControlEventTouchDown];
            
            [scrollView addSubview:btn];
        }
    }else if (style == 2){
        for (int i = 0; i < count; i++) {
            
            RecomendMenBtn *btn = [RecomendMenBtn initCustomBtnWithFrame:CGRectMake(btnWidth * i, 0, btnWidth, btnHeight)];
            
            btn.tag = 200+i;
            [btn addTarget:self action:@selector(clickBtnAction:) forControlEvents:UIControlEventTouchDown];
            
            [scrollView addSubview:btn];
        }
    }else if (style == 3) {
        for (int i = 0; i < count; i++) {
            
            RecommendWanFaBtn *btn = [RecommendWanFaBtn initCustomBtnWithFrame:CGRectMake(btnWidth * i, 0, btnWidth, btnHeight)];
            
            btn.tag = 300+i;
            [btn addTarget:self action:@selector(clickBtnAction:) forControlEvents:UIControlEventTouchDown];
            
            [scrollView addSubview:btn];
        }
    }
    
    [self addSubview:scrollView];

}

- (void)clickBtnAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(clickHotRecommendBtnAction:)]) {
        [self.delegate clickHotRecommendBtnAction:sender];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

























@end
