//
//  testGuideReqModeChildren.h
//
//  Created by   on 2018/12/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface testGuideReqModeChildren : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double parentId;
@property (nonatomic, strong) NSString *tagStr;
@property (nonatomic, strong) NSString *parentName;
@property (nonatomic, assign) double childrenIdentifier;
@property (nonatomic, strong) NSArray *children;
@property (nonatomic, assign) double level;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
