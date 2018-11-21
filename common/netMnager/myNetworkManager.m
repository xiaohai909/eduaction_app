//
//  myNetworkManager.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/18.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "myNetworkManager.h"

@implementation myNetworkManager
+(myNetworkManager *)sharemyNetworkManager
{
    
    static myNetworkManager * Mangager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (Mangager == nil)
        {
            Mangager = [self new];
        }
    });
    return Mangager;
}
@end
