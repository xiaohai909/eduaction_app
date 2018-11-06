//
//  MakeProblemTopicCVCell.h
//  eduaction_app
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MakeProblemTopicCVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbl_now;
@property (weak, nonatomic) IBOutlet UILabel *lbl_total;
@property (weak, nonatomic) IBOutlet UILabel *lbl_type;
@property (weak, nonatomic) IBOutlet UILabel *lbl_content;
@property (weak, nonatomic) IBOutlet UIImageView *img_content;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *img_content_height;

//可以将高度保存在model中
@end

NS_ASSUME_NONNULL_END
