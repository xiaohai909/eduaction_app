//
//  courseCalendarV.h
//  eduaction_app
//
//  Created by legendlxd on 2018/11/28.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface courseCalendarV : UIView<UICollectionViewDelegate, UICollectionViewDataSource>
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *dayModelArray;
@property (strong, nonatomic) NSDate *tempDate;
// 上一次选择index ，初始值为今天的index
@property (assign, nonatomic) NSInteger lastSelectIndex;
@property (nonatomic,strong)UILabel *DateTitle;

@end
NS_ASSUME_NONNULL_END

