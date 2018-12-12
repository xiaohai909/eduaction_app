//
//  MineToolExchangeView.m
//  eduaction_app
//
//  Created by Mac on 2018/12/11.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineToolExchangeView.h"

@implementation MineToolExchangeView

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
    self.btn_send.layer.cornerRadius = self.btn_send.py_height/2;
    self.btn_send.layer.masksToBounds = YES;
    
    self.text_order.layer.borderColor = HexRGB(0x999999).CGColor;
    self.text_order.layer.borderWidth = 1.0;
    self.text_order.borderStyle = UITextBorderStyleLine;
}
@end
