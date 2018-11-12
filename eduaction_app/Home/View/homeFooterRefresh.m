//
//  homeFooterRefresh.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/7.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "homeFooterRefresh.h"

@implementation homeFooterRefresh

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.changebtn.layer.masksToBounds = YES;
    self.changebtn.layer.cornerRadius  = 15;
    self.changebtn.layer.borderColor = HexRGB(0x999999).CGColor;
    self.changebtn.layer.borderWidth = 1.0;
}

@end
