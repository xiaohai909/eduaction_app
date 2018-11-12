//
//  MakeProblemCommitCVCell.m
//  eduaction_app
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MakeProblemCommitCVCell.h"

@implementation MakeProblemCommitCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.btn_head.layer.cornerRadius = self.btn_head.py_height/2.0;
    self.btn_head.layer.masksToBounds = YES;
}

@end
