//
//  loginview.m
//  eduaction_app
//
//  Created by legendlxd on 2018/10/22.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "loginview.h"
#define space_left 36
@implementation loginview

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
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
     .mobile_icon mas_makeConstraints:^(MASConstraintMaker *make) {
         make.size.mas_equalTo(CGSizeMake(32, 32));
         make.left.mas_equalTo(space_left);
         make.top.mas_equalTo(self.logo_view.mas_bottom).offset(54*scale_H);
     }];
    [self.user_mobile mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mobile_icon.mas_centerY);
       make.left.mas_equalTo(self.mobile_icon.mas_right).offset(5);
        make.right.mas_equalTo(-space_left);
        make.height.mas_equalTo(31);
    }];
    [self.underline1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(space_left);
        make.right.mas_equalTo(-space_left);
        make.height.mas_equalTo(0.5);
        make.top.mas_equalTo(self.user_mobile.mas_bottom).offset(2);
    
    }];
    
    [self.password_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(32, 32));
        make.left.mas_equalTo(space_left);
        make.top.mas_equalTo(self.underline1.mas_bottom).offset(10);
    }];
    
    [self.user_password mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.password_icon.mas_centerY);
        make.left.mas_equalTo(self.password_icon.mas_right).offset(5);
        make.right.mas_equalTo(-space_left);
        make.height.mas_equalTo(31);
    }];
    [self.underline2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(space_left);
        make.right.mas_equalTo(-space_left);
        make.height.mas_equalTo(0.5);
        make.top.mas_equalTo(self.user_password.mas_bottom).offset(2);
        
    }];
    self.underline1.backgroundColor = lineColor_app;
    self.underline2.backgroundColor = lineColor_app;
    
    [self.log_inbtn  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-space_left);
        make.left.mas_equalTo(space_left);
        make.top.mas_equalTo(self.underline2.mas_bottom).offset(20*scale_H);
        make.height.mas_equalTo(44);
    }];
    


    [self.log_inbtn setBackgroundImage:[CommonFunciton BgImageFromColors:@[HexRGB(0xFF5F5E),HexRGB(0xFC7456),HexRGB(0xFC7855)] withFrame:self.log_inbtn.frame gradientDir:leftToright] forState:UIControlStateNormal];
    
    [self.cellphoneview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-space_left);
        make.left.mas_equalTo(space_left);
        make.top.mas_equalTo(self.log_inbtn.mas_bottom).offset(10);
        make.height.mas_equalTo(44);
    }];
    [self.cellphone_layer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    [self.cellphone_btn setBackgroundColor:[UIColor whiteColor]];
    [self.cellphone_btn  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-1);
        make.left.mas_equalTo(1);
        make.top.mas_equalTo(1);
        make.bottom.mas_equalTo(-1);
    }];
    
    [self.cellphone_layer setImage:[CommonFunciton BgImageFromColors:@[HexRGB(0xFF5F5E),HexRGB(0xFC7456),HexRGB(0xFC7855)] withFrame:self.log_inbtn.frame gradientDir:leftToright]];
    
    self.log_inbtn.layer.masksToBounds = YES;
    self.log_inbtn.layer.cornerRadius = 20;
    self.cellphone_layer.layer.masksToBounds = YES;
    self.cellphone_layer.layer.cornerRadius = 20;
    self.cellphone_btn.layer.masksToBounds = YES;
    self.cellphone_btn.layer.cornerRadius = 20;
    
    [self.forgetpassword  mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.mas_equalTo(self.cellphoneview.mas_bottom).offset(10);
        make.height.mas_equalTo(30);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo((ZTWidth-40)/2.0);
    }];
    
    
    [self.QQ mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(44, 44));
        make.bottom.mas_equalTo(-(40*scale_H));
        make.centerX.mas_equalTo(self.mas_centerX).offset(-64);
    }];
    [self.WX mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(44, 44));
        make.bottom.mas_equalTo(self.QQ.mas_bottom);
        make.centerX.mas_equalTo(self.mas_centerX).offset(64);
    }];
}
+(instancetype)creatXib
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([loginview class]) owner:nil options:nil]firstObject];
}
- (IBAction)loginbtnclick:(id)sender {
    
    if (!self.login_btn.selected) {
        
        self.login_btn.selected = !self.login_btn.selected;
        self.register_btn.selected = !self.register_btn.selected;
    }
}
- (IBAction)registerclick:(id)sender {
    
    if (!self.register_btn.selected) {
        
        self.login_btn.selected = !self.login_btn.selected;
        self.register_btn.selected = !self.register_btn.selected;
    }
}
- (IBAction)QQlick:(id)sender {
    
    
    
}
- (IBAction)WXclick:(id)sender {
    
}
- (IBAction)forgetpass_click:(id)sender {
    
}
- (IBAction)login_click:(id)sender {
    
}
@end
