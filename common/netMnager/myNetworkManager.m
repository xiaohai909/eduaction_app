//
//  myNetworkManager.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/18.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <sys/socket.h>
#import <sys/sockio.h>
#import <sys/ioctl.h>
#import <net/if.h>
#import <arpa/inet.h>
#import <ifaddrs.h>
#import <arpa/inet.h>

#import "myNetworkManager.h"
#import "AFNetworkReachabilityManager.h"
#import "AFNetworking-umbrella.h"
#define severAddress @"http://118.24.128.225/"
//#define severAddress @"http://118.24.128.225"
#define ContentType @"application/json"
#define ContentType1 @"text/html"
#define ContentType2 @"text/plain"
#define appId @"app_mobile"
#define session_str @"session_id"
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
        if ([YGUserDefaults objectForKey:@"sessionID"] != nil) {
            
            self.sessionID =[YGUserDefaults objectForKey:@"sessionID"];
        }
        
    }
    return self;
}
#pragma mark 获得session
-(NSURLSessionDataTask *)requestSessionAndsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure{
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:[FCUUID uuidForDevice] forKey:@"mobileId"];
    [dic setObject:[self getIPAddress] forKey:@"clientIp"];
    [dic setObject:@"iphone" forKey:@"mobileType"];
    NSMutableDictionary *dic2 = [self commParam:@"requestSession" Andparams:dic AndSessionID:@"" AndHavesession:NO Andtype:@"systemManager"];
    
    NSURLSessionDataTask *task =[self MyRequestWithMethod:RequestMethodTypePost url:@"mobile/line/api?3=11" isUploadImage:NO params:dic2 success:^(id response) {
        
        
        DDLogVerbose(@"requestSessionAndsuccess == %@",[CommonFunciton dictionaryToJson:response]);
        commResBaseClass *mode = [[commResBaseClass alloc]initWithDictionary:response];
        if (mode.resultCode == 10000) {
            
            self.sessionID = mode.resultObj.sessionId;
            
            [YGUserDefaults setObject:self.sessionID forKey:@"sessionID"];
            [YGUserDefaults synchronize];
            
        }
        
    } failure:failure];
    
    return task;
    
}
-(NSMutableDictionary *)commParam:(NSString *)method Andparams:(NSMutableDictionary *)params AndSessionID:(NSString *)session AndHavesession:(BOOL)havesession Andtype:(NSString *)type
{
    
    NSDate *nowDate = [[NSDate alloc]init];
    NSDateFormatter *timeformat =[[NSDateFormatter alloc]init];
    [timeformat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *timeStamp = [timeformat stringFromDate:nowDate];
    
    NSMutableDictionary *dic =[[NSMutableDictionary alloc]init];
    [dic setObject:appId forKey:@"appId"];
    [dic setObject:method forKey:@"method"];
    [dic setObject:timeStamp forKey:@"timeStamp"];
    
    if (params != nil) {
        [dic setObject:params forKey:@"params"];
    }
  
    if (type.length> 0) {
        
          [dic setObject:type forKey:@"type"];
    }
  
    if (session) {
        if (session.length > 0) {
            
               [dic setObject:session forKey:@"sessionId"];
        }
        else{
            
        }
     
    }
   
    return dic;
    
}
#pragma mark 重置密码
-(NSURLSessionDataTask *)resetUserPwd:(NSString *)account AndnewPassword:(NSString *)newPassword AndsmsTxt:(NSString *)smsTxt Andsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure{
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:account forKey:@"account"];
    [dic setObject:newPassword forKey:@"smsTxt"];
    [dic setObject:smsTxt forKey:@"newPassword"];
    
    NSMutableDictionary *dic2 = [self commParam:@"resetUserPwd" Andparams:dic AndSessionID:self.sessionID AndHavesession: YES Andtype:@"userManager"];
    
    NSURLSessionDataTask *task =[self MyRequestWithMethod:RequestMethodTypePost url:@"mobile/line/api?1=61" isUploadImage:NO params:dic2 success:success failure:failure];
    
    return task;
    
}
#pragma mark 注册
-(NSURLSessionDataTask *)regedit:(NSString *)account Andpassword:(NSString *)password AndactivationCode:(NSString *)activationCode AndsmsTxt:(NSString *)smsTxt Andsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure
{

    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:account forKey:@"account"];
    [dic setObject:password forKey:@"password"];
    [dic setObject:activationCode forKey:@"activationCode"];
    [dic setObject:smsTxt forKey:@"smsTxt"];
    [dic setObject:account forKey:@"telephone"];
    
    NSMutableDictionary *dic2 = [self commParam:@"regedit" Andparams:dic AndSessionID:self.sessionID AndHavesession: YES Andtype:@"userManager"];
    
    NSURLSessionDataTask *task =[self MyRequestWithMethod:RequestMethodTypePost url:@"mobile/line/api?1=6" isUploadImage:NO params:dic2 success:success failure:failure];
    
    return task;
}
#pragma mark 短信登录
-(NSURLSessionDataTask *)loginSms:(NSString *)account AndsmsTxt:(NSString *)smsTxt Andsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure{
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:account forKey:@"account"];
    [dic setObject:smsTxt forKey:@"smsTxt"];
    NSMutableDictionary *dic2 = [self commParam:@"loginSms" Andparams:dic AndSessionID:self.sessionID AndHavesession: YES Andtype:@"userManager"];
    
    NSURLSessionDataTask *task =[self MyRequestWithMethod:RequestMethodTypePost url:@"mobile/line/api?1=1" isUploadImage:NO params:dic2 success:success failure:failure];
    
    return task;
    
}
#pragma mark 登录用户名密码
-(NSURLSessionDataTask *)loginAuth:(NSString *)account Andpassword:(NSString *)password Andsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure{
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:account forKey:@"account"];
    [dic setObject:password forKey:@"password"];
    //[dic setObject:@"test" forKey:@"activationCode"];
    NSMutableDictionary *dic2 = [self commParam:@"loginAuth" Andparams:dic AndSessionID:self.sessionID AndHavesession: YES Andtype:@"userManager"];
    
    NSURLSessionDataTask *task =[self MyRequestWithMethod:RequestMethodTypePost url:@"mobile/line/api?1=3" isUploadImage:NO params:dic2 success:success failure:failure];
    
    return task;
    
}
#pragma mark 获取注册短信
-(NSURLSessionDataTask *)sendSms:(NSString *)account Andsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure{
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:account forKey:@"account"];
    NSMutableDictionary *dic2 = [self commParam:@"sendSmsForRegedit" Andparams:dic AndSessionID:self.sessionID AndHavesession: YES Andtype:@"userManager"];
    
    NSURLSessionDataTask *task =[self MyRequestWithMethod:RequestMethodTypePost url:@"mobile/line/apii?1=23" isUploadImage:NO params:dic2 success:success failure:failure];
    
    return task;
    
}
#pragma mark 获取短信（非注册用）
-(NSURLSessionDataTask *)sendSms2:(NSString *)account Andsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure{
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:account forKey:@"account"];
    NSMutableDictionary *dic2 = [self commParam:@"sendSms" Andparams:dic AndSessionID:self.sessionID AndHavesession: YES Andtype:@"userManager"];
    
    NSURLSessionDataTask *task =[self MyRequestWithMethod:RequestMethodTypePost url:@"mobile/line/api?1=2" isUploadImage:NO params:dic2 success:success failure:failure];
    
    return task;
    
}
#pragma mark 考试指南
-(NSURLSessionDataTask *)queryGuideAllTypeAndsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure{
    
   
    NSMutableDictionary *dic2 = [self commParam:@"queryGuideAllType" Andparams:nil AndSessionID:self.sessionID AndHavesession: YES Andtype:@"appServer"];
    
    NSURLSessionDataTask *task =[self MyRequestWithMethod:RequestMethodTypePost url:@"mobile/line/api?3=41" isUploadImage:NO params:dic2 success:success failure:failure];
    
    return task;
    
}
#pragma mark 课程列表
-(NSURLSessionDataTask *)queryKechengTypeListAndsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure
{
    
    
    NSMutableDictionary *dic2 = [self commParam:@"queryKechengTypeList" Andparams:nil AndSessionID:self.sessionID AndHavesession: YES Andtype:@"kecheng"];
    
    NSURLSessionDataTask *task =[self MyRequestWithMethod:RequestMethodTypePost url:@"mobile/line/api?3=311" isUploadImage:NO params:dic2 success:success failure:failure];
    
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
    [Contentsets addObject:ContentType2];
    
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
                        //DDLogVerbose(@"%@===%@",url,responseObject);
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
                    //DDLogVerbose(@"%@===%@",url,responseObject);
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

- (NSString *)getDeviceIPIpAddresses{
    int sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    if (sockfd <<sockfd>>0){
        return @"";
    }
    NSMutableArray *ips = [NSMutableArray array];
    int BUFFERSIZE = 4096;
    struct ifconf ifc;
    char buffer[BUFFERSIZE], *ptr, lastname[IFNAMSIZ],*cptr;
    struct ifreq *ifr, ifrcopy;
    ifc.ifc_len = BUFFERSIZE;
    ifc.ifc_buf = buffer;
    if (ioctl(sockfd, SIOCGIFCONF, &ifc) >= 0){
        for (ptr = buffer; ptr < buffer + ifc.ifc_len;
             ){
            ifr = (struct ifreq *)ptr;
            int len = sizeof(struct sockaddr);
            
            if (ifr->ifr_addr.sa_len > len) {
                len = ifr->ifr_addr.sa_len;
                
            }            ptr += sizeof(ifr->ifr_name) + len;
            if (ifr->ifr_addr.sa_family != AF_INET) continue;
            if ((cptr = (char *)strchr(ifr->ifr_name, ':')) != NULL) *cptr = 0;
            if (strncmp(lastname, ifr->ifr_name, IFNAMSIZ) == 0)
                continue;
            memcpy(lastname, ifr->ifr_name, IFNAMSIZ);
            ifrcopy = *ifr;
            ioctl(sockfd, SIOCGIFFLAGS, &ifrcopy);
            if ((ifrcopy.ifr_flags & IFF_UP) == 0)         continue;
            NSString *ip = [NSString  stringWithFormat:@"%s", inet_ntoa(((struct sockaddr_in *)&ifr->ifr_addr)->sin_addr)];
            [ips addObject:ip];
        }
    }
    close(sockfd);
    NSString *deviceIP = @"";
    for (int i=0; i < ips.count; i++)    { if (ips.count > 0)   {   deviceIP = [NSString stringWithFormat:@"%@",ips.lastObject];        }
    }
    return deviceIP;
}
// Get IP Address
- (NSString *)getIPAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
    
}


@end
