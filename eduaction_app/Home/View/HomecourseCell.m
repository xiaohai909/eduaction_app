//
//  HomecourseCell.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/2.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "HomecourseCell.h"

@implementation HomecourseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentView.backgroundColor = [UIColor whiteColor];
    // Initialization code
}
-(void)SetDataSource:(courselistdataBaseClass *)mode{
    self.iamgeV.contentMode = UIViewContentModeScaleAspectFill;
    self.iamgeV.clipsToBounds = YES;
    
    [self.iamgeV sd_setImageWithURL:[NSURL URLWithString:mode.backimgUrl]];
    self.lab1.text = mode.name;
    self.lab3.text = mode.charteModeStr;
    self.lab2.text = [NSString stringWithFormat:@"截止时间：%@",mode.endTime];
}
@end
