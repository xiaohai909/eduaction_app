//
//  SQNetworkInterface.m
//  eduaction_app
//
//  Created by Mac on 2018/11/28.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "SQNetworkInterface.h"
#import "SQNetworkManager.h"

#define smt_request_url(__APIURL__) [severAddress stringByAppendingString:__APIURL__]

@implementation SQNetworkInterface
+(NSMutableDictionary *)params:(NSMutableDictionary *)params{
    
    static NSDateFormatter *timeformat;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timeformat =[[NSDateFormatter alloc]init];
        [timeformat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    });
    NSDate *nowDate = [[NSDate alloc]init];
    NSString *timeStamp = [timeformat stringFromDate:nowDate];
    
    NSMutableDictionary *dic =[[NSMutableDictionary alloc]init];
    [dic setObject:appId forKey:@"appId"];
    [dic setObject:timeStamp forKey:@"timeStamp"];
    [dic setObject:params forKey:@"params"];
    [dic setObject:@"209EB1A4-8032-B81E-7620-90B5D3157135" forKey:@"sessionId"];
    return dic;
}

+ (NSDateFormatter *)formatter
{
    static NSDateFormatter *formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    });
    return formatter;
}
+ (NSString *)nowTime
{
    return [[SQNetworkInterface formatter] stringFromDate:[NSDate date]];
}

+ (void)iRequestChapterCleanParames:(NSMutableDictionary *)parames andResult:(blockResult)result
{
    parames = [SQNetworkInterface params:parames];
    [parames setObject:@"question" forKey:@"type"];
    [parames setObject:@"emptyAnswer" forKey:@"method"];
    
    [SQNetworkManager sessionrequestUrl:smt_request_url(@"mobile/line/api?3=1") andShowError:YES andParams:parames andType:HttpMethodPost andRefreshData:YES andResult:^(NSInteger state, NSString * _Nonnull msg, NSString * _Nonnull total, id  _Nonnull resultData) {
        result(state,msg,total,resultData);
    }];
}


+ (void)iRequestChapterMainParames:(NSMutableDictionary *)parames andResult:(blockResult)result
{
    parames = [SQNetworkInterface params:parames];
    [parames setObject:@"question" forKey:@"type"];
    [parames setObject:@"GetKmAllData" forKey:@"method"];
    
    [SQNetworkManager sessionrequestUrl:smt_request_url(@"mobile/line/api?4=2") andShowError:YES andParams:parames andType:HttpMethodPost andRefreshData:YES andResult:^(NSInteger state, NSString * _Nonnull msg, NSString * _Nonnull total, id  _Nonnull resultData) {
        result(state,msg,total,resultData);
    }];
}
+ (void)iRequestChapterListParames:(NSMutableDictionary *)parames andResult:(blockResult)result
{
    parames = [SQNetworkInterface params:parames];
    [parames setObject:@"question" forKey:@"type"];
    [parames setObject:@"GetSecontKmList" forKey:@"method"];
    
    [SQNetworkManager sessionrequestUrl:smt_request_url(@"mobile/line/api?3=1") andShowError:YES andParams:parames andType:HttpMethodPost andRefreshData:YES andResult:^(NSInteger state, NSString * _Nonnull msg, NSString * _Nonnull total, id  _Nonnull resultData) {
        result(state,msg,total,resultData);
    }];
}
+ (void)iRequestChapterScoreParames:(NSMutableDictionary *)parames andResult:(blockResult)result
{
    parames = [SQNetworkInterface params:parames];
    [parames setObject:@"question" forKey:@"type"];
    [parames setObject:@"queryScore" forKey:@"method"];
    
    [SQNetworkManager sessionrequestUrl:smt_request_url(@"mobile/line/api?3=2") andShowError:YES andParams:parames andType:HttpMethodPost andRefreshData:YES andResult:^(NSInteger state, NSString * _Nonnull msg, NSString * _Nonnull total, id  _Nonnull resultData) {
        result(state,msg,total,resultData);
    }];
}
+ (void)iRequestChapterRedoParames:(NSMutableDictionary *)parames andResult:(blockResult)result
{
    parames = [SQNetworkInterface params:parames];
    [parames setObject:@"question" forKey:@"type"];
    [parames setObject:@"emptyAnswerByQuestionHouse" forKey:@"method"];
    
    [SQNetworkManager sessionrequestUrl:smt_request_url(@"mobile/line/api?3=4") andShowError:YES andParams:parames andType:HttpMethodPost andRefreshData:YES andResult:^(NSInteger state, NSString * _Nonnull msg, NSString * _Nonnull total, id  _Nonnull resultData) {
        result(state,msg,total,resultData);
    }];
}



