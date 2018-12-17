//
//  ChapterScoreModel.h
//  eduaction_app
//
//  Created by Mac on 2018/11/28.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MakeProblemCardModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChapterScoreModel : NSObject
@property (nonatomic, copy) NSString *answerCount;
@property (nonatomic, copy) NSString *correctCount;
@property (nonatomic, copy) NSString *questionCount;
@property (nonatomic, copy) NSString *wrongCount;
@property (nonatomic, copy) NSString *leftCount;

@property (nonatomic, copy) NSString *correctLv;
//@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *analysis;
@property (nonatomic, copy) NSString *collection;
@property (nonatomic, copy) NSString *correct;
@property (nonatomic, copy) NSString *notes;

//提卡
@property (nonatomic, strong) NSMutableArray<MakeProblemCardModel *> *questionCard;
@end

NS_ASSUME_NONNULL_END
/*
 analysis = wrongAnalysis;
 answerCount = 2;
 collection = myCollect;
 correct = myWrong;
 correctCount = 2;
 correctLv = "100.00%";
 id = 3;
 leftCount = 9;
 name = "\U517d\U533b\U4e34\U5e8a\U57fa\U7840\U5b66";
 notes = myNotes;
 page = 0;
 questionCount = 11;
 rows = 0;
 wrongCount = 0;
 */
