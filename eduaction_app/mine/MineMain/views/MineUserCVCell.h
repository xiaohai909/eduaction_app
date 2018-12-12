//
//  MineUserCVCell.h
//  eduaction_app
//
//  Created by Mac on 2018/11/27.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineUserCVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (weak, nonatomic) IBOutlet UIButton *btn_head;
@property (weak, nonatomic) IBOutlet UILabel *lbl_detail;
@property (weak, nonatomic) IBOutlet UIImageView *image_arrow;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lbl_title_left;//17
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btn_head_right;//67

@end

NS_ASSUME_NONNULL_END
