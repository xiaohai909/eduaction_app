//
//  ConsolidateMainHeadCVCell.h
//  eduaction_app
//
//  Created by Mac on 2018/11/8.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatioView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ConsolidateMainHeadCVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *btn_back;
@property (weak, nonatomic) IBOutlet RatioView *view_ratio;
@property (weak, nonatomic) IBOutlet UIButton *btn_right;
@property (weak, nonatomic) IBOutlet UIButton *btn_wrong;
@property (weak, nonatomic) IBOutlet UIButton *btn_undo;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btn_back_top;
@end

NS_ASSUME_NONNULL_END
