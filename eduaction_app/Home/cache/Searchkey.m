//
//  Searchkey.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/7.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "Searchkey.h"
static NSString *const cacheName=@"homeSearchkey";
@implementation Searchkey
+ (instancetype)defaultcache{
    static Searchkey *cache = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        cache = [[Searchkey alloc] initWithName:cacheName];
    });
    return cache;
}
@end
