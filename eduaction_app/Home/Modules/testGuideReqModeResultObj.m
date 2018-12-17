//
//  testGuideReqModeResultObj.m
//
//  Created by   on 2018/12/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "testGuideReqModeResultObj.h"
#import "testGuideReqModeChildren.h"


NSString *const ktestGuideReqModeResultObjChildren = @"children";
NSString *const ktestGuideReqModeResultObjId = @"id";
NSString *const ktestGuideReqModeResultObjParentId = @"parentId";
NSString *const ktestGuideReqModeResultObjLevel = @"level";
NSString *const ktestGuideReqModeResultObjName = @"name";
NSString *const ktestGuideReqModeResultObjTagStr = @"tagStr";


@interface testGuideReqModeResultObj ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation testGuideReqModeResultObj

@synthesize children = _children;
@synthesize resultObjIdentifier = _resultObjIdentifier;
@synthesize parentId = _parentId;
@synthesize level = _level;
@synthesize name = _name;
@synthesize tagStr = _tagStr;


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
    NSObject *receivedtestGuideReqModeChildren = [dict objectForKey:ktestGuideReqModeResultObjChildren];
    NSMutableArray *parsedtestGuideReqModeChildren = [NSMutableArray array];
    if ([receivedtestGuideReqModeChildren isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedtestGuideReqModeChildren) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedtestGuideReqModeChildren addObject:[testGuideReqModeChildren modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedtestGuideReqModeChildren isKindOfClass:[NSDictionary class]]) {
       [parsedtestGuideReqModeChildren addObject:[testGuideReqModeChildren modelObjectWithDictionary:(NSDictionary *)receivedtestGuideReqModeChildren]];
    }

    self.children = [NSArray arrayWithArray:parsedtestGuideReqModeChildren];
            self.resultObjIdentifier = [[self objectOrNilForKey:ktestGuideReqModeResultObjId fromDictionary:dict] doubleValue];
            self.parentId = [[self objectOrNilForKey:ktestGuideReqModeResultObjParentId fromDictionary:dict] doubleValue];
            self.level = [[self objectOrNilForKey:ktestGuideReqModeResultObjLevel fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:ktestGuideReqModeResultObjName fromDictionary:dict];
            self.tagStr = [self objectOrNilForKey:ktestGuideReqModeResultObjTagStr fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForChildren = [NSMutableArray array];
    for (NSObject *subArrayObject in self.children) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForChildren addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForChildren addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForChildren] forKey:ktestGuideReqModeResultObjChildren];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resultObjIdentifier] forKey:ktestGuideReqModeResultObjId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.parentId] forKey:ktestGuideReqModeResultObjParentId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:ktestGuideReqModeResultObjLevel];
    [mutableDict setValue:self.name forKey:ktestGuideReqModeResultObjName];
    [mutableDict setValue:self.tagStr forKey:ktestGuideReqModeResultObjTagStr];

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

    self.children = [aDecoder decodeObjectForKey:ktestGuideReqModeResultObjChildren];
    self.resultObjIdentifier = [aDecoder decodeDoubleForKey:ktestGuideReqModeResultObjId];
    self.parentId = [aDecoder decodeDoubleForKey:ktestGuideReqModeResultObjParentId];
    self.level = [aDecoder decodeDoubleForKey:ktestGuideReqModeResultObjLevel];
    self.name = [aDecoder decodeObjectForKey:ktestGuideReqModeResultObjName];
    self.tagStr = [aDecoder decodeObjectForKey:ktestGuideReqModeResultObjTagStr];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_children forKey:ktestGuideReqModeResultObjChildren];
    [aCoder encodeDouble:_resultObjIdentifier forKey:ktestGuideReqModeResultObjId];
    [aCoder encodeDouble:_parentId forKey:ktestGuideReqModeResultObjParentId];
    [aCoder encodeDouble:_level forKey:ktestGuideReqModeResultObjLevel];
    [aCoder encodeObject:_name forKey:ktestGuideReqModeResultObjName];
    [aCoder encodeObject:_tagStr forKey:ktestGuideReqModeResultObjTagStr];
}

- (id)copyWithZone:(NSZone *)zone
{
    testGuideReqModeResultObj *copy = [[testGuideReqModeResultObj alloc] init];
    
    if (copy) {

        copy.children = [self.children copyWithZone:zone];
        copy.resultObjIdentifier = self.resultObjIdentifier;
        copy.parentId = self.parentId;
        copy.level = self.level;
        copy.name = [self.name copyWithZone:zone];
        copy.tagStr = [self.tagStr copyWithZone:zone];
    }
    
    return copy;
}


@end
