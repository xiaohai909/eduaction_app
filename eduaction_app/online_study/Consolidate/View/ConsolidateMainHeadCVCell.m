//
//  ConsolidateMainHeadCVCell.m
//  eduaction_app
//
//  Created by Mac on 2018/11/8.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ConsolidateMainHeadCVCell.h"

@implementation ConsolidateMainHeadCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    if (UI_IS_IPHONE_X) {
        self.btn_back_top.constant = 44;
    }
    [self.view_ratio creatColorfulRatioViewWithNumbers:@[@(0.5),@(0.3),@(0.2)]];
}
@end
