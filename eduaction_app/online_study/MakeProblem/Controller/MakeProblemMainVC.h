//
//  MakeProblemMainVC.h
//  eduaction_app
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, MakeProblemMainMode) {
    MakeProblemMainModeSimulateExam,//模拟考试

    MakeProblemMainModeErrorPractice,//错题练习
    MakeProblemMainModeRandomPractice,//随机练习
};
@interface MakeProblemMainVC : BaseViewController
- (void)setMode:(MakeProblemMainMode)mode;
@end

NS_ASSUME_NONNULL_END
