//
//  myNetworkManager.h
//  eduaction_app
//
//  Created by legendlxd on 2018/11/18.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define severAddress @"http://118.24.128.225/"
//#define severAddress @"http://118.24.128.225"
#define ContentType @"application/json"
#define ContentType1 @"text/html"
NS_ASSUME_NONNULL_BEGIN
@class courseVMode;
typedef NS_ENUM(NSInteger, RequestMethodType){
    RequestMethodTypePost = 1,
    RequestMethodTypeGet = 2,
    RequestMethodTypePut = 3,
    RequestMethodTypeDelete=4
};
@class userBaseClass;
@interface myNetworkManager : NSObject
@property (nonatomic,strong)NSString *sessionID;
@property (nonatomic,strong)userBaseClass *userMode;
@property (nonatomic,strong)courseVMode *net_courseMode;
+(myNetworkManager *)sharemyNetworkManager;

-(NSURLSessionDataTask *)regedit:(NSString *)account Andpassword:(NSString *)password AndactivationCode:(NSString *)activationCode AndsmsTxt:(NSString *)smsTxt Andsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure;

-(NSURLSessionDataTask *)requestSessionAndsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure;
#pragma mark 短信登录
-(NSURLSessionDataTask *)loginSms:(NSString *)account AndsmsTxt:(NSString *)smsTxt Andsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure;
#pragma 登录用户名密码
-(NSURLSessionDataTask *)loginAuth:(NSString *)account Andpassword:(NSString *)password Andsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure;

-(NSURLSessionDataTask *)sendSms:(NSString *)account Andsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure;
-(NSURLSessionDataTask *)sendSms2:(NSString *)account Andsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure;
#pragma mark 重置密码
-(NSURLSessionDataTask *)resetUserPwd:(NSString *)account AndnewPassword:(NSString *)newPassword AndsmsTxt:(NSString *)smsTxt Andsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure;

-(NSURLSessionDataTask *)queryGuideAllTypeAndsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure;

-(NSURLSessionDataTask *)queryKechengTypeListAndsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure;

-(NSURLSessionDataTask *)getGuideById:(NSString *)guideid Andsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure;

-(NSURLSessionDataTask *)queryKechengListAndfreeType:(NSString *)freeType
                                   AndqueryStartTime:(NSString *)queryStartTime
                                      AndkechengName:(NSString *)kechengName
                                             Andpage:(NSInteger)page
                                    AndkechengTypeId:(NSString *)kechengTypeId
                                     AndqueryEndTime:(NSString *)queryEndTime
                                          Andsuccess:(void (^)(id response))success
                                          Andfailure:(void (^)(NSError* err))failure;

-(NSURLSessionDataTask *)getKechengTitleByKechengId:(NSString *)kechengId
                                         Andsuccess:(void (^)(id response))success
                                         Andfailure:(void (^)(NSError* err))failure;

-(NSURLSessionDataTask *)queryPeixunban:(NSString *)state
                             Andsuccess:(void (^)(id response))success
                             Andfailure:(void (^)(NSError* err))failure;

-(NSURLSessionDataTask *)queryKemuByPeixunbanId:(NSString *)peixunbanId
                                     Andsuccess:(void (^)(id response))success
                                     Andfailure:(void (^)(NSError* err))failure;

-(NSURLSessionDataTask *)queryKechengByKemuId:(NSString *)kemuId
                                      Andpage:(NSInteger)page
                                   Andsuccess:(void (^)(id response))success
                                   Andfailure:(void (^)(NSError* err))failure;
@end

NS_ASSUME_NONNULL_END
