//
//  MakeProblemMainModel.h
//  eduaction_app
//
//  Created by Mac on 2018/11/16.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MakeProblemOptionModel.h"
#import "MakeProblemAnserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MakeProblemMainModel : NSObject
@property (nonatomic, copy) NSString *selelct;
@property (nonatomic, copy) NSString *optionId;
@property (nonatomic, assign, readonly) BOOL isSelelct;
@property (nonatomic, assign, readonly) BOOL selectTrue;
@property (nonatomic, assign) NSInteger addTextFont;//字体更改的倍数
@property (nonatomic, assign) CGFloat height_analysis,height_notes,height_title;
@property (nonatomic, copy) NSString *rowNum;//当前是第几题

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *questionTitle;
@property (nonatomic, copy) NSString *rows;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *subjectCode;
@property (nonatomic, copy) NSString *analysis;
@property (nonatomic, copy) NSString *answer;
@property (nonatomic, copy) NSString *correctAnswer;

@property (nonatomic, copy) NSString *collectionCount;
@property (nonatomic, copy) NSString *discussCount;
@property (nonatomic, copy) NSString *examinationPoint;

//@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *page;
@property (nonatomic, copy) NSString *questionHouse;
@property (nonatomic, strong) NSMutableArray<MakeProblemOptionModel*> *questionOptionList;
@property (nonatomic, strong) NSMutableArray<MakeProblemAnserModel*> *questionAnswerList;
@property (nonatomic, strong) MakeProblemAnserModel *questionAnswer;

//缺失：笔记，图片，题型，正确率，当前是第几题
//@property (nonatomic, copy) NSString *notes;//笔记，
@property (nonatomic, copy) NSString *image;//图片
@property (nonatomic, copy) NSString *questionType;//题型，有了
@property (nonatomic, copy) NSString *allCorrectLv;//正确率
//@property (nonatomic, copy) NSString *rowsNum;//当前是第几题
@property (nonatomic, copy) NSString *wrongCount;//当前是第几题


//额外放置的信息
@property (nonatomic, strong) NSMutableArray *commits;//评论

- (BOOL)isTrueResult:(NSString *)result;
@end

NS_ASSUME_NONNULL_END


/*
 [
 {
     "questionTitle": "李茉希为什么这么可爱？",
     "rows": 0,
     "state": "1",
     "subjectCode": "大叔大婶",
     "analysis": "ewqeq",
     "answer": "1",
     "collection": "0次",
     "correct": "0",
     "discussCount": "0",
     "examinationPoint": "qwe",
     "id": 81,
     "page": 0,
     "questionHouse": 9,
     "questionOptionList":
         [ {
             "option": "2",
             "optionDescribe": "因为综合了爸爸妈妈的优点",
             "optionId": 54,
             "page": 0,
             "questionId": 81,
             "rows": 0
         }
         ],
 }
 ]
 
 */
