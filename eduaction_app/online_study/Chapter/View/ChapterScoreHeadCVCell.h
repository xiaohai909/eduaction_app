//
//  ChapterScoreHeadCVCell.h
//  eduaction_app
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChapterScoreHeadCVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img_head;
@property (weak, nonatomic) IBOutlet UIImageView *img_dialog;
@property (weak, nonatomic) IBOutlet UILabel *lbl_content;
@property (weak, nonatomic) IBOutlet UILabel *lbl_left;
@property (weak, nonatomic) IBOutlet UILabel *lbl_right;


- (void)contentNumber:(NSString *)number;
- (void)leftNumber:(NSString *)number andTotal:(NSString *)total;
- (void)rightNumber:(NSString *)number andTotal:(NSString *)total;
@end

NS_ASSUME_NONNULL_END
