//
//  GYCalendarView.m
//  oc_日历
//
//  Created by Gene_Ye on 2017/5/4.
//  Copyright © 2017年 Gene. All rights reserved.
//

#import "GYCalendarView.h"
#import "CalendarCollectionViewCell.h"

#define itemWidth self.frame.size.width/7
#define itemHeight self.frame.size.height/4

@interface GYCalendarView()

@property (nonatomic, strong)NSDate *date;

@property (nonatomic, strong)NSDate *didselectDate;

@property (nonatomic, assign)NSInteger year;
@property (nonatomic, assign)NSInteger month;
@property (nonatomic, assign)NSInteger day;

@property (nonatomic, strong)UICollectionView *collectionView;

@end

@implementation GYCalendarView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.date = [NSDate date];
//        self.date = [NSDate dateWithTimeIntervalSinceNow:60*60*24*30];
        [self setupTitleView];
        [self setupCollectionWithFrame:frame];
//        [self setupTopScrollView];
        
    }
    return self;
}

//- (void)setupTopScrollView {
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 30)];
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yy年MM月"];
//    NSString *dayStr = [formatter stringFromDate:self.date];
//    label.text = dayStr;
//    [self addSubview:label];
//    
//}

- (void)setupTitleView{
    
    CGFloat titleViewHeight = 30.0;
    
    NSDictionary *dayDic = @{@"1":@"星期一", @"2":@"星期二", @"3":@"星期三", @"4":@"星期四", @"5":@"星期五", @"6":@"星期六", @"7":@"星期天"};
    
    for (int i = 1; i < 8; i++) {
        int day = i;
        if (day == 7) {
            day = 0;
        }
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(day * itemWidth, 0, itemWidth, titleViewHeight)];
        label.text = [dayDic objectForKey:[NSString stringWithFormat:@"%d",i]];
        label.textAlignment = NSTextAlignmentCenter;
        [label setFont:[UIFont systemFontOfSize:13.0]];
        
        [self addSubview:label];
    }
    
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(0, titleViewHeight-1, self.frame.size.width, 0.5)];
    colorView.backgroundColor = [UIColor cyanColor];
    [self addSubview:colorView];
}

- (void)setupCollectionWithFrame: (CGRect)frame {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 30, frame.size.width, itemWidth*6.0) collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerNib:[UINib nibWithNibName:@"CalendarCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"CELL"];
    
    _collectionView.scrollEnabled = NO;
    
    [self addSubview:_collectionView];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger firstday = [self firstWeekdayInThisMonth:self.date];
    return [self numberOfDaysInMonthsWithDate:self.date] + firstday;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CalendarCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd"];
    NSString *dayStr = [formatter stringFromDate:self.date];
    
    int dayInt = [dayStr intValue];
    
    if (indexPath.row >= [self firstWeekdayInThisMonth:self.date] ) {
        cell.myTitleLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row-[self firstWeekdayInThisMonth:self.date] + 1];
        if (dayInt == (long)indexPath.row-[self firstWeekdayInThisMonth:self.date] + 1) {
            cell.myTitleLabel.backgroundColor = [UIColor cyanColor];
        }
    }
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(itemWidth, itemWidth);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CalendarCollectionViewCell *cell = (CalendarCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    cell.myTitleLabel.backgroundColor = [UIColor redColor];
    
    NSLog(@"%@",cell.myTitleLabel.text);
    
}

/*
 当前 日 所在的月 有多少天
 */

- (NSInteger)numberOfDaysInMonthsWithDate:(NSDate *)date {
    NSRange totaldaysInMonth = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return totaldaysInMonth.length;
}

/*
 当前 日 所在的 月 的第一天是星期几
 */

- (NSInteger)firstWeekdayInThisMonth: (NSDate *)date {
    
    NSCalendar *calender = [NSCalendar currentCalendar];
    
    [calender setFirstWeekday:1];
    
    NSDateComponents *comp = [calender components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    
    [comp setDay:1];
    
    NSDate *firstDayOfMonthDate = [calender dateFromComponents:comp];
    
    NSInteger firstWeekday = [calender ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonthDate];
    
    return firstWeekday - 1;
}




@end
