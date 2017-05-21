//
//  NavBarView.m
//  TestBezier
//
//  Created by qing on 2017/5/21.
//  Copyright © 2017年 qing. All rights reserved.
//

#import "NavBarView.h"


#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

@interface NavBarView()

/// 路径
@property (nonatomic, strong) UIBezierPath *path;

/// 起始点
@property (nonatomic, assign) CGPoint startP;

/// 终止点
@property (nonatomic, assign) CGPoint endP;

/// 控制点
@property (nonatomic, assign) CGPoint controlP;

/// 线的颜色
@property (nonatomic, strong) UIColor *pathColor;

/// 线的宽度
@property (nonatomic, assign) CGFloat pathWidth;

/// 当前触摸的点
@property (nonatomic, assign) NSUInteger currentTouchP;

@end

@implementation NavBarView

/// 初始化
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        // 设置初始值
        self.startP    = CGPointMake(0, 78 + 30);
        self.endP      = CGPointMake(screenWidth, 78 + 30);
        self.controlP  = CGPointMake(screenWidth/2, 128 + 30 - 10);
        
        self.pathColor = [UIColor whiteColor];
        self.pathWidth = 0.5;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    // 绘制贝塞尔曲线
    self.path = [UIBezierPath bezierPath];
    [self.path moveToPoint:self.startP];
    
    [self.path addQuadCurveToPoint:self.endP controlPoint:self.controlP];
    [self.path addLineToPoint:CGPointMake(screenWidth, 0)];
    [self.path addLineToPoint:CGPointMake(0, 0)];
    [self.path addLineToPoint:self.startP];
    self.path.lineWidth = self.pathWidth;
    
    [self.pathColor setStroke];
    [self.path stroke];
    
    UIColor *fillColor = [UIColor colorWithRed:251/255.0 green:103/255.0 blue:57/255.0 alpha:1.0];          //设置颜色
    [fillColor set];                                    //填充颜色
    [self.path fill];
}


@end

