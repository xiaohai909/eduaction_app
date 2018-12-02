//
//  MineMessageFromCVCell.m
//  eduaction_app
//
//  Created by Mac on 2018/11/27.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineMessageFromCVCell.h"

@implementation MineMessageFromCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.image_head.layer.cornerRadius = self.image_head.py_height/2;
    self.image_head.layer.masksToBounds = YES;
    
    self.lbl_number.layer.cornerRadius = self.lbl_number.py_height/2;
    self.lbl_number.layer.masksToBounds = YES;
    
}

@end
