//
//  MakeProblemOptionModel.h
//  eduaction_app
//
//  Created by Mac on 2018/11/30.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MakeProblemOptionModel : NSObject
@property (nonatomic, copy) NSString *option;
@property (nonatomic, copy) NSString *optionDescribe;
@property (nonatomic, copy) NSString *optionId;
@property (nonatomic, copy) NSString *questionId;
@end

NS_ASSUME_NONNULL_END
/*
 "option": "2",
 "optionDescribe": "因为综合了爸爸妈妈的优点",
 "optionId": 54,
 "page": 0,
 "questionId": 81,
 "rows": 0
 */
