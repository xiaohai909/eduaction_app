//
//  MineBuyCourseMainCVCell.h
//  eduaction_app
//
//  Created by Mac on 2018/12/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineBuyCourseMainCVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbl_name;

@property (weak, nonatomic) IBOutlet UIButton *btn_image;
@property (weak, nonatomic) IBOutlet UILabel *lbl_percent;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *image_percent_width;
@property (weak, nonatomic) IBOutlet UIImageView *image_default;
@property (weak, nonatomic) IBOutlet UIImageView *image_percent;
//112-8-8的百分比

@property (weak, nonatomic) IBOutlet UIButton *btn_note;
@property (weak, nonatomic) IBOutlet UIButton *btn_anwser;
@property (weak, nonatomic) IBOutlet UIButton *btn_continue;

@end

NS_ASSUME_NONNULL_END
