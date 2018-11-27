//
//  CalendarCell.h
//  eduaction_app
//
//  Created by legendlxd on 2018/11/28.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MonthModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CalendarCell : UICollectionViewCell
@property (weak, nonatomic) UILabel *dayLabel;

@property (strong, nonatomic) MonthModel *monthModel;
@end

NS_ASSUME_NONNULL_END
