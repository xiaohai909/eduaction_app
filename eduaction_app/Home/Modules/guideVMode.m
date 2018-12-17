//
//  guideVMode.m
//  eduaction_app
//
//  Created by legendlxd on 2018/12/17.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "guideVMode.h"

@implementation guideVMode
- (RACCommand *)headerReq {
    if (!_headerReq) {
        @weakify(self);
        _headerReq = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
         
                
                    
                NSURLSessionDataTask *task = [[myNetworkManager sharemyNetworkManager] queryGuideAllTypeAndsuccess:^(id  _Nonnull response) {
                    
                    DDLogVerbose(@"queryGuideAllType %@",[CommonFunciton dictionaryToJson:response]);
                    [subscriber sendNext:[[testGuideReqModeBaseClass alloc] initWithDictionary:response]];
                    [subscriber sendCompleted];
                    
                } Andfailure:^(NSError * _Nonnull err) {
                    
                    [subscriber sendCompleted];
                    
                }];
                
                
                
                
                
                
                return nil;
            }];
            
        }];
    }
    return _headerReq;
}
@end
