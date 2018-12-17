//
//  SQNetworkInterface.h
//  eduaction_app
//
//  Created by Mac on 2018/11/28.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQNetworkManager.h"
#import "DataModel.h"

#define CODE_ERROR 100
#define CODE_SUCCESS 200

NS_ASSUME_NONNULL_BEGIN


@interface SQNetworkInterface : NSObject
+ (NSString *)nowTime;
#pragma mark --- 充值
+ (void)iRequestRechargeAndResult:(blockResult)result;//充值界面的数据


#pragma mark --- 章节列表
+ (void)iRequestChapterCleanParames:(NSDictionary *)parames andResult:(blockResult)result;//清除所有章节数据

+ (void)iRequestChapterMainParames:(NSDictionary *)parames andResult:(blockResult)result;
+ (void)iRequestChapterListParames:(NSDictionary *)parames andResult:(blockResult)result;
+ (void)iRequestChapterScoreParames:(NSDictionary *)parames andResult:(blockResult)result;
+ (void)iRequestChapterRedoParames:(NSDictionary *)parames andResult:(blockResult)result;


+ (void)iRequestChapterScoreDetailListParames:(NSDictionary *)parames andResult:(blockResult)result;
+ (void)iRequestChapterCollectionDeleteParames:(NSDictionary *)parames andResult:(blockResult)result;
+ (void)iRequestChapterNotesDeleteParames:(NSDictionary *)parames andResult:(blockResult)result;

#pragma mark -- 做题
+ (void)iRequestMakeProblemParames:(NSDictionary *)parames andResult:(blockResult)result;//获取题目
+ (void)iRequestMakeProblemMakeParames:(NSDictionary *)parames andResult:(blockResult)result;//做题



#pragma mark -- 巩固
+ (void)iRequestConsolidateCollectionParames:(NSDictionary *)parames andResult:(blockResult)result;//收藏
+ (void)iRequestConsolidateNotesParames:(NSDictionary *)parames andResult:(blockResult)result;//笔记
//+ (void)iRequestConsolidateEasyWrongParames:(NSDictionary *)parames andResult:(blockResult)result;//易错

+ (void)iRequestConsolidateHotParames:(NSDictionary *)parames andResult:(blockResult)result;//热门
+ (void)iRequestConsolidateMyWrongParames:(NSDictionary *)parames andResult:(blockResult)result;//错题
//+ (void)iRequestConsolidateScoreParames:(NSDictionary *)parames andResult:(blockResult)result;
@end

NS_ASSUME_NONNULL_END
