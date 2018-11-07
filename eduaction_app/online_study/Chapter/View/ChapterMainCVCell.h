//
//  ChapterMainCVCell.h
//  eduaction_app
//
//  Created by Mac on 2018/11/5.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatioView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChapterMainCVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet RatioView *view_ratio;
@property (weak, nonatomic) IBOutlet UILabel *lbl_leftNumber;
@property (weak, nonatomic) IBOutlet UILabel *lbl_rightNumber;


- (void)leftNumber:(NSString *)number andTotal:(NSString *)total;
- (void)rightNumber:(NSString *)number;

@end

NS_ASSUME_NONNULL_END
