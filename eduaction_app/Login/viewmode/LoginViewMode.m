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
- (RACCommand *)subscribeCommand_loginbtn {
    if (!_subscribeCommand_loginbtn) {
           @weakify(self);
        _subscribeCommand_loginbtn = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                if (self.loginview_mobile.length == 0) {
                    
                    [subscriber sendNext:@{@"msg":@"用户名不能为空"}];
                    [subscriber sendCompleted];
                }
                else if (self.loginview_password.length == 0){
                    [subscriber sendNext:@{@"msg":@"密码不能为空"}];
                    [subscriber sendCompleted];
                }
                [subscriber sendNext:@{@"msg":@"登录中"}];
                return nil;
            }];
            
        }];
    }
    return _subscribeCommand_loginbtn;
}
@end
