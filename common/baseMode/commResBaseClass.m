//
//  commResBaseClass.m
//
//  Created by   on 2018/12/2
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "commResBaseClass.h"
#import "commResResultObj.h"


NSString *const kcommResBaseClassResultMsg = @"resultMsg";
NSString *const kcommResBaseClassResultObj = @"resultObj";
NSString *const kcommResBaseClassResultCode = @"resultCode";


@interface commResBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation commResBaseClass

@synthesize resultMsg = _resultMsg;
@synthesize resultObj = _resultObj;
@synthesize resultCode = _resultCode;


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
            self.resultMsg = [self objectOrNilForKey:kcommResBaseClassResultMsg fromDictionary:dict];
            self.resultObj = [commResResultObj modelObjectWithDictionary:[dict objectForKey:kcommResBaseClassResultObj]];
            NSLog(@"%@",[self.resultObj dictionaryRepresentation]);
        
        if ([dict objectForKey:kcommResBaseClassResultObj] != nil) {
            if ([[dict objectForKey:kcommResBaseClassResultObj] isKindOfClass:[NSDictionary class]]) {
                
                  self.resultObj_dic = [[NSMutableDictionary alloc]initWithDictionary:[dict objectForKey:kcommResBaseClassResultObj]];
            }
            else if ([[dict objectForKey:kcommResBaseClassResultObj] isKindOfClass:[NSArray class]]){
                
                self.resultObj_arr = [[NSMutableArray alloc]initWithArray:[dict objectForKey:kcommResBaseClassResultObj]];
            }
          
        }
        self.resultCode = [[self objectOrNilForKey:kcommResBaseClassResultCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.resultMsg forKey:kcommResBaseClassResultMsg];
    [mutableDict setValue:[self.resultObj dictionaryRepresentation] forKey:kcommResBaseClassResultObj];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resultCode] forKey:kcommResBaseClassResultCode];

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

    self.resultMsg = [aDecoder decodeObjectForKey:kcommResBaseClassResultMsg];
    self.resultObj = [aDecoder decodeObjectForKey:kcommResBaseClassResultObj];
    self.resultCode = [aDecoder decodeDoubleForKey:kcommResBaseClassResultCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_resultMsg forKey:kcommResBaseClassResultMsg];
    [aCoder encodeObject:_resultObj forKey:kcommResBaseClassResultObj];
    [aCoder encodeDouble:_resultCode forKey:kcommResBaseClassResultCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    commResBaseClass *copy = [[commResBaseClass alloc] init];
    
    if (copy) {

        copy.resultMsg = [self.resultMsg copyWithZone:zone];
        copy.resultObj = [self.resultObj copyWithZone:zone];
        copy.resultCode = self.resultCode;
    }
    
    return copy;
}


@end
