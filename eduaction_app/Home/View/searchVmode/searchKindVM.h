//
//  searchKindVM.h
//  eduaction_app
//
//  Created by legendlxd on 2018/11/21.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface searchKindVM : NSObject
-(void)resetFunction:(NSArray *)dataList;
-(NSArray *)packageDataList:(NSMutableArray *)tittleArr;
@end

NS_ASSUME_NONNULL_END
