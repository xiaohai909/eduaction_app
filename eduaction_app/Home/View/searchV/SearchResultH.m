//
//  SearchResultH.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/7.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "SearchResultH.h"

@implementation SearchResultH

- (void)awakeFromNib {
    [super awakeFromNib];
    _ClickTop = [RACSubject subject];
    
  
    // Initialization code
}
-(void)setupBtn:(NSArray *)arr{
    self.current_select = 1;
    for (NSInteger i = 0 ; i<arr.count ; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i+1;
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        [btn setTitleColor:HexRGB(0x333333) forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(ZTWidth/(arr.count*1.0), 28));
            make.left.mas_equalTo(i*ZTWidth/(arr.count*1.0));
            make.top.mas_equalTo(0);
        }];
        @weakify(self);
        [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            
            UIButton *temp = x;
            self.current_select = temp.tag ;
            
            [UIView animateWithDuration:0.5 animations:^{
                
                [self.SelectV mas_remakeConstraints:^(MASConstraintMaker *make) {
                    
                    make.centerX.mas_equalTo(temp.mas_centerX);
                    make.bottom.mas_equalTo(temp.mas_bottom);
                    make.width.mas_equalTo(ZTWidth/(arr.count*1.0)-20);
                    make.height.mas_equalTo(4);
                    
                }];
                
                [self.SelectV layoutIfNeeded];//强制绘制
                
            }];
            

        }];
        
        
    }
    UIButton *first_btn= [self viewWithTag:1];
    [self.SelectV setImage:[CommonFunciton BgImageFromColors:@[HexRGB(0xFC845F),HexRGB(0xFC7456),HexRGB(0xFF6B6B)] withFrame:CGRectMake(0, 0, (ZTWidth/(arr.count*1.0)-20), 4) gradientDir:leftToright]];
    [self.SelectV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(first_btn.mas_centerX);
        make.bottom.mas_equalTo(first_btn.mas_bottom);
        make.width.mas_equalTo(ZTWidth/(arr.count*1.0)-20);
        make.height.mas_equalTo(4);
    }];
    
}
@end
