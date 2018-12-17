//
//  RechargeModel.h
//  eduaction_app
//
//  Created by Mac on 2018/12/13.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RechargeModel : NSObject
@property (nonatomic, copy) NSString *buyMoney;
@property (nonatomic, copy) NSString *buyType;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *duration;
@property (nonatomic, copy) NSString *endTime;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *name;
@end

NS_ASSUME_NONNULL_END
/*
 "buyMoney": "23",
 "buyType": "1-人民币  2-积分",
 "desc": "年度12个月",
 "duration": 12,
 "endTime": "2019-12-13 00:32:26",
 "id": 1,
 "name": "年度12个月"
 */
