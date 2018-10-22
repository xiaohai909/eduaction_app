//
//  LogManager.h
//  DesAp
//
//  Created by legendlxd on 2018/1/17.
//  Copyright © 2018年 legendlxd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>
@interface LogManager : NSObject<DDLogFormatter>
+ (LogManager *)sharedManager;
-(void)config;
-(void)printLog:(NSString *)str;
@end
