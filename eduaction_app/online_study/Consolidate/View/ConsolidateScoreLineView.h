//
//  ConsolidateScoreLineView.h
//  eduaction_app
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConsolidateScoreLineView : UIView
@property (nonatomic, strong) CALayer *image_layer;//曲线图显示的地方
- (void)creatBezierPathViewWithNumbers:(NSArray *)numbers;//曲线图
@end

NS_ASSUME_NONNULL_END
