//
//  ChapterScoreCVCell.m
//  eduaction_app
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ChapterScoreCVCell.h"

@implementation ChapterScoreCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setImageName:(NSString *)imageName andTitle:(NSString *)title andDetail:(NSString *)detail
{
    self.img_main.image = [UIImage imageNamed:imageName];
    self.lbl_title.text = title;
    self.lbl_detail.text = detail;
}
@end
