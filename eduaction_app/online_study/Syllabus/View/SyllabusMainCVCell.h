//
//  SyllabusMainCVCell.h
//  eduaction_app
//
//  Created by Mac on 2018/11/15.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SyllabusMainCVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (weak, nonatomic) IBOutlet UILabel *lbl_content;
@property (weak, nonatomic) IBOutlet UIButton *btn_sign;
- (void)setTitle:(NSString *)title andContent:(NSString *)content andModel:(NSInteger)mode;
@end

NS_ASSUME_NONNULL_END
