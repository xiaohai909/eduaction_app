//
//  testGuideReqModeResultObj.h
//
//  Created by   on 2018/12/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface testGuideReqModeResultObj : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *children;
@property (nonatomic, assign) double resultObjIdentifier;
@property (nonatomic, assign) double parentId;
@property (nonatomic, assign) double level;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *tagStr;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
