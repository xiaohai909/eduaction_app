//
//  RechargeMainView.h
//  eduaction_app
//
//  Created by Mac on 2018/11/12.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RechargeModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface RechargeMainView : UIView

@property (nonatomic, strong) UIImageView *image_bg;
@property (nonatomic, strong) UIButton *btn_time;
@property (nonatomic, strong) UIButton *btn_left;
@property (nonatomic, strong) UIButton *btn_center;
@property (nonatomic, strong) UIButton *btn_right;

@property (nonatomic, strong) UIButton *btn_Alipay;
@property (nonatomic, strong) UIButton *btn_Weixin;
@property (nonatomic, copy) void (^blockCharge)(RechargeModel *model);
@property (nonatomic, copy) void (^blockPayType)(NSInteger type);

- (void)setModels:(NSMutableArray *)models;
@end

NS_ASSUME_NONNULL_END
