//
//  commResResultObj.m
//
//  Created by   on 2018/12/2
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "commResResultObj.h"


NSString *const kcommResResultObjSessionId = @"sessionId";


@interface commResResultObj ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation commResResultObj

@synthesize sessionId = _sessionId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.sessionId = [self objectOrNilForKey:kcommResResultObjSessionId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.sessionId forKey:kcommResResultObjSessionId];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.sessionId = [aDecoder decodeObjectForKey:kcommResResultObjSessionId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_sessionId forKey:kcommResResultObjSessionId];
}

- (id)copyWithZone:(NSZone *)zone
{
    commResResultObj *copy = [[commResResultObj alloc] init];
    
    if (copy) {

        copy.sessionId = [self.sessionId copyWithZone:zone];
    }
    
    return copy;
}


@end
