//
//  ChapterListModel.h
//  eduaction_app
//
//  Created by Mac on 2018/11/28.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChapterListModel : NSObject
@property (nonatomic, copy) NSString *answerCount;
@property (nonatomic, copy) NSString *correctCount;
@property (nonatomic, copy) NSString *questCount;

@property (nonatomic, copy) NSString *classID;
@property (nonatomic, copy) NSString *secClassID;
@property (nonatomic, copy) NSString *secName;
@property (nonatomic, copy) NSString *correctLv;
@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *page;
@property (nonatomic, copy) NSString *rows;

@property (nonatomic, copy) NSString *lastId;
@property (nonatomic, copy) NSString *lastNum;
@end

NS_ASSUME_NONNULL_END
/*
 "answerCount": 4,
 "classID": 2,
 "correctCount": 3,
 "correctLv": "75.00%",
 "name": "基础科目",
 "page": 0,
 "pageBean": {
 "count": 0,
 "endNo": 0,
 "nextPageNo": 0,
 "page": 1,
 "pageSize": 0,
 "pages": 0,
 "prePageNo": 1,
 "startNo": 1
 },
 "questCount": 32,
 "rows": 0
 */
