//
//  courselistdataBaseClass.m
//
//  Created by   on 2018/12/24
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import "courselistdataBaseClass.h"


NSString *const kcourselistdataBaseClassQueryEndTime = @"queryEndTime";
NSString *const kcourselistdataBaseClassIsFree = @"isFree";
NSString *const kcourselistdataBaseClassRemark = @"remark";
NSString *const kcourselistdataBaseClassIntegral = @"integral";
NSString *const kcourselistdataBaseClassParentType = @"parentType";
NSString *const kcourselistdataBaseClassDel = @"del";
NSString *const kcourselistdataBaseClassIconStr = @"iconStr";
NSString *const kcourselistdataBaseClassIcon = @"icon";
NSString *const kcourselistdataBaseClassIsFreeTxt = @"isFreeTxt";
NSString *const kcourselistdataBaseClassLineCount = @"lineCount";
NSString *const kcourselistdataBaseClassBackimgUrl = @"backimgUrl";
NSString *const kcourselistdataBaseClassTeacherName = @"teacherName";
NSString *const kcourselistdataBaseClassEndTime = @"endTime";
NSString *const kcourselistdataBaseClassQueryStartTime = @"queryStartTime";
NSString *const kcourselistdataBaseClassName = @"name";
NSString *const kcourselistdataBaseClassType = @"type";
NSString *const kcourselistdataBaseClassState = @"state";
NSString *const kcourselistdataBaseClassTeacherId = @"teacherId";
NSString *const kcourselistdataBaseClassId = @"id";
NSString *const kcourselistdataBaseClassKechengId = @"kechengId";
NSString *const kcourselistdataBaseClassTxt = @"txt";
NSString *const kcourselistdataBaseClassBackimg = @"backimg";
NSString *const kcourselistdataBaseClassCharteMode = @"charteMode";
NSString *const kcourselistdataBaseClassStartTime = @"startTime";
NSString *const kcourselistdataBaseClassCharge = @"charge";
NSString *const kcourselistdataBaseClassIntroduction = @"introduction";
NSString *const kcourselistdataBaseClassChargeStr = @"chargeStr";
NSString *const kcourselistdataBaseClassCharteModeStr = @"charteModeStr";


@interface courselistdataBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation courselistdataBaseClass

