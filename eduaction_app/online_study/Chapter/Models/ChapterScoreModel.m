//
//  ChapterScoreModel.m
//  eduaction_app
//
//  Created by Mac on 2018/11/28.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ChapterScoreModel.h"

@implementation ChapterScoreModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.correctCount = @"0";
        self.answerCount = @"0";
        self.questionCount = @"0";
        self.wrongCount = @"0";
        self.leftCount = @"0";
        self.correctLv = @"0%";
    }
    return self;
}

+(NSDictionary *)objectClassInArray
{
    return @{@"questionCard":[MakeProblemCardModel class]};
}
@end
