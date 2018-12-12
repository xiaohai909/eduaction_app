//
//  MakeProblemAnswerCVCell.h
//  eduaction_app
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MakeProblemAnswerCVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (weak, nonatomic) IBOutlet UIButton *btn_wrong;
@property (weak, nonatomic) IBOutlet UILabel *lbl_detail;
@end

NS_ASSUME_NONNULL_END
