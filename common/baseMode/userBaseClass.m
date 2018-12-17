//
//  userBaseClass.m
//
//  Created by   on 2018/12/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "userBaseClass.h"


NSString *const kuserBaseClassAccount = @"account";
NSString *const kuserBaseClassId = @"id";
NSString *const kuserBaseClassTelephone = @"telephone";
NSString *const kuserBaseClassDel = @"del";
NSString *const kuserBaseClassType = @"type";


@interface userBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation userBaseClass

@synthesize account = _account;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize telephone = _telephone;
@synthesize del = _del;
@synthesize type = _type;


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
            self.account = [self objectOrNilForKey:kuserBaseClassAccount fromDictionary:dict];
            self.internalBaseClassIdentifier = [[self objectOrNilForKey:kuserBaseClassId fromDictionary:dict] doubleValue];
            self.telephone = [self objectOrNilForKey:kuserBaseClassTelephone fromDictionary:dict];
            self.del = [self objectOrNilForKey:kuserBaseClassDel fromDictionary:dict];
            self.type = [self objectOrNilForKey:kuserBaseClassType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.account forKey:kuserBaseClassAccount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:kuserBaseClassId];
    [mutableDict setValue:self.telephone forKey:kuserBaseClassTelephone];
    [mutableDict setValue:self.del forKey:kuserBaseClassDel];
    [mutableDict setValue:self.type forKey:kuserBaseClassType];

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

    self.account = [aDecoder decodeObjectForKey:kuserBaseClassAccount];
    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kuserBaseClassId];
    self.telephone = [aDecoder decodeObjectForKey:kuserBaseClassTelephone];
    self.del = [aDecoder decodeObjectForKey:kuserBaseClassDel];
    self.type = [aDecoder decodeObjectForKey:kuserBaseClassType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_account forKey:kuserBaseClassAccount];
    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kuserBaseClassId];
    [aCoder encodeObject:_telephone forKey:kuserBaseClassTelephone];
    [aCoder encodeObject:_del forKey:kuserBaseClassDel];
    [aCoder encodeObject:_type forKey:kuserBaseClassType];
}

- (id)copyWithZone:(NSZone *)zone
{
    userBaseClass *copy = [[userBaseClass alloc] init];
    
    if (copy) {

        copy.account = [self.account copyWithZone:zone];
        copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
        copy.telephone = [self.telephone copyWithZone:zone];
        copy.del = [self.del copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end
