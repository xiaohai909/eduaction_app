//
//  ZYSideSlipFilterController.h
//  ZYSideSlipFilter
//
//  Created by zhiyi on 16/10/14.
//  Copyright © 2016年 zhiyi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SideSlipFilterCommitBlock)(NSArray *dataList);
typedef void (^SideSlipFilterResetBlock)(NSArray *dataList);
typedef void (^SideSlipFilterdismiss)();

@interface ZYSideSlipFilterController : UIViewController
@property (assign, nonatomic) CGFloat animationDuration;
@property (assign, nonatomic) CGFloat sideSlipLeading;
@property (copy, nonatomic) NSArray *dataList;
@property (strong,nonatomic)UIButton *commitBtn;
@property (strong,nonatomic)UIView *BottomV;
- (instancetype)initWithSponsor:(UIViewController *)sponsor
                     resetBlock:(SideSlipFilterResetBlock)resetBlock
                    commitBlock:(SideSlipFilterCommitBlock)commitBlock;
- (void)show;
- (void)dismiss:(SideSlipFilterdismiss)dismissBlock;
- (void)reloadData;
@end
