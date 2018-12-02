//
//  commResResultObj.h
//
//  Created by   on 2018/12/2
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface commResResultObj : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *sessionId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
