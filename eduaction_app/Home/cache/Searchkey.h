//
//  Searchkey.h
//  eduaction_app
//
//  Created by legendlxd on 2018/11/7.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <YYCache/YYCache.h>

NS_ASSUME_NONNULL_BEGIN
#define searchkey @"searchkey"
@interface Searchkey : YYCache
+ (instancetype)defaultcache;
@end

NS_ASSUME_NONNULL_END
