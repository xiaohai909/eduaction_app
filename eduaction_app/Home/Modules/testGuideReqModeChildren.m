//
//  testGuideReqModeChildren.m
//
//  Created by   on 2018/12/17
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "testGuideReqModeChildren.h"


NSString *const ktestGuideReqModeChildrenParentId = @"parentId";
NSString *const ktestGuideReqModeChildrenTagStr = @"tagStr";
NSString *const ktestGuideReqModeChildrenParentName = @"parentName";
NSString *const ktestGuideReqModeChildrenId = @"id";
NSString *const ktestGuideReqModeChildrenChildren = @"children";
NSString *const ktestGuideReqModeChildrenLevel = @"level";
NSString *const ktestGuideReqModeChildrenName = @"name";


@interface testGuideReqModeChildren ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation testGuideReqModeChildren

@synthesize parentId = _parentId;
@synthesize tagStr = _tagStr;
@synthesize parentName = _parentName;
@synthesize childrenIdentifier = _childrenIdentifier;
@synthesize children = _children;
@synthesize level = _level;
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
            self.parentId = [[self objectOrNilForKey:ktestGuideReqModeChildrenParentId fromDictionary:dict] doubleValue];
            self.tagStr = [self objectOrNilForKey:ktestGuideReqModeChildrenTagStr fromDictionary:dict];
            self.parentName = [self objectOrNilForKey:ktestGuideReqModeChildrenParentName fromDictionary:dict];
            self.childrenIdentifier = [[self objectOrNilForKey:ktestGuideReqModeChildrenId fromDictionary:dict] doubleValue];
            self.children = [self objectOrNilForKey:ktestGuideReqModeChildrenChildren fromDictionary:dict];
            self.level = [[self objectOrNilForKey:ktestGuideReqModeChildrenLevel fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:ktestGuideReqModeChildrenName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.parentId] forKey:ktestGuideReqModeChildrenParentId];
    [mutableDict setValue:self.tagStr forKey:ktestGuideReqModeChildrenTagStr];
    [mutableDict setValue:self.parentName forKey:ktestGuideReqModeChildrenParentName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.childrenIdentifier] forKey:ktestGuideReqModeChildrenId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForChildren] forKey:ktestGuideReqModeChildrenChildren];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:ktestGuideReqModeChildrenLevel];
    [mutableDict setValue:self.name forKey:ktestGuideReqModeChildrenName];

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

    self.parentId = [aDecoder decodeDoubleForKey:ktestGuideReqModeChildrenParentId];
    self.tagStr = [aDecoder decodeObjectForKey:ktestGuideReqModeChildrenTagStr];
    self.parentName = [aDecoder decodeObjectForKey:ktestGuideReqModeChildrenParentName];
    self.childrenIdentifier = [aDecoder decodeDoubleForKey:ktestGuideReqModeChildrenId];
    self.children = [aDecoder decodeObjectForKey:ktestGuideReqModeChildrenChildren];
    self.level = [aDecoder decodeDoubleForKey:ktestGuideReqModeChildrenLevel];
    self.name = [aDecoder decodeObjectForKey:ktestGuideReqModeChildrenName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_parentId forKey:ktestGuideReqModeChildrenParentId];
    [aCoder encodeObject:_tagStr forKey:ktestGuideReqModeChildrenTagStr];
    [aCoder encodeObject:_parentName forKey:ktestGuideReqModeChildrenParentName];
    [aCoder encodeDouble:_childrenIdentifier forKey:ktestGuideReqModeChildrenId];
    [aCoder encodeObject:_children forKey:ktestGuideReqModeChildrenChildren];
    [aCoder encodeDouble:_level forKey:ktestGuideReqModeChildrenLevel];
    [aCoder encodeObject:_name forKey:ktestGuideReqModeChildrenName];
}

- (id)copyWithZone:(NSZone *)zone
{
    testGuideReqModeChildren *copy = [[testGuideReqModeChildren alloc] init];
    
    if (copy) {

        copy.parentId = self.parentId;
        copy.tagStr = [self.tagStr copyWithZone:zone];
        copy.parentName = [self.parentName copyWithZone:zone];
        copy.childrenIdentifier = self.childrenIdentifier;
        copy.children = [self.children copyWithZone:zone];
        copy.level = self.level;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
