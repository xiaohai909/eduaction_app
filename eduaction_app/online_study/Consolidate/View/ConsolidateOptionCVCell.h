//
//  ConsolidateOptionCVCell.h
//  eduaction_app
//
//  Created by Mac on 2018/11/12.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConsolidateOptionCVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img_sign;
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;

- (void)setImage:(NSString *)imageName andTitle:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
