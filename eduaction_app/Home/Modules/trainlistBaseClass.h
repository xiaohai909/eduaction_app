//
//  trainlistBaseClass.h
//
//  Created by   on 2018/12/24
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface trainlistBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *del;
@property (nonatomic, assign) double sort;
@property (nonatomic, strong) NSString *remark;
@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *typeCode;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
