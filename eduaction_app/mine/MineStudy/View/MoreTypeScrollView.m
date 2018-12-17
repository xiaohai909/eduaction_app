//
//  MoreTypeScrollView.m
//  e-commercePlus
//
//  Created by Mac on 2018/11/19.
//  Copyright © 2018 com. All rights reserved.
//

#import "MoreTypeScrollView.h"

@implementation MoreTypeScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)creatTypeWithArray:(NSArray *)array
{
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.array_btns = [NSMutableArray array];
    CGFloat width_content = 0;
    for (int i=0;i<array.count;i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleColor:HexRGB(0x000000) forState:UIControlStateNormal];
        [btn setTitleColor:HexRGB(0x3465C7) forState:UIControlStateSelected];
        btn.tag = i+100;

        CGFloat width = [UIView viewGetWidthWithContent:array[i] height:self.py_height font:15];
        btn.frame = (CGRect){width_content,0,width+15,self.py_height};
        width_content = btn.py_right;
        self.contentSize = (CGSize){btn.py_right,self.py_height};
        
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.array_btns addObject:btn];
        [self addSubview:btn];
    }
    if (width_content<self.frame.size.width) {
        CGFloat width = (self.frame.size.width-width_content)/array.count;
        for (int i=0; i<array.count; i++) {
            UIButton *btn = [self viewWithTag:100+i];
            btn.py_width = btn.py_width+width;
            btn.py_x = btn.py_x+width*i;
        }
    }
}
- (UIImageView *)image_select
{
    if (!_image_select) {
        _image_select = [[UIImageView alloc] initWithFrame:(CGRect){0,self.py_bottom-2,15,2}];
        _image_select.backgroundColor = [UIColor redColor];
        
        [self addSubview:_image_select];
    }
    return _image_select;
}
- (void)btnAction:(UIButton *)sender
{
    for (UIButton *btn in self.array_btns) {
        btn.selected = NO;
    }
    sender.selected = YES;
    self.image_select.py_centerX = sender.py_centerX;
    if (self.blockClick) {
        self.blockClick(sender.tag);
    }
}
@end
