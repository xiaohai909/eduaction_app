//
//  MakeProblemMainModel.h
//  eduaction_app
//
//  Created by Mac on 2018/11/16.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MakeProblemMainModel : NSObject
@property (nonatomic, copy) NSString *selelct;
@property (nonatomic, assign, readonly) BOOL isSelelct;
@property (nonatomic, assign, readonly) BOOL selectTrue;

- (BOOL)isTrueResult:(NSString *)result;
@end

NS_ASSUME_NONNULL_END
