//
//  DataModel.m
//  eduaction_app
//
//  Created by Mac on 2018/11/28.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.pageNumber = 1;
        self.result = [NSMutableArray array];
    }
    return self;
}
@end
