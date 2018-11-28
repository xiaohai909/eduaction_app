//
//  MineMassageCVCell.h
//  eduaction_app
//
//  Created by Mac on 2018/11/27.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineMassageCVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image_main;
@property (weak, nonatomic) IBOutlet UILabel *lbl_count;
@property (weak, nonatomic) IBOutlet UILabel *lbl_content;
@property (weak, nonatomic) IBOutlet UIImageView *image_arrow;

@end

NS_ASSUME_NONNULL_END
