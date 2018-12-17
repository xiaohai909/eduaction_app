//
//  LoginViewMode.h
//  eduaction_app
//
//  Created by legendlxd on 2018/10/29.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger, codereqtype){
    for_reg = 1,
    for_login = 2,
    for_password = 3
};
NS_ASSUME_NONNULL_BEGIN

@interface LoginViewMode : NSObject
@property(nonatomic, strong) RACCommand *subscribeCommand_loginbtn;
@property(nonatomic, strong) RACCommand *subscribeCommand_QQ;
@property(nonatomic, strong) RACCommand *subscribeCommand_wx;

@property(nonatomic, strong) RACCommand *subscribeCommand_regCodebtn;
@property(nonatomic, strong) RACCommand *subscribeCommand_regGo;

@property(nonatomic, strong) RACCommand *subscribeCommand_loginwithcode;
@property(nonatomic, strong) RACCommand *subscribeCommand_loginwith_codebtn;

@property(nonatomic, strong) RACCommand *subscribeCommand_forgetpassowrd_reset;
@property(nonatomic, strong) RACCommand *subscribeCommand_forgetpassowrd_codebtn;

@property(nonatomic, strong) NSString *loginview_mobile;
@property(nonatomic, strong) NSString *loginview_password;
@property(nonatomic, assign) BOOL eulaselect;
@property(nonatomic, strong) NSString *regView_mobile;
@property(nonatomic, strong) NSString *regView_password;
@property(nonatomic, strong) NSString *regView_password_again;
@property(nonatomic, strong) NSString *smscode;
@property(nonatomic, strong) NSString *regView_inviteCode;

@property(nonatomic, strong) NSString *loginwithcode_mobile;
@property(nonatomic, strong) NSString *loginwithcode_code;

@property(nonatomic, strong) NSString *forget_mobile;
@property(nonatomic, strong) NSString *forget_password;
@property(nonatomic, strong) NSString *forget_password_again;
@property(nonatomic, strong) NSString *forget_smscode;


@property (nonatomic, assign) dispatch_queue_t queue_reg;
@property (nonatomic, strong) dispatch_source_t timer_reg;
@property (nonatomic, assign) NSInteger second_reg;

@property (nonatomic, assign) dispatch_queue_t queue_login;
@property (nonatomic, strong) dispatch_source_t timer_login;
@property (nonatomic, assign) NSInteger second_login;

@property (nonatomic, assign) dispatch_queue_t queue_password;
@property (nonatomic, strong) dispatch_source_t timer_password;
@property (nonatomic, assign) NSInteger second_password;


-(void)cancelTimeer:(codereqtype)type;
-(void)GWCountdown:(codereqtype)type andsecond:(NSInteger)second andblock:(void(^)(NSInteger second))block;

@end

NS_ASSUME_NONNULL_END
