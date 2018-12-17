//
//  noticeSubjectmanager.h
//  eduaction_app
//
//  Created by legendlxd on 2018/11/19.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface noticeSubjectmanager : NSObject
@property(nonatomic,strong)RACSubject *shouldTabar_jump;
@property(nonatomic,strong)RACSubject *shouldTabar_jump2;
+(noticeSubjectmanager *)sharenoticeSubjectmanager;

@end

NS_ASSUME_NONNULL_END
