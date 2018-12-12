//
//  SQNetworkManager.m
//  eduaction_app
//
//  Created by Mac on 2018/11/28.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "SQNetworkManager.h"
#import <CommonCrypto/CommonDigest.h>

@implementation SQNetworkManager

+ (instancetype)shareManager {
    static SQNetworkManager *__smt_manager;
    static dispatch_once_t _token;
    dispatch_once(&_token, ^{
        __smt_manager = [[SQNetworkManager alloc]init];
    });
    return __smt_manager;
}

//md5加密密码，32位小写
+(NSString *)md5HexDigest:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];//
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}
+ (AFSecurityPolicy*)customSecurityPolicy
{
    // https请求先导入证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"httpsbaidu" ofType:@"cer"];//证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;//YES;
    securityPolicy.pinnedCertificates = [NSSet setWithArray:@[certData]];
    
    return securityPolicy;
}


#pragma mrk --- request
+ (NSURLSessionDataTask *)sessionrequestUrl:(NSString *)url
                               andShowError:(BOOL)showError
                                  andParams:(id)params
                                    andType:(HttpMethodType)type
                             andRefreshData:(BOOL)refresh
                                  andResult:(blockResult)result
{
    //使用这样的下载方法，下载完成后的数据AFNetWorking会帮我们自动解析
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval=10.f;
    //使用https证书
    //    [manager setSecurityPolicy:[SMTNetWorkManager customSecurityPolicy]];
    
    //复杂数据用json的数据方式拼接
    manager.requestSerializer = [AFJSONRequestSerializer serializer];

    
    //但是有时候服务器给的数据并不标准，这时我们需要加上这个设置,这样我们将得到原始的HTTP返回给我们数据
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//[AFJSONResponseSerializer serializerWithReadingOptions:1];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"application/javascript",@"text/plain",nil];//@"application/javascript",@"text/plain"
    manager.requestSerializer.HTTPShouldHandleCookies = YES;
    
    if(refresh){
        //需要实时刷新：重要的请求和数据改变的时候
        //在有网络的条件下,忽略本地数据，服务器请求
        if ([AFNetworkReachabilityManager sharedManager].isReachable) {
            manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        }
        else{
            //无网络只能本地读取
            manager.requestSerializer.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
        }
    }
    else{
        //不需要实时更新的数据请求
        //在Wi-Fi网络的时候，任性更新，忽略本地数据，到服务器请求
        if ([AFNetworkReachabilityManager sharedManager].isReachableViaWiFi) {
            manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        }
        else{
            //WWAN网络或者无网络，不需要实时更新的
            manager.requestSerializer.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
        }
    }
    
    if (type == HttpMethodPost) {
        return [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            //            NSLog(@"%@",uploadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (result) {
                [self success:YES andShowError:showError andObject:responseObject andResult:result];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (result) {
                [self success:NO andShowError:showError andObject:error andResult:result];
            }
        }];
    }
    else if (type == HttpMethodGet){
        return [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
            //            NSLog(@"%@",downloadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (result) {
                [self success:YES andShowError:showError andObject:responseObject andResult:result];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (result) {
                [self success:NO andShowError:showError andObject:error andResult:result];
            }
        }];
    }
    else{
        return [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
            //            NSLog(@"%@",uploadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (result) {
                [self success:YES andShowError:showError andObject:responseObject andResult:result];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (result) {
                [self success:NO andShowError:showError andObject:error andResult:result];
            }
        }];
    }
}

+ (NSURLSessionDataTask *)sessionrequestUrl:(NSString *)url
                               andShowError:(BOOL)showError
                                   andImage:(UIImage *)image
                                  andParams:(id)params
                                    andType:(HttpMethodType)type
                                  andResult:(blockResult)result
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setSecurityPolicy:[SQNetworkManager customSecurityPolicy]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",nil];
    
    
    return [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (image) {
            NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
            
//            NSDateFormatter *tempFormatter = [[NSDateFormatter alloc]init];
//            [tempFormatter setDateFormat:@"yyyy/MM/dd"];
//            NSString *currTime = [tempFormatter stringFromDate:[NSDate date]];
//            NSString *imgfileName = [imageData MD5HexDigest];
//            imgfileName = [NSString stringWithFormat:@"/%@%@.jpeg", currTime, imgfileName];
            
            NSString *imgfileName = @"file.jpeg";
            [formData appendPartWithFileData:imageData name:@"image" fileName:imgfileName mimeType:@"image/jpeg"];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (result) {
            [self success:YES andShowError:showError andObject:responseObject andResult:result];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (result) {
            [self success:NO andShowError:showError andObject:error andResult:result];
        }
    }];
    
}


+ (void)success:(BOOL)success andShowError:(BOOL)showError andObject:(id)object andResult:(blockResult)result
{
    NSInteger state;
    if (success) {
        if ([[object objectForKey:@"resultCode"] integerValue] == 10000) {
            state = CODE_SUCCESS;
        }
        else{
            state = CODE_ERROR;
            //token传入错误
            if ([[object objectForKey:@"resultCode"] integerValue] <= -2001) {
                state = 5000;
            }
        }
        result(state,object[@"resultMsg"],[object objectForKey:@"total"]?object[@"total"]:@"0",object[@"resultObj"]);
    }
    else{
        state = CODE_ERROR;
        NSString *msg = @"连接错误";
        result(state,msg,@"0",@{@"resultObj":@[]});
    }
}

@end
