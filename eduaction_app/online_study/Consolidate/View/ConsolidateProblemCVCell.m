//
//  ConsolidateProblemCVCell.m
//  eduaction_app
//
//  Created by Mac on 2018/11/13.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ConsolidateProblemCVCell.h"

@implementation ConsolidateProblemCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setCollectionModify:(BOOL)modify andTitle:(NSString *)title
{
    self.lbl_content.text = title;
    if (modify) {
        self.btn_image.hidden = NO;
        self.lbl_content_left.constant = 51;
    }
    else {
        self.btn_image.hidden = YES;
        self.lbl_content_left.constant = 20;
    }
    
}

- (void)setSyllabusMainTitle:(NSString *)title
{
    
}
@end
