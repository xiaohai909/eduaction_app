//
//  TopfilteringV.h
//  eduaction_app
//
//  Created by legendlxd on 2018/11/19.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "searchKindVM.h"
NS_ASSUME_NONNULL_BEGIN

@interface TopfilteringV : UIView
@property (nonatomic,strong)searchKindVM *viewMode;
@property (strong, nonatomic) ZYSideSlipFilterController *filterController;
-(void)setfilterV:(UIViewController *)view;
@end

NS_ASSUME_NONNULL_END
