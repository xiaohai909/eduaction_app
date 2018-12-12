//
//  DataModel.h
//  eduaction_app
//
//  Created by Mac on 2018/11/28.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataModel : NSObject
@property (nonatomic, assign) NSInteger pageNumber;
@property (nonatomic, strong) NSMutableArray *result;
@end

NS_ASSUME_NONNULL_END
