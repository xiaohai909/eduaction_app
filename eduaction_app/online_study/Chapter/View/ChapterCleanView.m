//
//  ChapterCleanView.m
//  eduaction_app
//
//  Created by Mac on 2018/11/28.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ChapterCleanView.h"

@implementation ChapterCleanView
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.btn_clean.layer.cornerRadius = self.btn_clean.py_height/2.0;
    self.btn_clean.layer.masksToBounds = YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
