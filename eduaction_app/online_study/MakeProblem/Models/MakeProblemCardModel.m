//
//  MakeProblemCardModel.m
//  eduaction_app
//
//  Created by Mac on 2018/12/12.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MakeProblemCardModel.h"

@implementation MakeProblemCardModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.answerId = @"";
        self.correct = @"";
        self.questionId = @"";
        self.rownum = @"";
    }
    return self;
}
@end
