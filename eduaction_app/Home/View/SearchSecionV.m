//
//  SearchSecionV.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/4.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "SearchSecionV.h"

@implementation SearchSecionV

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)creatXib
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([SearchSecionV class]) owner:nil options:nil]firstObject];
}
@end
