//
//  RechargeMainBottomView.h
//  eduaction_app
//
//  Created by Mac on 2018/11/13.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    BottomViewTypeRecharge,//充值界面
    BottomViewTypeCollection,//收藏的题目界面   
} BottomViewType;

@interface RechargeMainBottomView : UIView
@property (nonatomic, strong) UIButton *btn_left;
@property (nonatomic, copy) void (^blockActionClick)(NSString *title);

- (instancetype)initWithFrame:(CGRect)frame andViewType:(BottomViewType)viewType;
@end

NS_ASSUME_NONNULL_END
