//
//  MakeProblemToolView.h
//  eduaction_app
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, MakeProblemToolType) {
    MakeProblemToolTypeNormal,//正常的四个工具
    MakeProblemToolTypeExam,//考试模式
    MakeProblemToolTypeCheckbox,//多选模式
};

@interface MakeProblemToolView : UIView
@property (nonatomic, copy) void (^blockGoOn)(NSString *title);
@end

NS_ASSUME_NONNULL_END
