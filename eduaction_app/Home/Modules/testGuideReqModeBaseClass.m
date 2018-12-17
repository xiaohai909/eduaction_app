//
//  testGuideReqModeBaseClass.m
//
//  Created by   on 2018/12/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "testGuideReqModeBaseClass.h"
#import "testGuideReqModeResultObj.h"


NSString *const ktestGuideReqModeBaseClassResultObj = @"resultObj";
NSString *const ktestGuideReqModeBaseClassResultCode = @"resultCode";
NSString *const ktestGuideReqModeBaseClassResultMsg = @"resultMsg";


@interface testGuideReqModeBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation testGuideReqModeBaseClass

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
    NSObject *receivedtestGuideReqModeResultObj = [dict objectForKey:ktestGuideReqModeBaseClassResultObj];
    NSMutableArray *parsedtestGuideReqModeResultObj = [NSMutableArray array];
    if ([receivedtestGuideReqModeResultObj isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedtestGuideReqModeResultObj) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedtestGuideReqModeResultObj addObject:[testGuideReqModeResultObj modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedtestGuideReqModeResultObj isKindOfClass:[NSDictionary class]]) {
       [parsedtestGuideReqModeResultObj addObject:[testGuideReqModeResultObj modelObjectWithDictionary:(NSDictionary *)receivedtestGuideReqModeResultObj]];
    }

    self.resultObj = [NSArray arrayWithArray:parsedtestGuideReqModeResultObj];
            self.resultCode = [[self objectOrNilForKey:ktestGuideReqModeBaseClassResultCode fromDictionary:dict] doubleValue];
            self.resultMsg = [self objectOrNilForKey:ktestGuideReqModeBaseClassResultMsg fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForResultObj = [NSMutableArray array];
    for (NSObject *subArrayObject in self.resultObj) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForResultObj addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForResultObj addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResultObj] forKey:ktestGuideReqModeBaseClassResultObj];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resultCode] forKey:ktestGuideReqModeBaseClassResultCode];
    [mutableDict setValue:self.resultMsg forKey:ktestGuideReqModeBaseClassResultMsg];

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

    self.resultObj = [aDecoder decodeObjectForKey:ktestGuideReqModeBaseClassResultObj];
    self.resultCode = [aDecoder decodeDoubleForKey:ktestGuideReqModeBaseClassResultCode];
    self.resultMsg = [aDecoder decodeObjectForKey:ktestGuideReqModeBaseClassResultMsg];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_resultObj forKey:ktestGuideReqModeBaseClassResultObj];
    [aCoder encodeDouble:_resultCode forKey:ktestGuideReqModeBaseClassResultCode];
    [aCoder encodeObject:_resultMsg forKey:ktestGuideReqModeBaseClassResultMsg];
}

- (id)copyWithZone:(NSZone *)zone
{
    testGuideReqModeBaseClass *copy = [[testGuideReqModeBaseClass alloc] init];
    
    if (copy) {

        copy.resultObj = [self.resultObj copyWithZone:zone];
        copy.resultCode = self.resultCode;
        copy.resultMsg = [self.resultMsg copyWithZone:zone];
    }
    
    return copy;
}


@end
