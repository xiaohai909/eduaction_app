//
//  myNetworkManager.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/18.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "myNetworkManager.h"
#import "AFNetworkReachabilityManager.h"
#import "AFNetworking-umbrella.h"

@implementation myNetworkManager
{
    AFNetworkReachabilityManager *network_manager;
}
+(myNetworkManager *)sharemyNetworkManager
{
    
    static myNetworkManager * Mangager = nil;
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
        
        network_manager = [AFNetworkReachabilityManager sharedManager];
        [network_manager startMonitoring];
        
        [network_manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            
            if (status == AFNetworkReachabilityStatusUnknown) {
                DDLogVerbose(@"AFNetworkReachabilityStatusUnknown");
            }
            else if (status == AFNetworkReachabilityStatusNotReachable){
                DDLogVerbose(@"AFNetworkReachabilityStatusNotReachable");
            }
            else if (status == AFNetworkReachabilityStatusReachableViaWWAN){
                DDLogVerbose(@"AFNetworkReachabilityStatusReachableViaWWAN");
            }
            else if (status == AFNetworkReachabilityStatusReachableViaWiFi){
                 DDLogVerbose(@"AFNetworkReachabilityStatusReachableViaWiFi");
            }
            
        }];
        
        
    }
    return self;
}
-(NSMutableDictionary *)commParam:(NSString *)method Andparams:(NSMutableDictionary *)params{
    
    NSDate *nowDate = [[NSDate alloc]init];
    NSDateFormatter *timeformat =[[NSDateFormatter alloc]init];
    [timeformat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *timeStamp = [timeformat stringFromDate:nowDate];
    
    NSMutableDictionary *dic =[[NSMutableDictionary alloc]init];
    [dic setObject:appId forKey:@"appId"];
    [dic setObject:method forKey:@"method"];
    [dic setObject:timeStamp forKey:@"timeStamp"];
    [dic setObject:params forKey:@"params"];
    [dic setObject:@"sessionId" forKey:@"sessionId"];
    return dic;
    
}
-(NSURLSessionDataTask *)regedit:(NSString *)account Andpassword:(NSString *)password AndactivationCode:(NSString *)activationCode Andsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure{

    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:account forKey:@"account"];
    [dic setObject:password forKey:@"password"];
    [dic setObject:activationCode forKey:@"activationCode"];
    NSMutableDictionary *dic2 = [self commParam:@"regedit" Andparams:dic];

    NSString *json = [CommonFunciton dictionaryToJson:dic2];
    
    NSURLSessionDataTask *task =[self MyRequestWithMethod:RequestMethodTypePost url:@"mobile/line/api" isUploadImage:NO params:dic2 success:success failure:failure];
    
    return task;
}
- (NSURLSessionDataTask *)MyRequestWithMethod:(RequestMethodType)methodType
                        url:(NSString*)url
              isUploadImage:(BOOL )is_Image
                     params:(id )params
                    success:(void (^)(id response))success
                    failure:(void (^)(NSError* err))failure
{
    NSURL* baseURL = [NSURL URLWithString:severAddress];
    
    
    AFHTTPSessionManager *mgr=[[AFHTTPSessionManager alloc]initWithBaseURL:baseURL];
    //mgr.responseSerializer=[AFJSONResponseSerializer serializer];
    //mgr.requestSerializer=[AFHTTPRequestSerializer serializer];
    mgr.requestSerializer.timeoutInterval=10.f;
    
    mgr.requestSerializer = [AFJSONRequestSerializer serializer];
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSMutableSet *Contentsets=[[NSMutableSet alloc]init];
    [Contentsets addObject:ContentType1];
    [Contentsets addObject:ContentType];
    
    mgr.responseSerializer.acceptableContentTypes=Contentsets;
    mgr.requestSerializer.HTTPShouldHandleCookies = YES;
    [mgr setDataTaskDidReceiveDataBlock:^(NSURLSession * _Nonnull session, NSURLSessionDataTask * _Nonnull dataTask, NSData * _Nonnull data) {
        
        
        //NSLog(@"request ====%@ Dic====%@",request,params);
        
        DDLogVerbose(@"url %@ Respone Body===== %@",url,[NSString stringWithUTF8String:[data bytes]]);
        
        
        
    }];
    NSURLSessionDataTask  *task = nil;
    
    
    switch (methodType) {
        case RequestMethodTypeGet:
        {
            task = [mgr GET:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                DDLogVerbose(@"%@===%@",url,responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DDLogVerbose(@"==%@",error);
                //查看http请求响应的状态码
                DDLogVerbose(@"response status code:%@",@([(NSHTTPURLResponse *)task.response statusCode]));
                
                //查看http请求响应的资源大小
                DDLogVerbose(@"response expect length:%lld", [(NSHTTPURLResponse *)task.response expectedContentLength]);
                
                //查看http响应的所有头域
                DDLogVerbose(@"response all headfield:%@",[(NSHTTPURLResponse *)task.response allHeaderFields]);
                failure(error);
            }];
            
            
            
        }
            
            
            
            break;
        case RequestMethodTypePost:{
            
            
            //[self SetHeader:mgr];
            
            DDLogVerbose(@"header====%@", mgr.requestSerializer.HTTPRequestHeaders);
            
            DDLogVerbose(@"request===%@",params);
            if(is_Image){
                NSData *imageData=[[NSData alloc]init];
                if ([params isKindOfClass:[NSDictionary class]]) {
                    imageData=UIImageJPEGRepresentation(params[@"file"],0.5);
                    //NSLog(@"%f",imageData.length/1024.0);
                }
                if(imageData){
                    NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
                    
                    NSDictionary *params_temp = params;
                    
                    for (NSInteger i=0; i<params_temp.allKeys.count; i++) {
                        
                        if(![[NSString stringWithFormat:@"%@",params_temp.allKeys[i]] isEqualToString:@"file"]){
                            
                            [dic setObject:[NSString stringWithFormat:@"%@",params[[NSString stringWithFormat:@"%@",params_temp.allKeys[i]]]] forKey:[NSString stringWithFormat:@"%@",params_temp.allKeys[i]]];
                        }
                    }
                     task =  [mgr POST:url parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
                        [formData appendPartWithFileData:imageData name:@"file" fileName:@"avatarfile.png" mimeType:@"image/png"];
                        
                    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                        success(responseObject);
                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                        failure(error);
                    }];
                    
                }
                else{
                     task =  [mgr POST:url parameters:params  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                        DDLogVerbose(@"%@===%@",url,responseObject);
                        //查看http响应的所有头域
                        //                    NSLog(@"response all headfield %@====:%@",request,[(NSHTTPURLResponse *)task.response allHeaderFields]);
                        
                        success(responseObject);
                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                        DDLogVerbose(@"==%@",error);
                        //查看http请求响应的状态码
                        DDLogVerbose(@"response status code:%@",@([(NSHTTPURLResponse *)task.response statusCode]));
                        
                        //查看http请求响应的资源大小
                        DDLogVerbose(@"response expect length:%lld", [(NSHTTPURLResponse *)task.response expectedContentLength]);
                        
                        //查看http响应的所有头域
                        DDLogVerbose(@"response all headfield:%@",[(NSHTTPURLResponse *)task.response allHeaderFields]);
                        
                        
                        failure(error);
                    }];
                }
                
            }
            
            else{
                 task = [mgr POST:url parameters:params  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    DDLogVerbose(@"%@===%@",url,responseObject);
                    //查看http响应的所有头域
                    //                    NSLog(@"response all headfield %@====:%@",request,[(NSHTTPURLResponse *)task.response allHeaderFields]);
                    
                    success(responseObject);
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    DDLogVerbose(@"==%@",error);
                    //查看http请求响应的状态码
                    DDLogVerbose(@"response status code:%@",@([(NSHTTPURLResponse *)task.response statusCode]));
                    
                    //查看http请求响应的资源大小
                    DDLogVerbose(@"response expect length:%lld", [(NSHTTPURLResponse *)task.response expectedContentLength]);
                    
                    //查看http响应的所有头域
                    DDLogVerbose(@"response all headfield:%@",[(NSHTTPURLResponse *)task.response allHeaderFields]);
                    
                    
                    failure(error);
                }];
                
            }
            
        }
            break;
        case RequestMethodTypePut:{
            
            task =  [mgr PUT:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                DDLogVerbose(@"%@===%@",url,responseObject);
                //查看http响应的所有头域
                //                    NSLog(@"response all headfield %@====:%@",request,[(NSHTTPURLResponse *)task.response allHeaderFields]);
                
                success(responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                DDLogVerbose(@"==%@",error);
                //查看http请求响应的状态码
                DDLogVerbose(@"response status code:%@",@([(NSHTTPURLResponse *)task.response statusCode]));
                
                //查看http请求响应的资源大小
                DDLogVerbose(@"response expect length:%lld", [(NSHTTPURLResponse *)task.response expectedContentLength]);
                
                //查看http响应的所有头域
                DDLogVerbose(@"response all headfield:%@",[(NSHTTPURLResponse *)task.response allHeaderFields]);
                
                
                failure(error);
            }];
            
            
            
        }
            
            break;
            
        default:
            break;
    }
    
    return task;
}
@end
