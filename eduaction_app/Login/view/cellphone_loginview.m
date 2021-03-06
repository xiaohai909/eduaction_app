//
//  cellphone_loginview.m
//  eduaction_app
//
//  Created by legendlxd on 2018/10/29.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "cellphone_loginview.h"
#define space_left 36
@implementation cellphone_loginview

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)creatXib
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([cellphone_loginview class]) owner:nil options:nil]firstObject];
}
-(void)awakeFromNib{
    
    [super awakeFromNib];
    self.login_btn.selected = YES;
    
    [self.login_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(ZTWidth/4.0, 44));
        make.centerX.mas_equalTo(self.mas_centerX).offset(-ZTWidth/4.0);
        make.top.mas_equalTo(91);
        
    }];
    [self.register_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(ZTWidth/4.0, 44));
        make.centerX.mas_equalTo(self.mas_centerX).offset(ZTWidth/4.0);
        make.top.mas_equalTo(91);
        
    }];
    
    [self.logo_view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topImageView.mas_bottom).offset(42*scale_H);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(ZTWidth, 26));
    }];
    [self.lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(67);
        make.left.mas_equalTo(107*scale_w);
        make.centerY.mas_equalTo(self.logo_view.mas_centerY);
    }];
    [self.lab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.left.mas_equalTo(self.lab1.mas_right).offset(15*scale_w);
        make.centerY.mas_equalTo(self.logo_view.mas_centerY);
        
    }];
    [self
     .mobileicon mas_makeConstraints:^(MASConstraintMaker *make) {
         make.size.mas_equalTo(CGSizeMake(32, 32));
         make.left.mas_equalTo(space_left);
         make.top.mas_equalTo(self.logo_view.mas_bottom).offset(42*scale_H);
     }];
    [self.mobilenumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mobileicon.mas_centerY);
        make.left.mas_equalTo(self.mobileicon.mas_right).offset(5);
        make.right.mas_equalTo(-space_left);
        make.height.mas_equalTo(31);
    }];
    [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(space_left);
        make.right.mas_equalTo(-space_left);
        make.height.mas_equalTo(0.5);
        make.top.mas_equalTo(self.mobilenumber.mas_bottom).offset(2);
        
    }];
    [self.codeicon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(32, 32));
        make.left.mas_equalTo(space_left);
        make.top.mas_equalTo(self.line1.mas_bottom).offset(24*scale_H);
    }];
    
    [self.codebtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.codeicon.mas_centerY);
        
        make.right.mas_equalTo(-space_left);
        make.height.mas_equalTo(31);
        make.width.mas_equalTo(69);
    }];
    [self.code mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.codeicon.mas_centerY);
        make.left.mas_equalTo(self.codeicon.mas_right).offset(5);
        make.right.mas_equalTo(self.codebtn.mas_left).offset(-5);
        make.height.mas_equalTo(31);
    }];
    [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(space_left);
        make.right.mas_equalTo(-space_left);
        make.height.mas_equalTo(0.5);
        make.top.mas_equalTo(self.code.mas_bottom).offset(2);
        
    }];
    
    [self.go_reg_btn  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-space_left);
        make.left.mas_equalTo(space_left);
        make.top.mas_equalTo(self.line2.mas_bottom).offset(37*scale_H);
        make.height.mas_equalTo(44);
    }];
    
    
    [self.back  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.go_reg_btn.mas_bottom).offset(4*scale_H);
        make.height.mas_equalTo(32);
        make.width.mas_equalTo(74);
    }];
    
    
    [self.go_reg_btn setBackgroundImage:[CommonFunciton BgImageFromColors:@[HexRGB(0xFF5F5E),HexRGB(0xFC7456),HexRGB(0xFC7855)] withFrame:self.go_reg_btn.frame gradientDir:leftToright] forState:UIControlStateNormal];
    
    self.go_reg_btn.layer.masksToBounds = YES;
    self.go_reg_btn.layer.cornerRadius = 20;
    
    self.line1.backgroundColor = lineColor_app;
    self.line2.backgroundColor = lineColor_app;
    
}
@end
