//
//  courseVMode.m
//  eduaction_app
//
//  Created by legendlxd on 2018/12/23.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "courseVMode.h"

@implementation courseVMode
- (RACCommand *)kindoftrainReqCommand{
    
    if (!_kindoftrainReqCommand) {
        _kindoftrainReqCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            
          return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                NSString *state = @"";
                
                if (input[@"state"] != nil) {
                    
                    state = input[@"state"];
                }
                NSURLSessionDataTask *task = [[myNetworkManager sharemyNetworkManager] queryPeixunban:state Andsuccess:^(id  _Nonnull response) {
                    
                    
                    commResBaseClass *mode = [[commResBaseClass alloc]initWithDictionary:response];
                    [subscriber sendNext:mode];
                    [subscriber sendCompleted];
                    
                } Andfailure:^(NSError * _Nonnull err) {
                    
                    [subscriber sendCompleted];
                }];
                
                
                return nil;
                
            }];
            
        }];
    }
    return _kindoftrainReqCommand;
}
-(RACCommand *)queryKemuByPeixunbanIdCommand{
    if (!_queryKemuByPeixunbanIdCommand) {
        _queryKemuByPeixunbanIdCommand =[[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            
            
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                
                NSString *peixunbanId =@"";
                if (input[@"peixunbanId"] != nil) {
                    peixunbanId = input[@"peixunbanId"];
                }
                [[myNetworkManager sharemyNetworkManager] queryKemuByPeixunbanId:peixunbanId Andsuccess:^(id  _Nonnull response) {
                    
                    commResBaseClass *mode = [[commResBaseClass alloc]initWithDictionary:response];
                    [subscriber sendNext:mode];
                    [subscriber sendCompleted];
                    
                } Andfailure:^(NSError * _Nonnull err) {
                    
                      [subscriber sendCompleted];
                    
                }];
                
                
                return nil;
            }];
            
        }];
        
    }
    return _queryKemuByPeixunbanIdCommand;
}
- (RACCommand *)dataReqCommand {
    if (!_dataReqCommand) {
        
        _dataReqCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            //@strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                
   
            NSString *kechengTypeId = @"";
            NSInteger page = 0;
            if (input[@"kechengTypeId"] != nil) {
                kechengTypeId = [NSString stringWithFormat:@"%@",input[@"kechengTypeId"]];
            }
            if (input[@"page"] != nil) {
                page = [input[@"page"]integerValue];
            }
            
           
            NSURLSessionDataTask *task = [[myNetworkManager sharemyNetworkManager] queryKechengListAndfreeType:@"" AndqueryStartTime:@"" AndkechengName:@"" Andpage:page AndkechengTypeId:kechengTypeId AndqueryEndTime:@"" Andsuccess:^(id  _Nonnull response) {
                
                commResBaseClass *mode = [[commResBaseClass alloc]initWithDictionary:response];
                [subscriber sendNext:mode];
                [subscriber sendCompleted];
                
                
                } Andfailure:^(NSError * _Nonnull err) {
                    
                [subscriber sendCompleted];
                    
                }];
                
                
            
                
                
                
                
                
                
                return nil;
            }];
            
        }];
    }
    return _dataReqCommand;
}
-(RACCommand *)kemulistReqCommand{
    if (!_kemulistReqCommand) {
        _kemulistReqCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                
                NSString *kemucode = @"";
                NSInteger page = 0;
                if (input[@"kemuId"] != nil) {
                    
                    kemucode = input[@"kemuId"];
                }
                if (input[@"page"] != nil) {
                    page = [input[@"page"]integerValue];
                }
                
                [[myNetworkManager sharemyNetworkManager] queryKechengByKemuId:kemucode Andpage:page Andsuccess:^(id  _Nonnull response) {
                    
                    commResBaseClass *mode = [[commResBaseClass alloc]initWithDictionary:response];
                    [subscriber sendNext:mode];
                    [subscriber sendCompleted];
                    
                } Andfailure:^(NSError * _Nonnull err) {
                    
                    [subscriber sendCompleted];
                }];
                
                
                
                
                 return nil;
            }];
                 
           
        }];
    }
    return _kemulistReqCommand;
}
@end
