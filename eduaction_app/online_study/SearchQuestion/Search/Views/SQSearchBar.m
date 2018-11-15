//
//  SQSearchBar.m
//  eduaction_app
//
//  Created by Mac on 2018/11/15.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "SQSearchBar.h"

@implementation SQSearchBar

+(instancetype)creatSearchBar{

    SQSearchBar *bar = [[SQSearchBar alloc] initWithFrame:(CGRect){0,0,ZTWidth,NaviIPHONEX}];
    UIImageView *image = [[UIImageView alloc] initWithFrame:bar.frame];
    image.image = [CommonFunciton BgImageFromColors:@[HexRGB(0xFF5F5E),HexRGB(0xFC7456),HexRGB(0xFC7855)] withFrame:bar.frame gradientDir:leftToright];
    [bar addSubview:image];
    
    bar.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bar.leftBtn.frame = CGRectMake(-10, NaviIPHONEX-5-32, 60, 32);
    //        bar.leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [bar.leftBtn setImage:[UIImage imageNamed:@"top_btn_return"] forState:UIControlStateNormal];
    [bar addSubview:bar.leftBtn];
    
    bar.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bar.rightBtn.frame = CGRectMake(ZTWidth-60, NaviIPHONEX-5-32, 60, 32);
    [bar.rightBtn setTitle:@"查找" forState:UIControlStateNormal];
    bar.rightBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [bar addSubview:bar.rightBtn];
    
    bar.searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    bar.searchBtn.backgroundColor = [UIColor whiteColor];
    [bar.searchBtn setTitle:@"搜索你喜欢……" forState:UIControlStateNormal];
    [bar.searchBtn setImage:[UIImage imageNamed:@"index_ico_search"] forState:UIControlStateNormal];
    [bar.searchBtn setTitleColor:HexRGB(0x999999) forState:UIControlStateNormal];
    bar.searchBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    bar.searchBtn.frame = CGRectMake(bar.leftBtn.py_right,NaviIPHONEX-5-32, bar.py_right-bar.leftBtn.py_width-bar.rightBtn.py_width, 32);
    bar.searchBtn.layer.masksToBounds = YES;
    bar.searchBtn.layer.cornerRadius = 10;
    bar.searchBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    bar.searchBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);

    
    bar.textField = [[UITextField alloc] initWithFrame:bar.searchBtn.frame];
    bar.textField.delegate = bar;
    bar.textField.borderStyle = UITextBorderStyleRoundedRect;
    bar.textField.layer.cornerRadius = 10;
    bar.textField.layer.masksToBounds = YES;
    bar.textField.textColor = HexRGB(0x333333);
    bar.textField.font = [UIFont systemFontOfSize:14];
    [bar addSubview:bar.textField];
    [bar addSubview:bar.searchBtn];
    
    
    [[bar.rightBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        if (bar.textField.text.length == 0) {
            [bar bringSubviewToFront:bar.searchBtn];
            [bar.textField resignFirstResponder];
        }
        else{
            if (bar.blockGoOn) {
                bar.blockGoOn(bar.textField.text);
            }
        }
    }];
    [[bar.searchBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        //
        [bar.textField becomeFirstResponder];
        [bar bringSubviewToFront:bar.textField];
    }];
    return bar;

}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self bringSubviewToFront:self.textField];
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if (textField.text.length == 0) {
        [self bringSubviewToFront:self.searchBtn];
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (self.blockGoOn) {
        self.blockGoOn(self.textField.text);
    }
    [self bringSubviewToFront:self.searchBtn];
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
