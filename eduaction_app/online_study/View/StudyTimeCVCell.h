//
//  StudyTimeCVCell.h
//  eduaction_app
//
//  Created by Mac on 2018/11/5.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StudyTimeCVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *view_back;//背景

@property (weak, nonatomic) IBOutlet UIImageView *img_main;
@property (weak, nonatomic) IBOutlet UIButton *btn_recharge;//充值
@property (weak, nonatomic) IBOutlet UILabel *lbl_time;//倒计时
@property (weak, nonatomic) IBOutlet UILabel *lbl_number;//完成量
@property (weak, nonatomic) IBOutlet UILabel *lbl_lastTime;//到期

@property (weak, nonatomic) IBOutlet UIImageView *img_clock;//钟表
@property (weak, nonatomic) IBOutlet UIButton *btn_detail;
@property (weak, nonatomic) IBOutlet UIButton *btn_goOn;

@end

NS_ASSUME_NONNULL_END
