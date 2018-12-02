//
//  LoginViewMode.m
//  eduaction_app
//
//  Created by legendlxd on 2018/10/29.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "LoginViewMode.h"

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
                
                
                
                if (self.regView_mobile.length == 0) {
                    
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
                
                else{
                    UIView *view = [CommonFunciton theTopviewControler].view;
                    
                    [[GWProgressHUB sharedYGGWProgressHUB] YGShowHUB_WithReturn:view AndMsg:@"注册中"];
                    
                    NSURLSessionDataTask *task = [[myNetworkManager sharemyNetworkManager] regedit:self.regView_mobile Andpassword:self.regView_password AndactivationCode:self.regView_inviteCode Andsuccess:^(id  _Nonnull response) {
                        
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
@end
