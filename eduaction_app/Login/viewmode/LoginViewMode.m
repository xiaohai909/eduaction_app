//
//  LoginViewMode.m
//  eduaction_app
//
//  Created by legendlxd on 2018/10/29.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "LoginViewMode.h"
#include <time.h>
@implementation LoginViewMode

- (id)init {
    self = [super init];
    if (self) {
        [self mapSubscribeCommandStateToStatusMessage];
    }
    return self;
}
- (void)mapSubscribeCommandStateToStatusMessage {
    
}
- (RACCommand *)subscribeCommand_QQ {
    if (!_subscribeCommand_QQ) {
        
        _subscribeCommand_QQ = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                
                [subscriber sendNext:@{@"msg":@"QQ登录中"}];
                [subscriber sendCompleted];
                return nil;
            }];
            
        }];
    }
    return _subscribeCommand_QQ;
}
- (RACCommand *)subscribeCommand_wx {
    if (!_subscribeCommand_wx) {
       
        _subscribeCommand_wx = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
           
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                
                [subscriber sendNext:@{@"msg":@"WX登录中"}];
                [subscriber sendCompleted];
                return nil;
            }];
            
        }];
    }
    return _subscribeCommand_wx;
}
- (RACCommand *)subscribeCommand_regCodebtn{
    if (!_subscribeCommand_regCodebtn) {
        @weakify(self);
        _subscribeCommand_regCodebtn = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                if (self.second_reg > 0) {
                    
                   [subscriber sendCompleted];
                }
                
                
                else if (self.regView_mobile.length == 0) {
                    
                    [subscriber sendNext:[[commResBaseClass alloc]initWithDictionary:@{@"resultMsg":@"电话号码不能为空"}]];
                    [subscriber sendCompleted];
                    
                }
                else{
                   
                    
                    NSURLSessionDataTask *task =  [[myNetworkManager sharemyNetworkManager] sendSms:self.regView_mobile Andsuccess:^(id  _Nonnull response) {
                        
                     
                        DDLogVerbose(@"sendSms == %@",[CommonFunciton dictionaryToJson:response]);
                        
                        [subscriber sendNext:[[commResBaseClass alloc] initWithDictionary:response]];
                        [subscriber sendCompleted];
                        
                        
                        
                    } Andfailure:^(NSError * _Nonnull err) {
                        
                       
                        [subscriber sendCompleted];
                        
                    }];
                }
                
                
                
                
                
                return nil;
            }];
            
        }];
    }
    return _subscribeCommand_regCodebtn;
    
}

