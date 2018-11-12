//
//  MakeProblemAnswerCVCell.m
//  eduaction_app
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MakeProblemAnswerCVCell.h"

@implementation MakeProblemAnswerCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.btn_wrong.layer.borderColor = HexRGB(0x999999).CGColor;
    self.btn_wrong.layer.borderWidth = 0.5;
    self.btn_wrong.layer.cornerRadius = self.btn_wrong.py_height/2.0;
    self.btn_wrong.layer.masksToBounds = YES;
}

@end
