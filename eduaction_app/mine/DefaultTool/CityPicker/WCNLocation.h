//
//  WCNLocation.h
//  wmall
//
//  Created by w_app_01 on 15/1/12.
//  Copyright (c) 2015年 w.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WCNLocation : NSObject

@property (copy, nonatomic) NSString *country;
@property (copy, nonatomic) NSString *state;
@property (copy, nonatomic) NSString *city;
@property (copy, nonatomic) NSString *district;
@property (copy, nonatomic) NSString *street;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (copy,nonatomic)NSString *stateCode;
@property (copy,nonatomic)NSString *cityCode;
@property (copy,nonatomic)NSString *districtCode;

@end
