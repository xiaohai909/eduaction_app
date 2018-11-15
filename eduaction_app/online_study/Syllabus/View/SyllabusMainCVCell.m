//
//  SyllabusMainCVCell.m
//  eduaction_app
//
//  Created by Mac on 2018/11/15.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "SyllabusMainCVCell.h"

@implementation SyllabusMainCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setTitle:(NSString *)title andContent:(NSString *)content andModel:(NSInteger)mode
{
    self.lbl_title.text = title;
    self.lbl_content.text = content;
}
@end
