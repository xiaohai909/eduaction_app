//
//  ChapterScoreCVCell.h
//  eduaction_app
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChapterScoreCVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img_main;
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (weak, nonatomic) IBOutlet UILabel *lbl_detail;

- (void)setImageName:(NSString *)imageName andTitle:(NSString *)title andDetail:(NSString *)detail;
@end

NS_ASSUME_NONNULL_END
