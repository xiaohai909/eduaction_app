//
//  MineMassageCVCell.m
//  eduaction_app
//
//  Created by Mac on 2018/11/27.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineMassageCVCell.h"

@implementation MineMassageCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.image_main.layer.cornerRadius = 5;
    self.image_main.layer.masksToBounds = YES;
    
    self.lbl_count.layer.cornerRadius = self.lbl_count.py_height/2;
    self.lbl_count.layer.masksToBounds = YES;
}

@end
