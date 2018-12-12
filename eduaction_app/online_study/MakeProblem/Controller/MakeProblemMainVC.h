//
//  MakeProblemMainVC.h
//  eduaction_app
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "BaseViewController.h"
#import "MakeProblemMainCollection.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, MakeProblemMainMode) {
    MakeProblemMainModeSimulateExam,//模拟考试

    MakeProblemMainModeErrorPractice,//错题练习
    MakeProblemMainModeRandomPractice,//随机练习
};
@interface MakeProblemMainVC : BaseViewController
@property (nonatomic, strong) NSString *questionHouse;
@property (nonatomic, strong) NSString *lastNum;
@property (nonatomic, strong) NSString *myWrongType;

//底下的工具栏都能做哪些功能
//考试:考试用时，交卷
//练习:收藏，笔记，批阅，设置(更多)（答题模式，考试模式，背题模式，设置（答题后跳转，字体设置））
//错题练习:收藏，笔记，切换（答题模式，浏览模式），设置（答题后跳转，字体设置）

//答案显不显示
//考试模式：选完就下一题
//背题模式：显示答案解析
//练习模式：做题并显示答案解析
- (void)setMode:(MakeProblemMainMode)mode andShowMode:(MakeProblemMode)showMode;
@end

NS_ASSUME_NONNULL_END
