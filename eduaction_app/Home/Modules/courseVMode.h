//
//  courseVMode.h
//  eduaction_app
//
//  Created by legendlxd on 2018/12/23.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface courseVMode : NSObject
@property (nonatomic,strong)RACCommand *dataReqCommand;
@property (nonatomic,strong)RACCommand *kindoftrainReqCommand;
@property (nonatomic,strong)RACCommand *queryKemuByPeixunbanIdCommand;
@property (nonatomic,strong)RACCommand *kemulistReqCommand;
@end

NS_ASSUME_NONNULL_END