@synthesize queryEndTime = _queryEndTime;
@synthesize isFree = _isFree;
@synthesize remark = _remark;
@synthesize integral = _integral;
@synthesize parentType = _parentType;
@synthesize del = _del;
@synthesize iconStr = _iconStr;
@synthesize icon = _icon;
@synthesize isFreeTxt = _isFreeTxt;
@synthesize lineCount = _lineCount;
@synthesize backimgUrl = _backimgUrl;
@synthesize teacherName = _teacherName;
@synthesize endTime = _endTime;
@synthesize queryStartTime = _queryStartTime;
@synthesize name = _name;
@synthesize type = _type;
@synthesize state = _state;
@synthesize teacherId = _teacherId;
@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize kechengId = _kechengId;
@synthesize txt = _txt;
@synthesize backimg = _backimg;
@synthesize charteMode = _charteMode;
@synthesize startTime = _startTime;
@synthesize charge = _charge;
@synthesize introduction = _introduction;
@synthesize chargeStr = _chargeStr;
@synthesize charteModeStr = _charteModeStr;


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
            self.queryEndTime = [self objectOrNilForKey:kcourselistdataBaseClassQueryEndTime fromDictionary:dict];
            self.isFree = [self objectOrNilForKey:kcourselistdataBaseClassIsFree fromDictionary:dict];
            self.remark = [self objectOrNilForKey:kcourselistdataBaseClassRemark fromDictionary:dict];
            self.integral = [[self objectOrNilForKey:kcourselistdataBaseClassIntegral fromDictionary:dict] doubleValue];
            self.parentType = [self objectOrNilForKey:kcourselistdataBaseClassParentType fromDictionary:dict];
            self.del = [self objectOrNilForKey:kcourselistdataBaseClassDel fromDictionary:dict];
            self.iconStr = [self objectOrNilForKey:kcourselistdataBaseClassIconStr fromDictionary:dict];
            self.icon = [self objectOrNilForKey:kcourselistdataBaseClassIcon fromDictionary:dict];
            self.isFreeTxt = [self objectOrNilForKey:kcourselistdataBaseClassIsFreeTxt fromDictionary:dict];
            self.lineCount = [[self objectOrNilForKey:kcourselistdataBaseClassLineCount fromDictionary:dict] doubleValue];
            self.backimgUrl = [self objectOrNilForKey:kcourselistdataBaseClassBackimgUrl fromDictionary:dict];
            self.teacherName = [self objectOrNilForKey:kcourselistdataBaseClassTeacherName fromDictionary:dict];
            self.endTime = [self objectOrNilForKey:kcourselistdataBaseClassEndTime fromDictionary:dict];
            self.queryStartTime = [self objectOrNilForKey:kcourselistdataBaseClassQueryStartTime fromDictionary:dict];
            self.name = [self objectOrNilForKey:kcourselistdataBaseClassName fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kcourselistdataBaseClassType fromDictionary:dict] doubleValue];
            self.state = [self objectOrNilForKey:kcourselistdataBaseClassState fromDictionary:dict];
            self.teacherId = [[self objectOrNilForKey:kcourselistdataBaseClassTeacherId fromDictionary:dict] doubleValue];
            self.internalBaseClassIdentifier = [[self objectOrNilForKey:kcourselistdataBaseClassId fromDictionary:dict] doubleValue];
            self.kechengId = [[self objectOrNilForKey:kcourselistdataBaseClassKechengId fromDictionary:dict] doubleValue];
            self.txt = [self objectOrNilForKey:kcourselistdataBaseClassTxt fromDictionary:dict];
            self.backimg = [[self objectOrNilForKey:kcourselistdataBaseClassBackimg fromDictionary:dict] doubleValue];
            self.charteMode = [self objectOrNilForKey:kcourselistdataBaseClassCharteMode fromDictionary:dict];
            self.startTime = [self objectOrNilForKey:kcourselistdataBaseClassStartTime fromDictionary:dict];
            self.charge = [[self objectOrNilForKey:kcourselistdataBaseClassCharge fromDictionary:dict] doubleValue];
            self.introduction = [self objectOrNilForKey:kcourselistdataBaseClassIntroduction fromDictionary:dict];
            self.chargeStr = [self objectOrNilForKey:kcourselistdataBaseClassChargeStr fromDictionary:dict];
            self.charteModeStr = [self objectOrNilForKey:kcourselistdataBaseClassCharteModeStr fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.queryEndTime forKey:kcourselistdataBaseClassQueryEndTime];
    [mutableDict setValue:self.isFree forKey:kcourselistdataBaseClassIsFree];
    [mutableDict setValue:self.remark forKey:kcourselistdataBaseClassRemark];
    [mutableDict setValue:[NSNumber numberWithDouble:self.integral] forKey:kcourselistdataBaseClassIntegral];
    [mutableDict setValue:self.parentType forKey:kcourselistdataBaseClassParentType];
    [mutableDict setValue:self.del forKey:kcourselistdataBaseClassDel];
    [mutableDict setValue:self.iconStr forKey:kcourselistdataBaseClassIconStr];
    [mutableDict setValue:self.icon forKey:kcourselistdataBaseClassIcon];
    [mutableDict setValue:self.isFreeTxt forKey:kcourselistdataBaseClassIsFreeTxt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lineCount] forKey:kcourselistdataBaseClassLineCount];
    [mutableDict setValue:self.backimgUrl forKey:kcourselistdataBaseClassBackimgUrl];
    [mutableDict setValue:self.teacherName forKey:kcourselistdataBaseClassTeacherName];
    [mutableDict setValue:self.endTime forKey:kcourselistdataBaseClassEndTime];
    [mutableDict setValue:self.queryStartTime forKey:kcourselistdataBaseClassQueryStartTime];
    [mutableDict setValue:self.name forKey:kcourselistdataBaseClassName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kcourselistdataBaseClassType];
    [mutableDict setValue:self.state forKey:kcourselistdataBaseClassState];
    [mutableDict setValue:[NSNumber numberWithDouble:self.teacherId] forKey:kcourselistdataBaseClassTeacherId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.internalBaseClassIdentifier] forKey:kcourselistdataBaseClassId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.kechengId] forKey:kcourselistdataBaseClassKechengId];
    [mutableDict setValue:self.txt forKey:kcourselistdataBaseClassTxt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.backimg] forKey:kcourselistdataBaseClassBackimg];
    [mutableDict setValue:self.charteMode forKey:kcourselistdataBaseClassCharteMode];
    [mutableDict setValue:self.startTime forKey:kcourselistdataBaseClassStartTime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.charge] forKey:kcourselistdataBaseClassCharge];
    [mutableDict setValue:self.introduction forKey:kcourselistdataBaseClassIntroduction];
    [mutableDict setValue:self.chargeStr forKey:kcourselistdataBaseClassChargeStr];
    [mutableDict setValue:self.charteModeStr forKey:kcourselistdataBaseClassCharteModeStr];

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

    self.queryEndTime = [aDecoder decodeObjectForKey:kcourselistdataBaseClassQueryEndTime];
    self.isFree = [aDecoder decodeObjectForKey:kcourselistdataBaseClassIsFree];
    self.remark = [aDecoder decodeObjectForKey:kcourselistdataBaseClassRemark];
    self.integral = [aDecoder decodeDoubleForKey:kcourselistdataBaseClassIntegral];
    self.parentType = [aDecoder decodeObjectForKey:kcourselistdataBaseClassParentType];
    self.del = [aDecoder decodeObjectForKey:kcourselistdataBaseClassDel];
    self.iconStr = [aDecoder decodeObjectForKey:kcourselistdataBaseClassIconStr];
    self.icon = [aDecoder decodeObjectForKey:kcourselistdataBaseClassIcon];
    self.isFreeTxt = [aDecoder decodeObjectForKey:kcourselistdataBaseClassIsFreeTxt];
    self.lineCount = [aDecoder decodeDoubleForKey:kcourselistdataBaseClassLineCount];
    self.backimgUrl = [aDecoder decodeObjectForKey:kcourselistdataBaseClassBackimgUrl];
    self.teacherName = [aDecoder decodeObjectForKey:kcourselistdataBaseClassTeacherName];
    self.endTime = [aDecoder decodeObjectForKey:kcourselistdataBaseClassEndTime];
    self.queryStartTime = [aDecoder decodeObjectForKey:kcourselistdataBaseClassQueryStartTime];
    self.name = [aDecoder decodeObjectForKey:kcourselistdataBaseClassName];
    self.type = [aDecoder decodeDoubleForKey:kcourselistdataBaseClassType];
    self.state = [aDecoder decodeObjectForKey:kcourselistdataBaseClassState];
    self.teacherId = [aDecoder decodeDoubleForKey:kcourselistdataBaseClassTeacherId];
    self.internalBaseClassIdentifier = [aDecoder decodeDoubleForKey:kcourselistdataBaseClassId];
    self.kechengId = [aDecoder decodeDoubleForKey:kcourselistdataBaseClassKechengId];
    self.txt = [aDecoder decodeObjectForKey:kcourselistdataBaseClassTxt];
    self.backimg = [aDecoder decodeDoubleForKey:kcourselistdataBaseClassBackimg];
    self.charteMode = [aDecoder decodeObjectForKey:kcourselistdataBaseClassCharteMode];
    self.startTime = [aDecoder decodeObjectForKey:kcourselistdataBaseClassStartTime];
    self.charge = [aDecoder decodeDoubleForKey:kcourselistdataBaseClassCharge];
    self.introduction = [aDecoder decodeObjectForKey:kcourselistdataBaseClassIntroduction];
    self.chargeStr = [aDecoder decodeObjectForKey:kcourselistdataBaseClassChargeStr];
    self.charteModeStr = [aDecoder decodeObjectForKey:kcourselistdataBaseClassCharteModeStr];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_queryEndTime forKey:kcourselistdataBaseClassQueryEndTime];
    [aCoder encodeObject:_isFree forKey:kcourselistdataBaseClassIsFree];
    [aCoder encodeObject:_remark forKey:kcourselistdataBaseClassRemark];
    [aCoder encodeDouble:_integral forKey:kcourselistdataBaseClassIntegral];
    [aCoder encodeObject:_parentType forKey:kcourselistdataBaseClassParentType];
    [aCoder encodeObject:_del forKey:kcourselistdataBaseClassDel];
    [aCoder encodeObject:_iconStr forKey:kcourselistdataBaseClassIconStr];
    [aCoder encodeObject:_icon forKey:kcourselistdataBaseClassIcon];
    [aCoder encodeObject:_isFreeTxt forKey:kcourselistdataBaseClassIsFreeTxt];
    [aCoder encodeDouble:_lineCount forKey:kcourselistdataBaseClassLineCount];
    [aCoder encodeObject:_backimgUrl forKey:kcourselistdataBaseClassBackimgUrl];
    [aCoder encodeObject:_teacherName forKey:kcourselistdataBaseClassTeacherName];
    [aCoder encodeObject:_endTime forKey:kcourselistdataBaseClassEndTime];
    [aCoder encodeObject:_queryStartTime forKey:kcourselistdataBaseClassQueryStartTime];
    [aCoder encodeObject:_name forKey:kcourselistdataBaseClassName];
    [aCoder encodeDouble:_type forKey:kcourselistdataBaseClassType];
    [aCoder encodeObject:_state forKey:kcourselistdataBaseClassState];
    [aCoder encodeDouble:_teacherId forKey:kcourselistdataBaseClassTeacherId];
    [aCoder encodeDouble:_internalBaseClassIdentifier forKey:kcourselistdataBaseClassId];
    [aCoder encodeDouble:_kechengId forKey:kcourselistdataBaseClassKechengId];
    [aCoder encodeObject:_txt forKey:kcourselistdataBaseClassTxt];
    [aCoder encodeDouble:_backimg forKey:kcourselistdataBaseClassBackimg];
    [aCoder encodeObject:_charteMode forKey:kcourselistdataBaseClassCharteMode];
    [aCoder encodeObject:_startTime forKey:kcourselistdataBaseClassStartTime];
    [aCoder encodeDouble:_charge forKey:kcourselistdataBaseClassCharge];
    [aCoder encodeObject:_introduction forKey:kcourselistdataBaseClassIntroduction];
    [aCoder encodeObject:_chargeStr forKey:kcourselistdataBaseClassChargeStr];
    [aCoder encodeObject:_charteModeStr forKey:kcourselistdataBaseClassCharteModeStr];
}

