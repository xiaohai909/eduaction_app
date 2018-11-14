//
//  RechargeMainBottomView.m
//  eduaction_app
//
//  Created by Mac on 2018/11/13.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "RechargeMainBottomView.h"

@implementation RechargeMainBottomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame andViewType:(BottomViewType)viewType
{
    
    CGRect self_frame = frame;
    if (UI_IS_IPHONE_X) {//是最底下的工具栏// && (frame.size.height+frame.origin.y == ZTHeight-NaviIPHONEX
        self_frame.origin.y = frame.origin.y-20;
        self_frame.size.height = frame.size.height+20;
    }
    self = [super initWithFrame:self_frame];
    if (self) {
        if (viewType == BottomViewTypeRecharge) {
            [self creatRechargeMainView];
        }
        else if (viewType == BottomViewTypeCollection) {
            [self creatMyCollectionView];
        }
    }
    return self;
}
- (void)creatRechargeMainView
{
    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.btn_left = [self creatBtn:(CGRect){20,0,self.py_width-150-20,UI_IS_IPHONE_X?self.py_height-20:self.py_height} andTitle:@"金额："];
    self.btn_left.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [self.btn_left setTitleColor:HexRGB(0x525151) forState:UIControlStateNormal];
    self.btn_left.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.btn_left.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:self.btn_left];
    
    UIButton *btn_open = [self creatBtn:(CGRect){self.py_width-150,0,150,self.py_height} andTitle:@"立即开通"];
    [btn_open setBackgroundImage:[CommonFunciton BgImageFromColors:@[HexRGB(0xFF5F5E),HexRGB(0xFC7456),HexRGB(0xFC7855)] withFrame:btn_open.frame gradientDir:leftToright] forState:UIControlStateNormal];
    [[btn_open rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        //
        if (self.blockActionClick) {
            self.blockActionClick(btn_open.titleLabel.text);
        }
    }];
    [self addSubview:btn_open];
}
- (void)creatMyCollectionView
{
    self.backgroundColor = [UIColor whiteColor];
    self.btn_left = [self creatBtn:(CGRect){20,0,self.py_width-110*2-20,UI_IS_IPHONE_X?self.py_height-20:self.py_height} andTitle:@"  全选 "];
    [self.btn_left setTitleColor:HexRGB(0x333333) forState:UIControlStateNormal];
    self.btn_left.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.btn_left setImage:[UIImage imageNamed:@"collection_ico_circle"] forState:UIControlStateNormal];
    [self.btn_left setImage:[UIImage imageNamed:@"collection_btn_check"] forState:UIControlStateSelected];
    [[self.btn_left rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        //
        self.btn_left.selected = !self.btn_left.selected;
        if (self.blockActionClick) {
            self.blockActionClick(self.btn_left.titleLabel.text);
        }
    }];
    [self addSubview:self.btn_left];
    
    UIButton *btn_delete = [self creatBtn:(CGRect){self.btn_left.py_right,0,110,self.py_height} andTitle:@"移除"];
    btn_delete.backgroundColor = HexRGB(0xF08734);
    [[btn_delete rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        //
        if (self.blockActionClick) {
            self.blockActionClick(btn_delete.titleLabel.text);
        }
    }];
    [self addSubview:btn_delete];
    
    //
    UIButton *btn_cancel = [self creatBtn:(CGRect){btn_delete.py_right,0,110,self.py_height} andTitle:@"取消"];
    btn_cancel.backgroundColor = HexRGB(0xFF6B6B);
    [[btn_cancel rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        //
        if (self.blockActionClick) {
            self.blockActionClick(btn_cancel.titleLabel.text);
        }
    }];
    [self addSubview:btn_cancel];
}
- (UIButton *)creatBtn:(CGRect)frame andTitle:(NSString *)title{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;

    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    return btn;
}
@end