- (RACCommand *)subscribeCommand_loginwith_codebtn{
    if (!_subscribeCommand_loginwith_codebtn) {
        @weakify(self);
        _subscribeCommand_loginwith_codebtn = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                if (self.second_login > 0) {
                    
                    [subscriber sendCompleted];
                }
                
                
                else if (self.loginwithcode_mobile.length == 0) {
                    
                    [subscriber sendNext:[[commResBaseClass alloc]initWithDictionary:@{@"resultMsg":@"电话号码不能为空"}]];
                    [subscriber sendCompleted];
                    
                }
                else{
                    
                    
                    NSURLSessionDataTask *task =  [[myNetworkManager sharemyNetworkManager] sendSms2:self.loginwithcode_mobile Andsuccess:^(id  _Nonnull response) {
                        
                        
                        DDLogVerbose(@"sendSms2 == %@",[CommonFunciton dictionaryToJson:response]);
                        
                        [subscriber sendNext:[[commResBaseClass alloc] initWithDictionary:response]];
                        [subscriber sendCompleted];
                        
                        
                        
                    } Andfailure:^(NSError * _Nonnull err) {
                        
                        
                        [subscriber sendCompleted];
                        
                    }];
                }
                
                
                
                
                
                return nil;
            }];
            
        }];
    }
    return _subscribeCommand_loginwith_codebtn;
    
}
- (RACCommand *)subscribeCommand_forgetpassowrd_codebtn{
    if (!_subscribeCommand_forgetpassowrd_codebtn) {
        @weakify(self);
        _subscribeCommand_forgetpassowrd_codebtn = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                if (self.second_password > 0) {
                    
                    [subscriber sendCompleted];
                }
                
                
                else if (self.forget_mobile.length == 0) {
                    
                    [subscriber sendNext:[[commResBaseClass alloc]initWithDictionary:@{@"resultMsg":@"电话号码不能为空"}]];
                    [subscriber sendCompleted];
                    
                }
                else{
                    
                    
                    NSURLSessionDataTask *task =  [[myNetworkManager sharemyNetworkManager] sendSms2:self.forget_mobile Andsuccess:^(id  _Nonnull response) {
                        
                        
                        DDLogVerbose(@"sendSms2 == %@",[CommonFunciton dictionaryToJson:response]);
                        
                        [subscriber sendNext:[[commResBaseClass alloc] initWithDictionary:response]];
                        [subscriber sendCompleted];
                        
                        
                        
                    } Andfailure:^(NSError * _Nonnull err) {
                        
                        
                        [subscriber sendCompleted];
                        
                    }];
                }
                
                
                
                
                
                return nil;
            }];
            
        }];
    }
    return _subscribeCommand_forgetpassowrd_codebtn;
    
}
- (RACCommand *)subscribeCommand_loginwithcode {
    if (!_subscribeCommand_loginwithcode) {
        @weakify(self);
        _subscribeCommand_loginwithcode = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                
                
                if (self.loginwithcode_mobile.length == 0) {
                    
                    [subscriber sendNext:[[commResBaseClass alloc]initWithDictionary:@{@"resultMsg":@"用户名不能为空"}]];
                    [subscriber sendCompleted];
                    
                }
                else if (self.loginwithcode_code.length == 0){
                    
                    [subscriber sendNext:[[commResBaseClass alloc]initWithDictionary:@{@"resultMsg":@"请输入验证码"}]];
                    [subscriber sendCompleted];
                    
                }
                
                else{
                    UIView *view = [CommonFunciton theTopviewControler].view;
                    
                    [[GWProgressHUB sharedYGGWProgressHUB] YGShowHUB_WithReturn:view AndMsg:@"登录中"];
                    
                    NSURLSessionDataTask *task =  [[myNetworkManager sharemyNetworkManager] loginSms:self.loginwithcode_mobile AndsmsTxt:self.loginwithcode_code Andsuccess:^(id  _Nonnull response) {
                        
                        [[GWProgressHUB sharedYGGWProgressHUB] YGDismiss:view];
                        DDLogVerbose(@"loginSms == %@",[CommonFunciton dictionaryToJson:response]);
                        [subscriber sendNext:[[commResBaseClass alloc] initWithDictionary:response]];
                        [subscriber sendCompleted];
                        
                        
                        
                    } Andfailure:^(NSError * _Nonnull err) {
                        
                        [[GWProgressHUB sharedYGGWProgressHUB] YGDismiss:view];
                        [subscriber sendCompleted];
                        
                    }];
                }
                
                
                
                
                
                return nil;
            }];
            
        }];
    }
    return _subscribeCommand_loginwithcode;
}
- (RACCommand *)subscribeCommand_loginbtn {
    if (!_subscribeCommand_loginbtn) {
           @weakify(self);
        _subscribeCommand_loginbtn = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
               
                
                if (self.loginview_mobile.length == 0) {
                   
                    [subscriber sendNext:[[commResBaseClass alloc]initWithDictionary:@{@"resultMsg":@"用户名不能为空"}]];
                    [subscriber sendCompleted];
                  
                }
                else if (self.loginview_password.length == 0){
                   
                    [subscriber sendNext:[[commResBaseClass alloc]initWithDictionary:@{@"resultMsg":@"密码不能为空"}]];
                    [subscriber sendCompleted];
                    
                }

                else{
                    UIView *view = [CommonFunciton theTopviewControler].view;
                    
                    [[GWProgressHUB sharedYGGWProgressHUB] YGShowHUB_WithReturn:view AndMsg:@"登录中"];
                    
                    NSURLSessionDataTask *task =  [[myNetworkManager sharemyNetworkManager] loginAuth:self.loginview_mobile Andpassword:self.loginview_password Andsuccess:^(id  _Nonnull response) {
                        
                        [[GWProgressHUB sharedYGGWProgressHUB] YGDismiss:view];
                        DDLogVerbose(@"loginAuth == %@",[CommonFunciton dictionaryToJson:response]);
                        [subscriber sendNext:[[commResBaseClass alloc] initWithDictionary:response]];
                        [subscriber sendCompleted];
                        
       
                        
                    } Andfailure:^(NSError * _Nonnull err) {
                        
                        [[GWProgressHUB sharedYGGWProgressHUB] YGDismiss:view];
                        [subscriber sendCompleted];
                        
                    }];
                }
                
                
                
                

                return nil;
            }];
            
        }];
    }
    return _subscribeCommand_loginbtn;
}
- (RACCommand *)subscribeCommand_forgetpassowrd_reset {
    if (!_subscribeCommand_forgetpassowrd_reset) {
        @weakify(self);
        _subscribeCommand_forgetpassowrd_reset = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                
                
                if (self.forget_mobile.length == 0) {
                    
                    [subscriber sendNext:[[commResBaseClass alloc]initWithDictionary:@{@"resultMsg":@"用户名不能为空"}]];
                    [subscriber sendCompleted];
                    
                }
                else if (self.forget_password.length == 0){
                    
                    [subscriber sendNext:[[commResBaseClass alloc]initWithDictionary:@{@"resultMsg":@"密码不能为空"}]];
                    [subscriber sendCompleted];
                    
                }
                else if (self.forget_password_again.length == 0 || ![self.forget_password isEqualToString:self.forget_password_again]){
                    
                    [subscriber sendNext:[[commResBaseClass alloc]initWithDictionary:@{@"resultMsg":@"两次输入的密码不一致"}]];
                    [subscriber sendCompleted];
                    
                }
                else if (self.forget_smscode.length == 0){
                    
                    [subscriber sendNext:[[commResBaseClass alloc]initWithDictionary:@{@"resultMsg":@"请输入验证码"}]];
                    [subscriber sendCompleted];
                    
                }
                else{
                    UIView *view = [CommonFunciton theTopviewControler].view;
                    
                    [[GWProgressHUB sharedYGGWProgressHUB] YGShowHUB_WithReturn:view AndMsg:@""];
                    
                    NSURLSessionDataTask *task =  [[myNetworkManager sharemyNetworkManager] resetUserPwd:self.forget_mobile AndnewPassword:self.forget_password AndsmsTxt:self.forget_smscode Andsuccess:^(id  _Nonnull response) {
                        
                        [[GWProgressHUB sharedYGGWProgressHUB] YGDismiss:view];
                        DDLogVerbose(@"resetUserPwd == %@",[CommonFunciton dictionaryToJson:response]);
                        [subscriber sendNext:[[commResBaseClass alloc] initWithDictionary:response]];
                        [subscriber sendCompleted];
                        
                        
                        
                    } Andfailure:^(NSError * _Nonnull err) {
                        
                        [[GWProgressHUB sharedYGGWProgressHUB] YGDismiss:view];
                        [subscriber sendCompleted];
                        
                    }];
                }
                
                
                
                
                
                return nil;
            }];
            
        }];
    }
    return _subscribeCommand_forgetpassowrd_reset;
}
- (RACCommand *)subscribeCommand_regGo {
    if (!_subscribeCommand_regGo) {
        @weakify(self);
        _subscribeCommand_regGo = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                
                
                if (self.regView_mobile.length == 0) {
                    
                    [subscriber sendNext:[[commResBaseClass alloc]initWithDictionary:@{@"resultMsg":@"用户名不能为空"}]];
                    [subscriber sendCompleted];
                    
                }
                else if (self.regView_password.length == 0){
                    
                    [subscriber sendNext:[[commResBaseClass alloc]initWithDictionary:@{@"resultMsg":@"密码不能为空"}]];
                    [subscriber sendCompleted];
                    
                }
                else if (self.regView_password_again.length == 0 || ![self.regView_password isEqualToString:self.regView_password_again]){
                    
                    [subscriber sendNext:[[commResBaseClass alloc]initWithDictionary:@{@"resultMsg":@"两次输入的密码不一致"}]];
                    [subscriber sendCompleted];
                    
                }
                else if (self.smscode.length == 0){
                    [subscriber sendNext:[[commResBaseClass alloc]initWithDictionary:@{@"resultMsg":@"验证码不能为空"}]];
                    [subscriber sendCompleted];
                }
                else if (!self.eulaselect){
                    [subscriber sendNext:[[commResBaseClass alloc]initWithDictionary:@{@"resultMsg":@"请同意注册协议"}]];
                    [subscriber sendCompleted];
                }
                
                else{
                    UIView *view = [CommonFunciton theTopviewControler].view;
                    
                    [[GWProgressHUB sharedYGGWProgressHUB] YGShowHUB_WithReturn:view AndMsg:@"注册中"];
                    
                    NSURLSessionDataTask *task = [[myNetworkManager sharemyNetworkManager] regedit:self.regView_mobile Andpassword:self.regView_password AndactivationCode:self.regView_inviteCode AndsmsTxt:self.smscode Andsuccess:^(id  _Nonnull response) {
                        
                        [[GWProgressHUB sharedYGGWProgressHUB] YGDismiss:view];
                        DDLogVerbose(@"regedit == %@",[CommonFunciton dictionaryToJson:response]);
                        [subscriber sendNext:[[commResBaseClass alloc] initWithDictionary:response]];
                        [subscriber sendCompleted];
                        
                    } Andfailure:^(NSError * _Nonnull err) {
                        
                        [[GWProgressHUB sharedYGGWProgressHUB] YGDismiss:view];
                        [subscriber sendCompleted];
                    }];
                    
                }
                
                
                
                
                
                return nil;
            }];
            
        }];
    }
    return _subscribeCommand_regGo;
}
-(void)cancelTimeer:(codereqtype)type{
    
    switch (type) {
        case 1:
        {
            if(_timer_reg){
                 dispatch_source_cancel(_timer_reg);
            }
        }
            break;
            
        case 2:
        {
            if(_timer_login){
                dispatch_source_cancel(_timer_login);
            }
        }
            break;
        case 3:
        {
            if(_timer_password){
                dispatch_source_cancel(_timer_password);
            }
        }
            break;
        default:
            break;
    }
}
-(void)GWCountdown:(codereqtype)type andsecond:(NSInteger)second andblock:(void(^)(NSInteger second))block{
    
    if (type == for_reg) {
        
        if (!_queue_reg) {
            _queue_reg = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        }
        if (_timer_reg) {
            
            dispatch_source_cancel(_timer_reg);
        }
        _second_reg = second;
        _timer_reg = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, _queue_reg);
        
        dispatch_source_set_timer(_timer_reg, dispatch_walltime(NULL, 0), NSEC_PER_SEC * 1.0f, 0);
        dispatch_source_set_event_handler(_timer_reg, ^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                DDLogVerbose(@"CountDown %@",@(_second_reg));
                if (_second_reg > 0)
                {

                     _second_reg--;
                    
                }else
                {
                    _second_reg = 0;
                    dispatch_source_cancel(_timer_reg);
                   
                }
                block(_second_reg);
                
            });
        });
        dispatch_resume(_timer_reg);
    }
    else if (type == for_login) {
        if (!_queue_login) {
            _queue_login = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        }
        if (_timer_login) {
            
            dispatch_source_cancel(_timer_login);
        }
        _second_login = second;
        _timer_login = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, _queue_login);
        
        dispatch_source_set_timer(_timer_login, dispatch_walltime(NULL, 0), NSEC_PER_SEC * 1.0f, 0);
        dispatch_source_set_event_handler(_timer_login, ^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                DDLogVerbose(@"CountDown %@",@(_second_login));
                if (_second_login > 0)
                {
                    
                    _second_login--;
                    
                }else
                {
                    _second_login = 0;
                    dispatch_source_cancel(_timer_login);
                    
                }
                block(_second_login);
            });
        });
        dispatch_resume(_timer_login);
    }
    else if (type == for_password) {
        if (!_queue_password) {
            _queue_password = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        }
        if (_timer_password) {
            
            dispatch_source_cancel(_timer_password);
        }
        _second_password = second;
        _timer_password = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, _queue_password);
        
        dispatch_source_set_timer(_timer_password, dispatch_walltime(NULL, 0), NSEC_PER_SEC * 1.0f, 0);
        dispatch_source_set_event_handler(_timer_password, ^{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                DDLogVerbose(@"CountDown %@",@(_second_password));
                if (_second_password > 0)
                {
                    
                    _second_password--;
                    
                }else
                {
                    _second_password = 0;
                    dispatch_source_cancel(_timer_password);
                    
                }
                block(_second_password);
            });
        });
        dispatch_resume(_timer_password);
        
    }
    
}
-(void)dealloc{
    
}
@end