- (id)copyWithZone:(NSZone *)zone
{
    courselistdataBaseClass *copy = [[courselistdataBaseClass alloc] init];
    
    if (copy) {

        copy.queryEndTime = [self.queryEndTime copyWithZone:zone];
        copy.isFree = [self.isFree copyWithZone:zone];
        copy.remark = [self.remark copyWithZone:zone];
        copy.integral = self.integral;
        copy.parentType = [self.parentType copyWithZone:zone];
        copy.del = [self.del copyWithZone:zone];
        copy.iconStr = [self.iconStr copyWithZone:zone];
        copy.icon = [self.icon copyWithZone:zone];
        copy.isFreeTxt = [self.isFreeTxt copyWithZone:zone];
        copy.lineCount = self.lineCount;
        copy.backimgUrl = [self.backimgUrl copyWithZone:zone];
        copy.teacherName = [self.teacherName copyWithZone:zone];
        copy.endTime = [self.endTime copyWithZone:zone];
        copy.queryStartTime = [self.queryStartTime copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.type = self.type;
        copy.state = [self.state copyWithZone:zone];
        copy.teacherId = self.teacherId;
        copy.internalBaseClassIdentifier = self.internalBaseClassIdentifier;
        copy.kechengId = self.kechengId;
        copy.txt = [self.txt copyWithZone:zone];
        copy.backimg = self.backimg;
        copy.charteMode = [self.charteMode copyWithZone:zone];
        copy.startTime = [self.startTime copyWithZone:zone];
        copy.charge = self.charge;
        copy.introduction = [self.introduction copyWithZone:zone];
        copy.chargeStr = [self.chargeStr copyWithZone:zone];
        copy.charteModeStr = [self.charteModeStr copyWithZone:zone];
    }
    
    return copy;
}


@end
