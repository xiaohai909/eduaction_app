//
//  StudyTimeCVCell.m
//  eduaction_app
//
//  Created by Mac on 2018/11/5.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "StudyTimeCVCell.h"

@implementation StudyTimeCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.view_back.backgroundColor = [UIColor whiteColor];
    self.view_back.layer.shadowColor = HexRGBAlpha(0x212121,0.2).CGColor;
    self.view_back.layer.shadowOffset = CGSizeMake(0,2);
    self.view_back.layer.shadowOpacity = 1;
    self.view_back.layer.shadowRadius = 9;
    self.view_back.layer.cornerRadius = 2.5;
    
    self.img_main.layer.cornerRadius = self.img_main.py_height/2.0;
    self.img_main.layer.masksToBounds = YES;
    
}

@end
