//
//  trainRightCell.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/19.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "trainRightCell.h"

@implementation trainRightCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.bgV.layer.masksToBounds  =YES;
    self.bgV.layer.borderColor = HexRGB(0x999999).CGColor;
    self.bgV.layer.borderWidth = 1;
    self.bgV.layer.cornerRadius =10;
    // Initialization code
}

@end
