//
//  ChapterCVCell.h
//  eduaction_app
//
//  Created by Mac on 2018/11/5.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatioView.h"

#import "ChapterListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChapterCVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet RatioView *view_ratio;
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (weak, nonatomic) IBOutlet UILabel *lbl_detail;
@property (weak, nonatomic) IBOutlet UIButton *btn_check;

- (void)setChapterMainModel:(ChapterListModel *)model;
@end

NS_ASSUME_NONNULL_END
