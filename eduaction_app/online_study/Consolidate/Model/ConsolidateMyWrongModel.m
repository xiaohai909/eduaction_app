//
//  ConsolidateMyWrongModel.m
//  eduaction_app
//
//  Created by Mac on 2018/11/29.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ConsolidateMyWrongModel.h"

@implementation ConsolidateMyWrongModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID": @"id"};
}

- (CGFloat)height
{
    if (_height) {
        return _height;
    }
    else{
        CGFloat height = [UIView viewGetHeightWithContent:self.questionTitle width:ZTWidth-20-10 font:16];
        _height = height+10;
        return _height;
    }    
}
- (CGFloat)height_modify
{
    if (_height_modify) {
        return _height_modify;
    }
    else{
        CGFloat height = [UIView viewGetHeightWithContent:self.questionTitle width:ZTWidth-51-10 font:16];
        _height_modify = height+10;
        return _height_modify;
    }
}
- (CGFloat)height_notes
{
    if (_height_notes) {
        return _height_notes;
    }
    else{
        CGFloat height = [UIView viewGetHeightWithContent:self.notes width:ZTWidth-51-10 font:16];
        _height_notes = height+10;
        return _height_notes;
    }
}
@end
