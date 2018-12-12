//
//  MakeProblemMainModel.m
//  eduaction_app
//
//  Created by Mac on 2018/11/16.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MakeProblemMainModel.h"

@implementation MakeProblemMainModel

+(NSDictionary *)objectClassInArray
{
    return @{@"questionOptionList":[MakeProblemOptionModel class],@"questionAnswerList":[MakeProblemAnserModel class]};
}
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID": @"id"};
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.ID = @"";
        self.questionTitle = @"";
        self.rows = @"";
        self.state = @"";
        self.subjectCode = @"";
        self.analysis = @"";
        self.answer = @"";
        
        self.collectionCount = @"";
        self.discussCount = @"";
        self.examinationPoint = @"";
        self.page = @"";
        self.questionHouse = @"";
        self.questionOptionList = [NSMutableArray array];
        self.questionAnswerList = [NSMutableArray array];
        self.questionAnswer = [MakeProblemAnserModel new];
        
        self.image = @"";
        self.questionType = @"";
        self.allCorrectLv = @"";
        self.wrongCount = @"";
        self.questionHouse = @"";
        self.commits = [NSMutableArray array];
    }
    return self;
}

- (MakeProblemAnserModel *)questionAnswer
{
    if (self.questionAnswerList.count == 0 && _questionAnswer) {
        return _questionAnswer;
    }
    
    if (self.questionOptionList && self.questionAnswerList.count>0) {
        MakeProblemAnserModel *model = [self.questionAnswerList lastObject];
        _questionAnswer = model;
    }
    else{
        _questionAnswer = [MakeProblemAnserModel new];
    }
    return _questionAnswer;
}
- (BOOL)isSelelct
{
    if (self.selelct.length) {
        return YES;
    }
    return NO;
}
- (BOOL)selectTrue
{
    if (self.selelct.length && [self.selelct isEqualToString:self.answer]) {
        return YES;
    }
    return NO;
}
- (BOOL)isTrueResult:(NSString *)result{
    //是正确的答案
    if ([result isEqualToString:self.answer]) {
        return YES;
    }
    return NO;
}

- (void)setAddTextFont:(NSInteger)addTextFont
{
    if (_addTextFont != addTextFont) {
        _addTextFont = addTextFont;
        _height_notes = 0;
        _height_title = 0;
        _height_analysis = 0;
    }
}

- (CGFloat)height_analysis
{
    if (_height_analysis) {
        return _height_analysis;
    }
    else{
        CGFloat text_height = [UIView viewGetHeightWithContent:self.analysis width:ZTWidth-17-17 font:16+self.addTextFont];//
        _height_analysis = text_height+55;
        return _height_analysis;
    }
}
- (CGFloat)height_notes
{
    if (_height_notes) {
        return _height_notes;
    }
    else{
        CGFloat text_height = [UIView viewGetHeightWithContent:self.questionAnswer.notes width:ZTWidth-17-17 font:16+self.addTextFont];
        _height_notes = text_height+55;
        return _height_notes;
    }
}
- (CGFloat)height_title
{
    if (_height_title) {
        return _height_title;
    }
    else{
        CGFloat text_height = [UIView viewGetHeightWithContent:self.questionTitle width:ZTWidth-17-17 font:14+self.addTextFont];
        _height_title = self.image.length?text_height+55+100:text_height+55;//图片的高度
        return _height_title;
    }
}



@end
