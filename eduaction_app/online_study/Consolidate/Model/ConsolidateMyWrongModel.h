//
//  ConsolidateMyWrongModel.h
//  eduaction_app
//
//  Created by Mac on 2018/11/29.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConsolidateMyWrongModel : NSObject
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat height_modify;
@property (nonatomic, assign) CGFloat height_notes;


//@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *notes;
@property (nonatomic, copy) NSString *questionId;
@property (nonatomic, copy) NSString *questionTitle;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *rows;

@property (nonatomic, copy) NSString *answer;
@property (nonatomic, copy) NSString *answerTime;
@property (nonatomic, copy) NSString *collection;
@property (nonatomic, copy) NSString *correct;
@property (nonatomic, copy) NSString *discuss;

@property (nonatomic, copy) NSString *discussState;
@property (nonatomic, copy) NSString *discussTime;
@property (nonatomic, copy) NSString *empty;
@end

NS_ASSUME_NONNULL_END

/*
 id = 12;
 notes = "\U505a\U7b14\U8bb0";
 page = 0;
 questionId = 2;
 questionTitle = "\U4e0b\U5217\U6fc0\U7d20\U4e2d\U4e0e\U4ea4\U611f\U795e\U7ecf\U4f5c\U7528\U76f8\U540c\U7684\U662f\Uff08   \Uff09";
 rows = 0;
 userId = 33;
 */
