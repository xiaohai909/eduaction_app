//
//  MineAttestationView.m
//  eduaction_app
//
//  Created by Mac on 2018/12/11.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineAttestationView.h"

@implementation MineAttestationView

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
    self.btn_content.titleLabel.numberOfLines = 0;
    self.btn_image1.layer.borderColor = HexRGB(0xCCCCCC).CGColor;
    self.btn_image1.layer.borderWidth = 0.5;
    self.btn_image2.layer.borderColor = HexRGB(0xCCCCCC).CGColor;
    self.btn_image2.layer.borderWidth = 0.5;
    
    self.view_images_height.constant = (ZTWidth-75-25*2-13)*(135.0/241.0)*2+60;
}

- (CGFloat)height_Attestation
{
    if (_height_Attestation) {
        return _height_Attestation;
    }
    else{
        CGFloat height = [UIView viewGetHeightWithContent:self.btn_content.titleLabel.text width:ZTWidth-56 font:12];
        _height_Attestation = 140+height+(ZTWidth-75-25*2-13)*(135.0/241.0)*2+60;
        return _height_Attestation;
    }
}
@end
