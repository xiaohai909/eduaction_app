//
//  ChapterCVCell.m
//  eduaction_app
//
//  Created by Mac on 2018/11/5.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ChapterCVCell.h"

@implementation ChapterCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.view_ratio creatRatioViewWithNumber:0.05 andType:RatioViewTypeYellow];
}



@end
