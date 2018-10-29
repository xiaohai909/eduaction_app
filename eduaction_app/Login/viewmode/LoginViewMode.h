//
//  LoginViewMode.h
//  eduaction_app
//
//  Created by legendlxd on 2018/10/29.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewMode : NSObject
@property(nonatomic, strong) RACCommand *subscribeCommand_loginbtn;

@property(nonatomic, strong) RACCommand *subscribeCommand_QQ;
@property(nonatomic, strong) RACCommand *subscribeCommand_wx;

@property(nonatomic, strong) NSString *loginview_mobile;

@property(nonatomic, strong) NSString *loginview_password;

@end

NS_ASSUME_NONNULL_END
