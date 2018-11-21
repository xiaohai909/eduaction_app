//
//  noticeSubjectmanager.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/19.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "noticeSubjectmanager.h"

@implementation noticeSubjectmanager
+(noticeSubjectmanager *)sharenoticeSubjectmanager
{
    
    static noticeSubjectmanager * Mangager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (Mangager == nil)
        {
            Mangager = [self new];
        }
    });
    return Mangager;
}
-(instancetype)init{
    if ([super init]) {
        
        self.shouldTabar_jump = [RACSubject subject];
        
        
    }
    return self;
}
@end
