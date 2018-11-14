//
//  ConsolidateOptionCVCell.m
//  eduaction_app
//
//  Created by Mac on 2018/11/12.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ConsolidateOptionCVCell.h"

@implementation ConsolidateOptionCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setImage:(NSString *)imageName andTitle:(NSString *)title
{
    self.img_sign.image = [UIImage imageNamed:imageName];
    self.lbl_title.text = title;
}
@end
