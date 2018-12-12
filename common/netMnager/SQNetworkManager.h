//
//  SQNetworkManager.h
//  eduaction_app
//
//  Created by Mac on 2018/11/28.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "myNetworkManager.h"

//数据请求
#define CODE_ERROR 100
#define CODE_SUCCESS 200
#define SMTURL(_x_) [NSURL URLWithString:_x_]

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, HttpMethodType)
{
    HttpMethodPost,
    HttpMethodGet,
    HttpMethodDelete,
    HttpMethodHead,
    HttpMethodOptions,
    HttpMethodPut
};

typedef void(^blockResult)(NSInteger state,NSString *msg,NSString *total,id resultData);

@interface SQNetworkManager : NSObject
+ (instancetype)shareManager;
//+ (NSURLCache *)sharedCache;
+(NSString *)md5HexDigest:(NSString*)input;


+ (NSURLSessionDataTask *)sessionrequestUrl:(NSString *)url
                               andShowError:(BOOL)showError
                                  andParams:(id)params
                                    andType:(HttpMethodType)type
                             andRefreshData:(BOOL)refresh
                                  andResult:(blockResult)result;
+ (NSURLSessionDataTask *)sessionrequestUrl:(NSString *)url
                               andShowError:(BOOL)showError
                                   andImage:(UIImage *)image
                                  andParams:(id)params
                                    andType:(HttpMethodType)type
                                  andResult:(blockResult)result;
@end

NS_ASSUME_NONNULL_END
