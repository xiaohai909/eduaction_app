//
//  SyllabusMainPopView.m
//  eduaction_app
//
//  Created by Mac on 2018/11/15.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "SyllabusMainPopView.h"

@implementation SyllabusMainPopView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.btn_close.layer.cornerRadius = self.btn_close.py_height/2;
    self.btn_close.layer.masksToBounds = YES;
    [self.btn_close setBackgroundImage:[CommonFunciton BgImageFromColors:@[HexRGB(0xFF5F5E),HexRGB(0xFC7456),HexRGB(0xFC7855)] withFrame:self.btn_close.frame gradientDir:leftToright] forState:UIControlStateNormal];
    
    self.layer.cornerRadius = 5;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
