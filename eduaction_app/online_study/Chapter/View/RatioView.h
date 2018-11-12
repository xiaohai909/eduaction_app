//
//  RatioView.h
//  eduaction_app
//
//  Created by Mac on 2018/11/5.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    RatioViewTypeYellow,//黄色的占比 片
    RatioViewTypeBlue,//蓝色的占比 片
    RatioViewTypeColorful,//多个颜色的占比 片
    
    RatioViewTypeRedLine,//红色的占比,多层
    RatioViewTypeYellowLine,//黄色线段
    
    
} RatioViewType;


//number 0~1
@interface RatioView : UIView
@property (nonatomic, strong) UILabel *lbl_number;
- (void)creatRatioViewWithNumber:(CGFloat)number andType:(RatioViewType)type;
- (void)creatColorfulRatioViewWithNumbers:(NSArray *)numbers;
@end

NS_ASSUME_NONNULL_END
