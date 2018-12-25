//
//  testGuideDetailBaseClass.m
//
//  Created by   on 2018/12/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "testGuideDetailBaseClass.h"
#import "testGuideDetailResultObj.h"


NSString *const ktestGuideDetailBaseClassResultObj = @"resultObj";
NSString *const ktestGuideDetailBaseClassResultCode = @"resultCode";
NSString *const ktestGuideDetailBaseClassResultMsg = @"resultMsg";


@interface testGuideDetailBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation testGuideDetailBaseClass

@synthesize resultObj = _resultObj;
@synthesize resultCode = _resultCode;
@synthesize resultMsg = _resultMsg;


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
            self.resultObj = [testGuideDetailResultObj modelObjectWithDictionary:[dict objectForKey:ktestGuideDetailBaseClassResultObj]];
            self.resultCode = [[self objectOrNilForKey:ktestGuideDetailBaseClassResultCode fromDictionary:dict] doubleValue];
            self.resultMsg = [self objectOrNilForKey:ktestGuideDetailBaseClassResultMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.resultObj dictionaryRepresentation] forKey:ktestGuideDetailBaseClassResultObj];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resultCode] forKey:ktestGuideDetailBaseClassResultCode];
    [mutableDict setValue:self.resultMsg forKey:ktestGuideDetailBaseClassResultMsg];

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

    self.resultObj = [aDecoder decodeObjectForKey:ktestGuideDetailBaseClassResultObj];
    self.resultCode = [aDecoder decodeDoubleForKey:ktestGuideDetailBaseClassResultCode];
    self.resultMsg = [aDecoder decodeObjectForKey:ktestGuideDetailBaseClassResultMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_resultObj forKey:ktestGuideDetailBaseClassResultObj];
    [aCoder encodeDouble:_resultCode forKey:ktestGuideDetailBaseClassResultCode];
    [aCoder encodeObject:_resultMsg forKey:ktestGuideDetailBaseClassResultMsg];
}

- (id)copyWithZone:(NSZone *)zone
{
    testGuideDetailBaseClass *copy = [[testGuideDetailBaseClass alloc] init];
    
    if (copy) {

        copy.resultObj = [self.resultObj copyWithZone:zone];
        copy.resultCode = self.resultCode;
        copy.resultMsg = [self.resultMsg copyWithZone:zone];
    }
    
    return copy;
}


@end
