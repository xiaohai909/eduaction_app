//
//  RechargeMainView.m
//  eduaction_app
//
//  Created by Mac on 2018/11/12.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "RechargeMainView.h"

@implementation RechargeMainView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *image_bg = [[UIImageView alloc] initWithFrame:(CGRect){11,28,ZTWidth-22,150}];
        image_bg.layer.masksToBounds = YES;
        image_bg.layer.cornerRadius = 5;
        image_bg.backgroundColor = [UIColor redColor];
        image_bg.image = [UIImage imageNamed:@"recharge_ico_card"];
        [self addSubview:image_bg];
        [image_bg addSubview:[self creatBtn:(CGRect){35,150/2.0-25,image_bg.py_width-70,25} andTag:4]];
        [image_bg addSubview:[self creatBtn:(CGRect){35,150/2.0+10,image_bg.py_width-70,20} andTag:5]];
        self.image_bg = image_bg;
    }
    return self;
}

- (void)setModels:(NSMutableArray *)models
{
    self.btn_left = [self creatBtn:(CGRect){((ZTWidth-21*4)/3)*0+21*(0+1),self.image_bg.py_bottom+28,(ZTWidth-21*4)/3,121} andModel:models[0]];
    [self addSubview:self.btn_left];
    //recharge_ico_recommend
    UIButton *btn_recommend = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_recommend.frame = (CGRect){self.btn_left.py_right-33,self.btn_left.py_y-9,33,18};
    [btn_recommend setImage:[UIImage imageNamed:@"recharge_ico_recommend"] forState:UIControlStateNormal];
    btn_recommend.userInteractionEnabled = NO;
    [self addSubview:btn_recommend];
    
    self.btn_center = [self creatBtn:(CGRect){((ZTWidth-21*4)/3)*1+21*(1+1),self.image_bg.py_bottom+28,(ZTWidth-21*4)/3,121} andModel:models[1]];
    [self addSubview:self.btn_center];
    
    self.btn_right = [self creatBtn:(CGRect){((ZTWidth-21*4)/3)*2+21*(2+1),self.image_bg.py_bottom+28,(ZTWidth-21*4)/3,121} andModel:models[2]];
    [self addSubview:self.btn_right];
    
    //支付
    [self addSubview:[self creatLbl:(CGRect){self.btn_left.py_x,self.btn_left.py_bottom+30,ZTWidth-(2*self.btn_left.py_x),20} andType:4 andTitle:@"支付方式"]];
    [self addSubview:[self creatPayBtn:(CGRect){self.btn_left.py_x,self.btn_left.py_bottom+30+30,ZTWidth-(2*self.btn_left.py_x),55} andTag:0]];
    [self addSubview:[self creatPayBtn:(CGRect){self.btn_left.py_x,self.btn_left.py_bottom+30+30+55,ZTWidth-(2*self.btn_left.py_x),55} andTag:1]];
    [self btnPay:self.btn_Alipay];

}

- (UIButton *)creatBtn:(CGRect)frame andModel:(RechargeModel *)model
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    btn.layer.cornerRadius = 5.0;
    btn.layer.masksToBounds = YES;
    btn.layer.borderColor = HexRGB(0xFF0000).CGColor;
    btn.layer.borderWidth = 2.0;
    
    NSArray *title = @[[NSString stringWithFormat:@"%@个月",model.duration],[NSString stringWithFormat:@"￥%@",model.buyMoney],[NSString stringWithFormat:@"%@元/%@个月",model.buyMoney,model.duration]];
    for (int i=0; i<3; i++) {
        CGRect btn_frame = (CGRect){0,23,frame.size.width,15};
        UILabel *lbl = [self creatLbl:btn_frame andType:i andTitle:title[i]];
        lbl.tag = i+1;
        [btn addSubview:lbl];
        [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            if (self.blockCharge) {
                self.btn_left.backgroundColor = self.btn_center.backgroundColor = self.btn_right.backgroundColor = [UIColor whiteColor];
                btn.backgroundColor = HexRGB(0xFFE7E7);
                self.blockCharge(model);
            }
        }];
    }
    return btn;
}

