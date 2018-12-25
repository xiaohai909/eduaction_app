//
//  testGuideDetailResultObj.h
//
//  Created by   on 2018/12/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface testGuideDetailResultObj : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double resultObjIdentifier;
@property (nonatomic, assign) double typeId;
@property (nonatomic, strong) NSString *typeName;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *remark;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
