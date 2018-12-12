//
//  MineBuyCourseMainCVCell.m
//  eduaction_app
//
//  Created by Mac on 2018/12/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineBuyCourseMainCVCell.h"

@implementation MineBuyCourseMainCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.btn_note.titleLabel.numberOfLines = 0;
    self.btn_anwser.titleLabel.numberOfLines = 0;
    
    self.btn_note.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.btn_anwser.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.btn_note setTitle:@"笔记\n\n0" forState:UIControlStateNormal];
    [self.btn_anwser setTitle:@"问答\n\n0" forState:UIControlStateNormal];
    
    self.btn_image.layer.cornerRadius = 4.0;
    self.btn_image.layer.masksToBounds = YES;
    
    self.image_default.layer.cornerRadius = 2;
    self.image_default.layer.masksToBounds = YES;
    self.image_percent.layer.cornerRadius = 2;
    self.image_percent.layer.masksToBounds = YES;
}

@end
