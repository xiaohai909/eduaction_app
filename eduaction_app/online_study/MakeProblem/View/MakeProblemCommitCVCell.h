//
//  MakeProblemCommitCVCell.h
//  eduaction_app
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MakeProblemCommitCVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *btn_head;
@property (weak, nonatomic) IBOutlet UILabel *lbl_first;
@property (weak, nonatomic) IBOutlet UILabel *lbl_second;
@property (weak, nonatomic) IBOutlet UILabel *lbl_content;

@property (weak, nonatomic) IBOutlet UIButton *btn_zan;
@property (weak, nonatomic) IBOutlet UILabel *lbl_zanNumber;

@end

NS_ASSUME_NONNULL_END
