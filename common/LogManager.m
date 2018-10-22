//
//  LogManager.m
//  DesAp
//
//  Created by legendlxd on 2018/1/17.
//  Copyright © 2018年 legendlxd. All rights reserved.
//

#import "LogManager.h"

@implementation LogManager
//[DDLog addLogger:[DDASLLogger sharedInstance]];
//[DDLog addLogger:[DDTTYLogger sharedInstance]];
//
////    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
////    fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
////    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
////    [DDLog addLogger:fileLogger];

+ (LogManager *)sharedManager{
    static LogManager *sharedLogManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedLogManagerInstance = [[self alloc] init];
    });
    return sharedLogManagerInstance;
}
-(instancetype)init{
    if ([super init]) {
       
        
        
    }
    return self;
}
-(void)config
{
    // Standard lumberjack initialization
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    DDFileLogger *fileLogger = nil;
    if ([paths count] > 0)
    {
        NSString *docDir = [paths objectAtIndex:0];
        DDLogFileManagerDefault *fileManager = [[DDLogFileManagerDefault alloc] initWithLogsDirectory:[docDir stringByAppendingString:@"/logs"]];
        fileLogger = [[DDFileLogger alloc] initWithLogFileManager:fileManager];
    }
    else
    {
        fileLogger = [[DDFileLogger alloc] init];
    }
    fileLogger.rollingFrequency = 60 * 60 * 24;
    fileLogger.logFileManager.maximumNumberOfLogFiles = 1000;
    fileLogger.logFileManager.logFilesDiskQuota = (1024*1024*1024);
    [DDLog addLogger:fileLogger];
    // And then enable colors
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    [[DDTTYLogger sharedInstance] setLogFormatter:self];
}

-(NSString *)formatLogMessage:(DDLogMessage *)logMessage{
    
    NSString *loglevel = nil;
    switch (logMessage.flag)
    {
        case DDLogFlagError:
        {
            loglevel = @"E:";
        }
            break;
        case DDLogFlagWarning:
        {
            loglevel = @"W:";
        }
            break;
        case DDLogFlagInfo:
        {
            loglevel = @"I:";
        }
            break;
        case DDLogFlagDebug:
        {
            loglevel = @"D:";
        }
            break;
        case DDLogFlagVerbose:
        {
            loglevel = @"V:";
        }
            break;
            
        default:
            loglevel = @"I:";
            break;
    }
    NSString *formatStr;

    NSDateFormatter *formatted = [[NSDateFormatter alloc]init];
    [formatted setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *nowtime = [formatted stringFromDate:[NSDate date]];
    
    formatStr = [NSString stringWithFormat:@"[%@]line[%ld]  %@ %@",logMessage->_fileName,logMessage->_line,nowtime, logMessage->_message];
    
    return formatStr;
}

#define MAX_LENGTH_VISABLE_FOR_LIB_LOG 3072
-(void)printLog:(NSString *)str
{
#ifdef MAX_LENGTH_VISABLE_FOR_LIB_LOG
    if ([str length] > MAX_LENGTH_VISABLE_FOR_LIB_LOG) {
        return;
    }
#endif //MAX_LENGTH_VISABLE_FOR_LIB_LOG
    
#ifdef FILTER_LOG
    NSRange range = [str rangeOfString:@"recv() EWOULDBLOCK"];
    if (range.location != NSNotFound) {
        return;
    }
#endif //FILTER_LOG
    
    DDLogVerbose(str, nil);
}

@end
