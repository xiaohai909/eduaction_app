//
//  MakeProblemCardModel.h
//  eduaction_app
//
//  Created by Mac on 2018/12/12.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MakeProblemCardModel : NSObject
@property (nonatomic, copy) NSString *answerId;
@property (nonatomic, copy) NSString *correct;
@property (nonatomic, copy) NSString *questionId;
@property (nonatomic, copy) NSString *rownum;
@end

NS_ASSUME_NONNULL_END
