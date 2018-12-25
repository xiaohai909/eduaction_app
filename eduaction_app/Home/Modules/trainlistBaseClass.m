//
//  trainlistBaseClass.m
//
//  Created by   on 2018/12/24
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "trainlistBaseClass.h"


NSString *const ktrainlistBaseClassDel = @"del";
NSString *const ktrainlistBaseClassSort = @"sort";
NSString *const ktrainlistBaseClassRemark = @"remark";
NSString *const ktrainlistBaseClassId = @"id";
NSString *const ktrainlistBaseClassCode = @"code";
NSString *const ktrainlistBaseClassTypeCode = @"typeCode";
NSString *const ktrainlistBaseClassName = @"name";


@interface trainlistBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation trainlistBaseClass

@synthesize del = _del;
@synthesize sort = _sort;
@synthesize remark = _remark;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize code = _code;
@synthesize typeCode = _typeCode;
@synthesize name = _name;


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
            self.del = [self objectOrNilForKey:ktrainlistBaseClassDel fromDictionary:dict];
            self.sort = [[self objectOrNilForKey:ktrainlistBaseClassSort fromDictionary:dict] doubleValue];
            self.remark = [self objectOrNilForKey:ktrainlistBaseClassRemark fromDictionary:dict];
            self.internalBaseClassIdentifier = [[self objectOrNilForKey:ktrainlistBaseClassId fromDictionary:dict] doubleValue];
            self.code = [self objectOrNilForKey:ktrainlistBaseClassCode fromDictionary:dict];
            self.typeCode = [self objectOrNilForKey:ktrainlistBaseClassTypeCode fromDictionary:dict];
            self.name = [self objectOrNilForKey:ktrainlistBaseClassName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.del forKey:ktrainlistBaseClassDel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sort] forKey:ktrainlistBaseClassSort];
    [mutableDict setValue:self.remark forKey:ktrainlistBaseClassRemark];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:ktrainlistBaseClassId];
    [mutableDict setValue:self.code forKey:ktrainlistBaseClassCode];
    [mutableDict setValue:self.typeCode forKey:ktrainlistBaseClassTypeCode];
    [mutableDict setValue:self.name forKey:ktrainlistBaseClassName];

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

    self.del = [aDecoder decodeObjectForKey:ktrainlistBaseClassDel];
    self.sort = [aDecoder decodeDoubleForKey:ktrainlistBaseClassSort];
    self.remark = [aDecoder decodeObjectForKey:ktrainlistBaseClassRemark];
    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:ktrainlistBaseClassId];
    self.code = [aDecoder decodeObjectForKey:ktrainlistBaseClassCode];
    self.typeCode = [aDecoder decodeObjectForKey:ktrainlistBaseClassTypeCode];
    self.name = [aDecoder decodeObjectForKey:ktrainlistBaseClassName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_del forKey:ktrainlistBaseClassDel];
    [aCoder encodeDouble:_sort forKey:ktrainlistBaseClassSort];
    [aCoder encodeObject:_remark forKey:ktrainlistBaseClassRemark];
    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:ktrainlistBaseClassId];
    [aCoder encodeObject:_code forKey:ktrainlistBaseClassCode];
    [aCoder encodeObject:_typeCode forKey:ktrainlistBaseClassTypeCode];
    [aCoder encodeObject:_name forKey:ktrainlistBaseClassName];
}

- (id)copyWithZone:(NSZone *)zone
{
    trainlistBaseClass *copy = [[trainlistBaseClass alloc] init];
    
    if (copy) {

        copy.del = [self.del copyWithZone:zone];
        copy.sort = self.sort;
        copy.remark = [self.remark copyWithZone:zone];
        copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
        copy.code = [self.code copyWithZone:zone];
        copy.typeCode = [self.typeCode copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
