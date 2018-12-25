//
//  testGuideDetailV.m
//  eduaction_app
//
//  Created by legendlxd on 2018/12/17.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "testGuideDetailV.h"

@implementation testGuideDetailV

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(instancetype)creatXib
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([testGuideDetailV class]) owner:nil options:nil]firstObject];
}
-(void)setdataSourcce:(testGuideDetailBaseClass *)mode{
    if (mode.resultObj.remark!=nil && mode.resultObj.name != nil) {
        
        self.titlelab.text = mode.resultObj.name;
        
        
        
        [CommonFunciton setLabelSpace:self.contentlab withValue:mode.resultObj.remark withFont:self.contentlab.font];
        self.contentlab.py_height = [CommonFunciton getSpaceLabelHeight:mode.resultObj.remark withFont:self.contentlab.font withWidth:ZTWidth-35];
        self.frame = CGRectMake(0, 0, ZTWidth, 73+self.contentlab.py_height+10);

    }
}
@end
