//
//  RechargeMainView.h
//  eduaction_app
//
//  Created by Mac on 2018/11/12.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RechargeMainView : UIView

@property (nonatomic, strong) UIButton *btn_time;
@property (nonatomic, strong) UIButton *btn_left;
@property (nonatomic, strong) UIButton *btn_center;
@property (nonatomic, strong) UIButton *btn_right;


@property (nonatomic, copy) void (^blockCharge)(NSString *number);

//- (instancetype)initWithFrame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
