//
//  testGuideReqModeBaseClass.h
//
//  Created by   on 2018/12/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface testGuideReqModeBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *resultObj;
@property (nonatomic, assign) double resultCode;
@property (nonatomic, strong) NSString *resultMsg;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
