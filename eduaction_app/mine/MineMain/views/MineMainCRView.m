//
//  MineMainCRView.m
//  eduaction_app
//
//  Created by Mac on 2018/11/26.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineMainCRView.h"

@implementation MineMainCRView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.image_bg.image = [CommonFunciton BgImageFromColors:@[HexRGB(0xF15A51),HexRGB(0xF15A51),HexRGB(0xFF9272)] withFrame:self.frame gradientDir:topTobottom];
    
    self.btn_head.layer.cornerRadius = self.btn_head.py_height/2;
    self.btn_head.layer.masksToBounds = YES;
    self.btn_head.layer.borderColor = [UIColor whiteColor].CGColor;
    self.btn_head.layer.borderWidth = 2.0;
    
    self.lbl_messageNumber.layer.cornerRadius = self.lbl_messageNumber.py_height/2;
    self.lbl_messageNumber.layer.masksToBounds = YES;
    
    self.btn_data.titleLabel.numberOfLines = 2;
    self.btn_sign.titleLabel.numberOfLines = 2;
    
    self.btn_point_bg.layer.cornerRadius = 5;
    self.btn_point_bg.layer.masksToBounds = YES;
    self.btn_point_bg.backgroundColor = HexRGB(0xF66042);
    [self.btn_accountPoint setImage:[UIImage imageNamed:@"mine_ico_integral"] forState:UIControlStateNormal];
}

@end
