//
//  commResBaseClass.h
//
//  Created by   on 2018/12/2
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class commResResultObj;

@interface commResBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *resultMsg;
@property (nonatomic, strong) commResResultObj *resultObj;
@property (nonatomic, assign) double resultCode;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