+ (void)iRequestChapterScoreDetailListParames:(NSMutableDictionary *)parames andResult:(blockResult)result
{
    parames = [SQNetworkInterface params:parames];
    [parames setObject:@"question" forKey:@"type"];
    [parames setObject:@"coreDetails" forKey:@"method"];
    
    [SQNetworkManager sessionrequestUrl:smt_request_url(@"mobile/line/api?3=3") andShowError:YES andParams:parames andType:HttpMethodPost andRefreshData:YES andResult:^(NSInteger state, NSString * _Nonnull msg, NSString * _Nonnull total, id  _Nonnull resultData) {
        result(state,msg,total,resultData);
    }];
}
+ (void)iRequestChapterCollectionDeleteParames:(NSMutableDictionary *)parames andResult:(blockResult)result
{
    parames = [SQNetworkInterface params:parames];
    [parames setObject:@"question" forKey:@"type"];
    [parames setObject:@"deleteCollection" forKey:@"method"];
    
    [SQNetworkManager sessionrequestUrl:smt_request_url(@"mobile/line/api?3=5") andShowError:YES andParams:parames andType:HttpMethodPost andRefreshData:YES andResult:^(NSInteger state, NSString * _Nonnull msg, NSString * _Nonnull total, id  _Nonnull resultData) {
        result(state,msg,total,resultData);
    }];
}
+ (void)iRequestChapterNotesDeleteParames:(NSMutableDictionary *)parames andResult:(blockResult)result
{
    parames = [SQNetworkInterface params:parames];
    [parames setObject:@"question" forKey:@"type"];
    [parames setObject:@"deleteNotes" forKey:@"method"];
    
    [SQNetworkManager sessionrequestUrl:smt_request_url(@"mobile/line/api?3=6") andShowError:YES andParams:parames andType:HttpMethodPost andRefreshData:YES andResult:^(NSInteger state, NSString * _Nonnull msg, NSString * _Nonnull total, id  _Nonnull resultData) {
        result(state,msg,total,resultData);
    }];
}

#pragma mark -- make Problem
+ (void)iRequestMakeProblemParames:(NSMutableDictionary *)parames andResult:(blockResult)result//获取题目
{
    parames = [SQNetworkInterface params:parames];
    [parames setObject:@"question" forKey:@"type"];
    [parames setObject:@"getQuestionAll" forKey:@"method"];
    
    [SQNetworkManager sessionrequestUrl:smt_request_url(@"mobile/line/api?3=7") andShowError:YES andParams:parames andType:HttpMethodPost andRefreshData:YES andResult:^(NSInteger state, NSString * _Nonnull msg, NSString * _Nonnull total, id  _Nonnull resultData) {
        result(state,msg,total,resultData);
    }];
}
//notes笔记，answer修改答案，correct做题正确与否，answerTime做题时间，discussTime修改时间，collection收藏，discuss评论
+ (void)iRequestMakeProblemMakeParames:(NSMutableDictionary *)parames andResult:(blockResult)result//获取题目
{//"questionId": 583,"userId": 2, 必传的参数
    parames = [SQNetworkInterface params:parames];
    [parames setObject:@"question" forKey:@"type"];
    [parames setObject:@"answerSaveOrUpdate" forKey:@"method"];
    
    [SQNetworkManager sessionrequestUrl:smt_request_url(@"mobile/line/api?4=9") andShowError:YES andParams:parames andType:HttpMethodPost andRefreshData:YES andResult:^(NSInteger state, NSString * _Nonnull msg, NSString * _Nonnull total, id  _Nonnull resultData) {
        result(state,msg,total,resultData);
    }];
}

#pragma mark -- 巩固
+ (void)iRequestConsolidateCollectionParames:(NSMutableDictionary *)parames andResult:(blockResult)result
{
    parames = [SQNetworkInterface params:parames];
    [parames setObject:@"question" forKey:@"type"];
    [parames setObject:@"answerCollectionList" forKey:@"method"];
    
    [SQNetworkManager sessionrequestUrl:smt_request_url(@"mobile/line/api?2=4") andShowError:YES andParams:parames andType:HttpMethodPost andRefreshData:YES andResult:^(NSInteger state, NSString * _Nonnull msg, NSString * _Nonnull total, id  _Nonnull resultData) {
        result(state,msg,total,resultData);
    }];
}
+ (void)iRequestConsolidateNotesParames:(NSMutableDictionary *)parames andResult:(blockResult)result
{
    parames = [SQNetworkInterface params:parames];
    [parames setObject:@"question" forKey:@"type"];
    [parames setObject:@"answerNotesList" forKey:@"method"];
    
    [SQNetworkManager sessionrequestUrl:smt_request_url(@"mobile/line/api?2=3") andShowError:YES andParams:parames andType:HttpMethodPost andRefreshData:YES andResult:^(NSInteger state, NSString * _Nonnull msg, NSString * _Nonnull total, id  _Nonnull resultData) {
        result(state,msg,total,resultData);
    }];
}
//+ (void)iRequestConsolidateEasyWrongParames:(NSMutableDictionary *)parames andResult:(blockResult)result;

+ (void)iRequestConsolidateHotParames:(NSMutableDictionary *)parames andResult:(blockResult)result
{
    parames = [SQNetworkInterface params:parames];
    [parames setObject:@"question" forKey:@"type"];
    [parames setObject:@"questionHotList" forKey:@"method"];
    
    [SQNetworkManager sessionrequestUrl:smt_request_url(@"mobile/line/api?2=1") andShowError:YES andParams:parames andType:HttpMethodPost andRefreshData:YES andResult:^(NSInteger state, NSString * _Nonnull msg, NSString * _Nonnull total, id  _Nonnull resultData) {
        result(state,msg,total,resultData);
    }];
}
+ (void)iRequestConsolidateMyWrongParames:(NSMutableDictionary *)parames andResult:(blockResult)result
{
    parames = [SQNetworkInterface params:parames];
    [parames setObject:@"question" forKey:@"type"];
    [parames setObject:@"answerWrongList" forKey:@"method"];
    
    [SQNetworkManager sessionrequestUrl:smt_request_url(@"mobile/line/api?2=2") andShowError:YES andParams:parames andType:HttpMethodPost andRefreshData:YES andResult:^(NSInteger state, NSString * _Nonnull msg, NSString * _Nonnull total, id  _Nonnull resultData) {
        result(state,msg,total,resultData);
    }];
}
//+ (void)iRequestConsolidateScoreParames:(NSMutableDictionary *)parames andResult:(blockResult)result;
@end
