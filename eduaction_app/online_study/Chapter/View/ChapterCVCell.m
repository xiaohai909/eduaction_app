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
}

- (void)setChapterMainModel:(ChapterListModel *)model
{
    if (model) {
        self.btn_check.hidden = YES;
        self.lbl_title.text = model.name;
        self.lbl_detail.text = [NSString stringWithFormat:@"已答题%@/%@",model.answerCount,model.questCount];
    }
}

@end
