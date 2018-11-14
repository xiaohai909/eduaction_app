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
        
        
        self.btn_left = [self creatBtn:(CGRect){((ZTWidth-21*4)/3)*0+21*(0+1),image_bg.py_bottom+28,(ZTWidth-21*4)/3,121} andTag:0];
        [self addSubview:self.btn_left];
        //recharge_ico_recommend
        UIButton *btn_recommend = [UIButton buttonWithType:UIButtonTypeCustom];
        btn_recommend.frame = (CGRect){self.btn_left.py_right-33,self.btn_left.py_y-9,33,18};
        [btn_recommend setImage:[UIImage imageNamed:@"recharge_ico_recommend"] forState:UIControlStateNormal];
        btn_recommend.userInteractionEnabled = NO;
        [self addSubview:btn_recommend];
        
        self.btn_center = [self creatBtn:(CGRect){((ZTWidth-21*4)/3)*1+21*(1+1),image_bg.py_bottom+28,(ZTWidth-21*4)/3,121} andTag:1];
        [self addSubview:self.btn_center];
        
        self.btn_right = [self creatBtn:(CGRect){((ZTWidth-21*4)/3)*2+21*(2+1),image_bg.py_bottom+28,(ZTWidth-21*4)/3,121} andTag:2];
        [self addSubview:self.btn_right];
        
//        for (int i=0; i<3; i++) {
//            CGRect btn_frame = (CGRect){((ZTWidth-21*4)/3)*i+21*(i+1),image_bg.py_bottom+28,(ZTWidth-21*4)/3,121};
//            [self addSubview:[self creatBtn:btn_frame andTag:i]];
//        }
    }
    return self;
}

- (UIButton *)creatBtn:(CGRect)frame andTag:(NSInteger)tag{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;

    if (tag<3) {
        btn.layer.cornerRadius = 5.0;
        btn.layer.masksToBounds = YES;
        btn.layer.borderColor = HexRGB(0xFF0000).CGColor;
        btn.layer.borderWidth = 2.0;
        
        NSArray *title = @[@"12个月",@"￥248",@"248元/12个月",@"3个月",@"￥68",@"68元/3个月",@"1个月",@"￥25",@"25元/月"];
        for (int i=0; i<3; i++) {
            CGRect btn_frame = (CGRect){0,23,frame.size.width,15};
            [btn addSubview:[self creatLbl:btn_frame andType:i andTitle:title[tag*3+i]]];
            [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
                if (self.blockCharge) {
                    self.btn_left.backgroundColor = self.btn_center.backgroundColor = self.btn_right.backgroundColor = [UIColor whiteColor];
                    btn.backgroundColor = HexRGB(0xFFE7E7);
                    self.blockCharge(title[tag*3+1]);
                }
            }];
        }
    }
    else if(tag == 4){
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
    }
    
    return btn;
    
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
        lbl.font = [UIFont boldSystemFontOfSize:18];
        lbl.textColor = HexRGB(0xFF6B6B);
    }
    else if(type == 2) {
        lbl.frame = (CGRect){0,14+23+17+18+15,lbl.py_width,10};
        lbl.font = [UIFont systemFontOfSize:10];
        lbl.textColor = HexRGB(0x999999);
    }
    return lbl;
}
@end
