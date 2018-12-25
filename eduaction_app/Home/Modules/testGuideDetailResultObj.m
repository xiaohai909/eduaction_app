//
//  testGuideDetailResultObj.m
//
//  Created by   on 2018/12/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "testGuideDetailResultObj.h"


NSString *const ktestGuideDetailResultObjId = @"id";
NSString *const ktestGuideDetailResultObjTypeId = @"typeId";
NSString *const ktestGuideDetailResultObjTypeName = @"typeName";
NSString *const ktestGuideDetailResultObjName = @"name";
NSString *const ktestGuideDetailResultObjRemark = @"remark";


@interface testGuideDetailResultObj ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation testGuideDetailResultObj

@synthesize resultObjIdentifier = _resultObjIdentifier;
@synthesize typeId = _typeId;
@synthesize typeName = _typeName;
@synthesize name = _name;
@synthesize remark = _remark;


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
            self.resultObjIdentifier = [[self objectOrNilForKey:ktestGuideDetailResultObjId fromDictionary:dict] doubleValue];
            self.typeId = [[self objectOrNilForKey:ktestGuideDetailResultObjTypeId fromDictionary:dict] doubleValue];
            self.typeName = [self objectOrNilForKey:ktestGuideDetailResultObjTypeName fromDictionary:dict];
            self.name = [self objectOrNilForKey:ktestGuideDetailResultObjName fromDictionary:dict];
            self.remark = [self objectOrNilForKey:ktestGuideDetailResultObjRemark fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resultObjIdentifier] forKey:ktestGuideDetailResultObjId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.typeId] forKey:ktestGuideDetailResultObjTypeId];
    [mutableDict setValue:self.typeName forKey:ktestGuideDetailResultObjTypeName];
    [mutableDict setValue:self.name forKey:ktestGuideDetailResultObjName];
    [mutableDict setValue:self.remark forKey:ktestGuideDetailResultObjRemark];

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

    self.resultObjIdentifier = [aDecoder decodeDoubleForKey:ktestGuideDetailResultObjId];
    self.typeId = [aDecoder decodeDoubleForKey:ktestGuideDetailResultObjTypeId];
    self.typeName = [aDecoder decodeObjectForKey:ktestGuideDetailResultObjTypeName];
    self.name = [aDecoder decodeObjectForKey:ktestGuideDetailResultObjName];
    self.remark = [aDecoder decodeObjectForKey:ktestGuideDetailResultObjRemark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_resultObjIdentifier forKey:ktestGuideDetailResultObjId];
    [aCoder encodeDouble:_typeId forKey:ktestGuideDetailResultObjTypeId];
    [aCoder encodeObject:_typeName forKey:ktestGuideDetailResultObjTypeName];
    [aCoder encodeObject:_name forKey:ktestGuideDetailResultObjName];
    [aCoder encodeObject:_remark forKey:ktestGuideDetailResultObjRemark];
}

- (id)copyWithZone:(NSZone *)zone
{
    testGuideDetailResultObj *copy = [[testGuideDetailResultObj alloc] init];
    
    if (copy) {

        copy.resultObjIdentifier = self.resultObjIdentifier;
        copy.typeId = self.typeId;
        copy.typeName = [self.typeName copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.remark = [self.remark copyWithZone:zone];
    }
    
    return copy;
}


@end
