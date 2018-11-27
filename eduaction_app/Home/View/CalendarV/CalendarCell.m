//
//  CalendarCell.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/28.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "CalendarCell.h"

@implementation CalendarCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = HexRGB(0xF7F7F7);
//        CGFloat width = self.contentView.frame.size.width*0.6;
//        CGFloat height = self.contentView.frame.size.height*0.6;
        
        UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,54,54)];
        dayLabel.textAlignment = NSTextAlignmentCenter;
        dayLabel.layer.masksToBounds = YES;
        dayLabel.layer.cornerRadius = self.contentView.py_width*0.6 * 0.5;
        dayLabel.textColor = [UIColor blackColor];
        dayLabel.backgroundColor = HexRGB(0xF7F7F7);

        [self addSubview:dayLabel];
        [dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
            
            make.centerX.mas_equalTo(self.mas_centerX);
            make.centerY.mas_equalTo(self.mas_centerY);
            make.width.height.mas_equalTo(self.contentView.py_width*0.6);
        }];
        self.dayLabel = dayLabel;
        
    }
    return self;
}
- (void)setMonthModel:(MonthModel *)monthModel{
    _monthModel = monthModel;
    self.dayLabel.text = [NSString stringWithFormat:@"%02ld",monthModel.dayValue];
    if (monthModel.isSelectedDay) {
        self.dayLabel.backgroundColor = [UIColor redColor];
        self.dayLabel.textColor = [UIColor whiteColor];
    } else {
        self.dayLabel.backgroundColor = HexRGB(0xF7F7F7);
        self.dayLabel.textColor = [UIColor blackColor];
    }
}
@end
