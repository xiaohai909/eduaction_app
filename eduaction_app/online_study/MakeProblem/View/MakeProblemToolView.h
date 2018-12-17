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
    MakeProblemToolTypeSimulateExam,//模拟考试模式：考试用时，交卷
    MakeProblemToolTypeErrorPractice,//错题练习模式：收藏，笔记，切换（答题模式，浏览模式），设置（答题后跳转，字体设置）
    MakeProblemToolTypeRandomPractice,//随机练习模式：收藏，笔记，批阅，设置(更多)（答题模式，考试模式，背题模式，设置（答题后跳转，字体设置））

    MakeProblemToolTypeChangeMode,//切换模式：答题模式，浏览模式
    MakeProblemToolTypeMoreMode,//更多功能：答题模式，考试模式，背题模式，设置
};

@interface MakeProblemToolView : UIView
@property (nonatomic, assign) MakeProblemToolType toolType;
@property (nonatomic, strong) NSMutableArray *btn_array;
@property (nonatomic, copy) void (^blockGoOn)(UIButton *btn);

- (void)creatToolViewWithType:(MakeProblemToolType)type;//按照类型创建
@end

NS_ASSUME_NONNULL_END
