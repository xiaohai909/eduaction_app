//
//  myNetworkManager.h
//  eduaction_app
//
//  Created by legendlxd on 2018/11/18.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, RequestMethodType){
    RequestMethodTypePost = 1,
    RequestMethodTypeGet = 2,
    RequestMethodTypePut = 3,
    RequestMethodTypeDelete=4
};
@interface myNetworkManager : NSObject
@property (nonatomic,strong)NSString *sessionID;
+(myNetworkManager *)sharemyNetworkManager;

-(NSURLSessionDataTask *)regedit:(NSString *)account Andpassword:(NSString *)password AndactivationCode:(NSString *)activationCode Andsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure;
-(NSURLSessionDataTask *)requestSessionAndsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure;
#pragma mark 短信登录
-(NSURLSessionDataTask *)loginSms:(NSString *)account AndsmsTxt:(NSString *)smsTxt Andsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure;
#pragma 登录用户名密码
-(NSURLSessionDataTask *)loginAuth:(NSString *)account Andpassword:(NSString *)password Andsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure;

-(NSURLSessionDataTask *)sendSms:(NSString *)account Andsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure;
@end

NS_ASSUME_NONNULL_END