- (UIButton *)creatBtn:(CGRect)frame andTag:(NSInteger)tag{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;

   if(tag == 4){
        //
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [btn setTitle:@"  尊贵特权VIP" forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [btn setImage:[UIImage imageNamed:@"recharge_ico_member"] forState:UIControlStateNormal];
    }
    else if(tag == 5){
        //
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [btn setTitle:@"2018-09-11 14:20到期" forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        self.btn_time = btn;
    }
    return btn;
}

- (UIButton *)creatPayBtn:(CGRect)frame andTag:(NSInteger)tag{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:HexRGB(0x333333) forState:UIControlStateNormal];
    btn.frame = frame;
    btn.tag = tag;
    if(tag == 0){
        //
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [btn setTitle:@"  支付宝" forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [btn setImage:[UIImage imageNamed:@"question_recharge_ico_alipay"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"question_recharge_ico_alipay"] forState:UIControlStateHighlighted];

        self.btn_Alipay = btn;
        [btn addSubview:[self creatPayBtn:(CGRect){btn.py_right-80,0,50,btn.py_height} andTag:2]];
        [btn addTarget:self action:@selector(btnPay:) forControlEvents:UIControlEventTouchUpInside];
    }
    else if(tag == 1){
        //
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [btn setTitle:@"  微信" forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [btn setImage:[UIImage imageNamed:@"question_recharge_ico_wechat"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"question_recharge_ico_wechat"] forState:UIControlStateHighlighted];

        self.btn_Weixin = btn;
        [btn addSubview:[self creatPayBtn:(CGRect){btn.py_right-80,0,50,btn.py_height} andTag:2]];
        [btn addTarget:self action:@selector(btnPay:) forControlEvents:UIControlEventTouchUpInside];
    }
    else if (tag == 2) {
        btn.userInteractionEnabled = NO;
        [btn setImage:[UIImage imageNamed:@"btn_check_nor"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"btn_check_sel"] forState:UIControlStateSelected];
    }
    return btn;
}

- (void)btnPay:(UIButton *)sender
{
    UIButton *btn1 = [self.btn_Alipay viewWithTag:2];
    UIButton *btn2 = [self.btn_Weixin viewWithTag:2];
    btn1.selected = btn2.selected = NO;
    
    UIButton *btn = [sender viewWithTag:2];
    btn.selected = YES;
    if (self.blockPayType) {
        self.blockPayType(sender.tag);
    }
}

- (UILabel *)creatLbl:(CGRect)frame andType:(NSInteger)type andTitle:(NSString *)title{
    UILabel *lbl = [[UILabel alloc] initWithFrame:frame];
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.text = title;
    if (type == 0) {
        lbl.frame = (CGRect){0,23,lbl.py_width,14};
        lbl.font = [UIFont systemFontOfSize:14];
        lbl.textColor = HexRGB(0x333333);
    }
    else if (type == 1) {
        lbl.frame = (CGRect){0,14+23+17,lbl.py_width,18};
        lbl.font = [UIFont boldSystemFontOfSize:30];
        lbl.textColor = HexRGB(0xFF6B6B);
        NSMutableAttributedString *atb = [[NSMutableAttributedString alloc] initWithString:lbl.text];
        [atb addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18]} range:NSMakeRange(0, 1)];
        lbl.attributedText = atb;
    }
    else if(type == 2) {
        lbl.frame = (CGRect){0,14+23+17+18+15,lbl.py_width,10};
        lbl.font = [UIFont systemFontOfSize:10];
        lbl.textColor = HexRGB(0x999999);
    }
    else if(type == 4) {
        lbl.textAlignment = NSTextAlignmentLeft;
        lbl.font = [UIFont systemFontOfSize:15];
        lbl.textColor = HexRGB(0x666666);
    }
    return lbl;
}
@end
