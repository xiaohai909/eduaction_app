//
//  trainkindBaseClass.h
//
//  Created by   on 2018/12/24
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface trainkindBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double charge;
@property (nonatomic, strong) NSString *remark;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *endTime;
@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nonatomic, assign) double creater;
@property (nonatomic, assign) double integral;
@property (nonatomic, strong) NSString *chargeStr;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *state;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
