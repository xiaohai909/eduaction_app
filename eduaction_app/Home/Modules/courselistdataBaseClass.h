//
//  courselistdataBaseClass.h
//
//  Created by   on 2018/12/24
//  Copyright (c) 2018 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface courselistdataBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *queryEndTime;
@property (nonatomic, strong) NSString *isFree;
@property (nonatomic, strong) NSString *remark;
@property (nonatomic, assign) double integral;
@property (nonatomic, strong) NSString *parentType;
@property (nonatomic, strong) NSString *del;
@property (nonatomic, strong) NSString *iconStr;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *isFreeTxt;
@property (nonatomic, assign) double lineCount;
@property (nonatomic, strong) NSString *backimgUrl;
@property (nonatomic, strong) NSString *teacherName;
@property (nonatomic, strong) NSString *endTime;
@property (nonatomic, strong) NSString *queryStartTime;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, assign) double teacherId;
@property (nonatomic, assign) double internalBaseClassIdentifier;
@property (nonatomic, assign) double kechengId;
@property (nonatomic, strong) NSString *txt;
@property (nonatomic, assign) double backimg;
@property (nonatomic, strong) NSString *charteMode;
@property (nonatomic, strong) NSString *startTime;
@property (nonatomic, assign) double charge;
@property (nonatomic, strong) NSString *introduction;
@property (nonatomic, strong) NSString *chargeStr;
@property (nonatomic, strong) NSString *charteModeStr;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
