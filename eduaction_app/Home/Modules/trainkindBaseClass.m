//
//  trainkindBaseClass.m
//
//  Created by   on 2018/12/24
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "trainkindBaseClass.h"


NSString *const ktrainkindBaseClassCharge = @"charge";
NSString *const ktrainkindBaseClassRemark = @"remark";
NSString *const ktrainkindBaseClassCreateTime = @"createTime";
NSString *const ktrainkindBaseClassEndTime = @"endTime";
NSString *const ktrainkindBaseClassId = @"id";
NSString *const ktrainkindBaseClassCreater = @"creater";
NSString *const ktrainkindBaseClassIntegral = @"integral";
NSString *const ktrainkindBaseClassChargeStr = @"chargeStr";
NSString *const ktrainkindBaseClassName = @"name";
NSString *const ktrainkindBaseClassState = @"state";


@interface trainkindBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation trainkindBaseClass

@synthesize charge = _charge;
@synthesize remark = _remark;
@synthesize createTime = _createTime;
@synthesize endTime = _endTime;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize creater = _creater;
@synthesize integral = _integral;
@synthesize chargeStr = _chargeStr;
@synthesize name = _name;
@synthesize state = _state;


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
            self.charge = [[self objectOrNilForKey:ktrainkindBaseClassCharge fromDictionary:dict] doubleValue];
            self.remark = [self objectOrNilForKey:ktrainkindBaseClassRemark fromDictionary:dict];
            self.createTime = [self objectOrNilForKey:ktrainkindBaseClassCreateTime fromDictionary:dict];
            self.endTime = [self objectOrNilForKey:ktrainkindBaseClassEndTime fromDictionary:dict];
            self.internalBaseClassIdentifier = [[self objectOrNilForKey:ktrainkindBaseClassId fromDictionary:dict] doubleValue];
            self.creater = [[self objectOrNilForKey:ktrainkindBaseClassCreater fromDictionary:dict] doubleValue];
            self.integral = [[self objectOrNilForKey:ktrainkindBaseClassIntegral fromDictionary:dict] doubleValue];
            self.chargeStr = [self objectOrNilForKey:ktrainkindBaseClassChargeStr fromDictionary:dict];
            self.name = [self objectOrNilForKey:ktrainkindBaseClassName fromDictionary:dict];
            self.state = [self objectOrNilForKey:ktrainkindBaseClassState fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.charge] forKey:ktrainkindBaseClassCharge];
    [mutableDict setValue:self.remark forKey:ktrainkindBaseClassRemark];
    [mutableDict setValue:self.createTime forKey:ktrainkindBaseClassCreateTime];
    [mutableDict setValue:self.endTime forKey:ktrainkindBaseClassEndTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:ktrainkindBaseClassId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.creater] forKey:ktrainkindBaseClassCreater];
    [mutableDict setValue:[NSNumber numberWithDouble:self.integral] forKey:ktrainkindBaseClassIntegral];
    [mutableDict setValue:self.chargeStr forKey:ktrainkindBaseClassChargeStr];
    [mutableDict setValue:self.name forKey:ktrainkindBaseClassName];
    [mutableDict setValue:self.state forKey:ktrainkindBaseClassState];

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

    self.charge = [aDecoder decodeDoubleForKey:ktrainkindBaseClassCharge];
    self.remark = [aDecoder decodeObjectForKey:ktrainkindBaseClassRemark];
    self.createTime = [aDecoder decodeObjectForKey:ktrainkindBaseClassCreateTime];
    self.endTime = [aDecoder decodeObjectForKey:ktrainkindBaseClassEndTime];
    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:ktrainkindBaseClassId];
    self.creater = [aDecoder decodeDoubleForKey:ktrainkindBaseClassCreater];
    self.integral = [aDecoder decodeDoubleForKey:ktrainkindBaseClassIntegral];
    self.chargeStr = [aDecoder decodeObjectForKey:ktrainkindBaseClassChargeStr];
    self.name = [aDecoder decodeObjectForKey:ktrainkindBaseClassName];
    self.state = [aDecoder decodeObjectForKey:ktrainkindBaseClassState];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_charge forKey:ktrainkindBaseClassCharge];
    [aCoder encodeObject:_remark forKey:ktrainkindBaseClassRemark];
    [aCoder encodeObject:_createTime forKey:ktrainkindBaseClassCreateTime];
    [aCoder encodeObject:_endTime forKey:ktrainkindBaseClassEndTime];
    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:ktrainkindBaseClassId];
    [aCoder encodeDouble:_creater forKey:ktrainkindBaseClassCreater];
    [aCoder encodeDouble:_integral forKey:ktrainkindBaseClassIntegral];
    [aCoder encodeObject:_chargeStr forKey:ktrainkindBaseClassChargeStr];
    [aCoder encodeObject:_name forKey:ktrainkindBaseClassName];
    [aCoder encodeObject:_state forKey:ktrainkindBaseClassState];
}

- (id)copyWithZone:(NSZone *)zone
{
    trainkindBaseClass *copy = [[trainkindBaseClass alloc] init];
    
    if (copy) {

        copy.charge = self.charge;
        copy.remark = [self.remark copyWithZone:zone];
        copy.createTime = [self.createTime copyWithZone:zone];
        copy.endTime = [self.endTime copyWithZone:zone];
        copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
        copy.creater = self.creater;
        copy.integral = self.integral;
        copy.chargeStr = [self.chargeStr copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.state = [self.state copyWithZone:zone];
    }
    
    return copy;
}


@end
