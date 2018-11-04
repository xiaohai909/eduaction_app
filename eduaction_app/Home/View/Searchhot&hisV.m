//
//  Searchhot&hisV.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/4.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "Searchhot&hisV.h"

@implementation Searchhot_hisV

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UILabel *)labelWithTitle:(NSString *)title
{
    UILabel *label = [[UILabel alloc] init];
    label.userInteractionEnabled = YES;
    label.font = [UIFont systemFontOfSize:12];
    label.text = title;
    label.textColor = [UIColor grayColor];
    label.backgroundColor = HexRGB(0xfafafa);
    label.layer.cornerRadius = 3;
    label.clipsToBounds = YES;
    label.textAlignment = NSTextAlignmentCenter;
    [label sizeToFit];
    label.py_width += 20;
    label.py_height += 14;
    return label;
}
@end
