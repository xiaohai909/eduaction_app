//
//  Searchhot&hisV.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/4.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "SearchhotAndhisV.h"
#define labspcae 10
@implementation SearchhotAndhisV

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        
        self.LabClcik_action = [RACSubject subject];
    }
    return self;
}
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
    
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labClck:)];
    [label addGestureRecognizer:tap];
    
    return label;
}
-(void)labClck:(UIGestureRecognizer *)sender{
    
    DDLogVerbose(@"%@",((UILabel *)sender.view).text);
    
    [self.LabClcik_action sendNext:((UILabel *)sender.view).text];
    
    
}
-(void)setupView:(NSArray *)titleArr{
    
    for (NSString *str in titleArr) {
        
        [self addSubview:[self labelWithTitle:str]];
        
    }
    CGFloat contview_w = ZTWidth - 20;
    
    
    CGFloat currentX = 20;
    CGFloat currentY = 0;
    CGFloat countRow = 0;
    CGFloat countCol = 0;
    
    for (int i = 0; i < self.subviews.count; i++) {
        UILabel *subView = self.subviews[i];
        // When the number of search words is too large, the width is width of the contentView
        if (subView.py_width > contview_w) subView.py_width = contview_w;
        if (currentX + subView.py_width + labspcae * countRow > contview_w) {
            subView.py_x = 20;
            subView.py_y = (currentY += subView.py_height) + labspcae * ++countCol;
            currentX = subView.py_width;
            countRow = 1;
        } else {
            subView.py_x = (currentX += subView.py_width) - subView.py_width + labspcae * countRow;
            subView.py_y = currentY + labspcae * countCol;
            countRow ++;
        }
    }
    self.py_height = CGRectGetMaxY(self.subviews.lastObject.frame);
    
    
}
@end
