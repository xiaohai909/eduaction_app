//
//  ConsolidateProblemCVCell.h
//  eduaction_app
//
//  Created by Mac on 2018/11/13.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConsolidateProblemCVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *btn_image;
@property (weak, nonatomic) IBOutlet UILabel *lbl_content;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lbl_content_left;

- (void)setCollectionModify:(BOOL)modify andTitle:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
