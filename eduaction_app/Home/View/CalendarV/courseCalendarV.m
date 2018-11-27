//
//  courseCalendarV.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/28.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "courseCalendarV.h"

#import "CalendarCell.h"
#import "CalendarHeaderView.h"


@implementation courseCalendarV

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        
        
        @weakify(self);
        self.tempDate = [NSDate date];
        self.dayModelArray = [[NSMutableArray alloc]init];
        
        UIView *topV= [[UIView alloc]init];
        topV.backgroundColor = [UIColor whiteColor];
        [self addSubview:topV];
        [topV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(48);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(0);
        }];
        self.DateTitle = [[UILabel alloc]init];
        self.DateTitle.font = [UIFont systemFontOfSize:15];
        self.DateTitle.textColor = HexRGB(0x333333);
        self.DateTitle.textAlignment = NSTextAlignmentCenter;
        [topV addSubview:self.DateTitle];
        [self.DateTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(120);
            make.height.mas_equalTo(32);
            make.centerX.mas_equalTo(topV.mas_centerX);
            make.centerY.mas_equalTo(topV.mas_centerY);
            
        }];
    
       
        
        UIButton *leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftbtn setImage:[UIImage imageNamed:@"course_ico_left"] forState:UIControlStateNormal];
        [topV addSubview:leftbtn];
        [leftbtn mas_makeConstraints:^(MASConstraintMaker *make) {
           make.right.mas_equalTo(self.DateTitle.mas_left).offset(-20);
           make.centerY.mas_equalTo(topV.mas_centerY);
           make.size.mas_equalTo(CGSizeMake(7, 13));
        }];
        
        [[leftbtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            self.tempDate = [self getLastMonth:self.tempDate];
            self.DateTitle.text = self.tempDate.yyyyMMChineseWithDate;
            [self getDataDayModel:self.tempDate];
        }];
        
        UIButton *rightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightbtn setImage:[UIImage imageNamed:@"course_ico_right"] forState:UIControlStateNormal];
        [topV addSubview:rightbtn];
        [rightbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.DateTitle.mas_right).offset(20);
            make.centerY.mas_equalTo(topV.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(7, 13));
        }];
        [[rightbtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
             @strongify(self);
            self.tempDate = [self getNextMonth:self.tempDate];
            self.DateTitle.text = self.tempDate.yyyyMMChineseWithDate;
            [self getDataDayModel:self.tempDate];
        }];
        
        [self addSubview:self.collectionView];
        
        self.DateTitle.text = self.tempDate.yyyyMMChineseWithDate;
        [self getDataDayModel:self.tempDate];
        
    }
    return self;
}
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        NSInteger width = Iphone6Scale(54);
        NSInteger height = Iphone6Scale(54);
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake(width, height);
        flowLayout.headerReferenceSize = CGSizeMake(LL_SCREEN_WIDTH, HeaderViewHeight);
        flowLayout.sectionInset = UIEdgeInsetsZero;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 48, width * 7, self.frame.size.height - 48 + HeaderViewHeight) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = HexRGB(0xF7F7F7);
        
        [_collectionView registerClass:[CalendarCell class] forCellWithReuseIdentifier:@"CalendarCell"];
        [_collectionView registerClass:[CalendarHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CalendarHeaderView"];
        
    }
    return _collectionView;
}

- (void)getDataDayModel:(NSDate *)date{
    NSUInteger days = [self numberOfDaysInMonth:date];
    NSInteger week = [self startDayOfWeek:date];
    self.dayModelArray = [[NSMutableArray alloc] initWithCapacity:42];
    int day = 1;
    for (int i= 1; i<days+week; i++) {
        if (i<week) {
            [self.dayModelArray addObject:@""];
        }else{
            MonthModel *mon = [MonthModel new];
            mon.dayValue = day;
            NSDate *dayDate = [self dateOfDay:day];
            mon.dateValue = dayDate;
            if ([dayDate.yyyyMMddByLineWithDate isEqualToString:[NSDate date].yyyyMMddByLineWithDate]) {
                mon.isSelectedDay = YES;
                self.lastSelectIndex = i - 1;
            }
            [self.dayModelArray addObject:mon];
            day++;
        }
    }
    [self.collectionView reloadData];
}
#pragma mark -Private
- (NSUInteger)numberOfDaysInMonth:(NSDate *)date{
    NSCalendar *greCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [greCalendar setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    return [greCalendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
    
}
- (NSUInteger)startDayOfWeek:(NSDate *)date
{
    NSCalendar *greCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [greCalendar setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];//Asia/Shanghai
    NSDateComponents *comps = [greCalendar
                               components:NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitWeekday | NSCalendarUnitDay
                               fromDate:[self firstDateOfMonth:date]];
    return comps.weekday;
}
- (NSDate *)dateOfDay:(NSInteger)day{
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [greCalendar setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    NSDateComponents *comps = [greCalendar
                               components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                               fromDate:self.tempDate];
    comps.day = day;
    return [greCalendar dateFromComponents:comps];
}
- (NSDate *)firstDateOfMonth:(NSDate *)date{
    NSCalendar *greCalendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [greCalendar setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    NSDateComponents *comps = [greCalendar
                               components:NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitWeekday | NSCalendarUnitDay
                               fromDate:date];
    comps.day = 1;
    return [greCalendar dateFromComponents:comps];
}
- (NSDate *)getLastMonth:(NSDate *)date{
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [greCalendar setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    NSDateComponents *comps = [greCalendar
                               components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                               fromDate:date];
    comps.month -= 1;
    return [greCalendar dateFromComponents:comps];
}

- (NSDate *)getNextMonth:(NSDate *)date{
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [greCalendar setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    NSDateComponents *comps = [greCalendar
                               components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                               fromDate:date];
    comps.month += 1;
    return [greCalendar dateFromComponents:comps];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dayModelArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CalendarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CalendarCell" forIndexPath:indexPath];
    
    id mon = self.dayModelArray[indexPath.row];
    if ([mon isKindOfClass:[MonthModel class]]) {
        cell.monthModel = (MonthModel *)mon;
    }else{
        cell.dayLabel.text = @"";
    }
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    CalendarHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CalendarHeaderView" forIndexPath:indexPath];
    return headerView;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == _lastSelectIndex) return;
    id mon = self.dayModelArray[indexPath.row];
    id lastMon = self.dayModelArray[self.lastSelectIndex];
    
    if ([lastMon isKindOfClass:[MonthModel class]] && [mon isKindOfClass:[MonthModel class]]) {
        MonthModel *lastMonthModel = (MonthModel *)lastMon;
        lastMonthModel.isSelectedDay = NO;
        
        MonthModel *monthModel = (MonthModel *)mon;
        monthModel.isSelectedDay = YES;
        self.DateTitle.text = [monthModel dateValue].yyyyMMddByLineWithDate;
        
        NSIndexPath *lastSelectPath = [NSIndexPath indexPathForItem:self.lastSelectIndex inSection:0];
        [self.collectionView reloadItemsAtIndexPaths:@[lastSelectPath, indexPath]];
        self.lastSelectIndex = indexPath.row;
    }
    
    
}
@end
