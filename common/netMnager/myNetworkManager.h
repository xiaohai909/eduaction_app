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
#define appId @"app_mobile"

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, RequestMethodType){
    RequestMethodTypePost = 1,
    RequestMethodTypeGet = 2,
    RequestMethodTypePut = 3,
    RequestMethodTypeDelete=4
};
@interface myNetworkManager : NSObject
+(myNetworkManager *)sharemyNetworkManager;

-(NSURLSessionDataTask *)regedit:(NSString *)account Andpassword:(NSString *)password AndactivationCode:(NSString *)activationCode Andsuccess:(void (^)(id response))success Andfailure:(void (^)(NSError* err))failure;
@end

NS_ASSUME_NONNULL_END
