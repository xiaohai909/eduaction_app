//
//  MineHelpFeedBackView.m
//  eduaction_app
//
//  Created by Mac on 2018/12/12.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineHelpFeedBackView.h"

@implementation MineHelpFeedBackView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.text_content.placeholder = @"内容不超过500字";
    self.text_content.layer.borderColor = HexRGB(0xcccccc).CGColor;
    self.text_content.layer.borderWidth = 0.5;
}
@end
