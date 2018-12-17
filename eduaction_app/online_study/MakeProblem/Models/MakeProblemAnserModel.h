//
//  MakeProblemAnserModel.h
//  eduaction_app
//
//  Created by Mac on 2018/12/10.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MakeProblemAnserModel : NSObject
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *answer;
@property (nonatomic, copy) NSString *answerTime;
@property (nonatomic, copy) NSString *collection;
@property (nonatomic, copy) NSString *correct;
@property (nonatomic, copy) NSString *discuss;
@property (nonatomic, copy) NSString *discussTime;
@property (nonatomic, copy) NSString *notes;
@end

NS_ASSUME_NONNULL_END
/*
 answer = A;
 answerTime = "2018-12-07 00:18:29.0";
 collection = 1;
 correct = 1;
 discuss = "\U5bf9\U5bf9\U5bf9";
 discussTime = "2018-12-07 00:18:29.0";
 id = 62;
 notes = "\U6211\U4fee\U6539\U4e86\U7b14\U8bb0";
 page = 0;
 pageBean =             {
 count = 0;
 endNo = 0;
 nextPageNo = 0;
 page = 1;
 pageSize = 0;
 pages = 0;
 prePageNo = 1;
 startNo = 1;
 };
 rows = 0;
 */
