//
//  MakeProblemAnserModel.m
//  eduaction_app
//
//  Created by Mac on 2018/12/10.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MakeProblemAnserModel.h"

@implementation MakeProblemAnserModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID": @"id"};
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.ID = @"";
        self.answer = @"";
        self.answerTime = @"9999-12-12 00:00:00";
        self.collection = @"";
        self.correct = @"";
        self.discuss = @"";
        self.discussTime = @"9999-12-12 00:00:00";
        self.notes = @"";
    }
    return self;
}
@end
