//
//  MakeProblemMainModel.m
//  eduaction_app
//
//  Created by Mac on 2018/11/16.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MakeProblemMainModel.h"

@implementation MakeProblemMainModel


- (BOOL)isSelelct
{
    if (self.selelct.length) {
        return YES;
    }
    return NO;
}
- (BOOL)selectTrue
{
    if (self.selelct.length && [self.selelct isEqualToString:@"2"]) {
        return YES;
    }
    return NO;
}
- (BOOL)isTrueResult:(NSString *)result{
    //是正确的答案
    if ([result isEqualToString:@"2"]) {
        return YES;
    }
    return NO;
}
@end
