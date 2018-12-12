//
//  MineHelpSetCVCell.h
//  eduaction_app
//
//  Created by Mac on 2018/12/11.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineHelpSetCVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lbl_title_top;
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (weak, nonatomic) IBOutlet UILabel *lbl_detail;
@property (weak, nonatomic) IBOutlet UISwitch *switch_select;

@end

NS_ASSUME_NONNULL_END
