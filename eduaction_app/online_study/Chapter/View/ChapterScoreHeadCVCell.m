//
//  ChapterScoreHeadCVCell.m
//  eduaction_app
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ChapterScoreHeadCVCell.h"

@implementation ChapterScoreHeadCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    if (UI_IS_IPHONE_X) {
        self.btn_back_top.constant = 44;
    }
}
- (void)contentNumber:(NSString *)number {
    self.lbl_content.text = [NSString stringWithFormat:@"很遗憾，您本章正确率为 %@%@\n再接再厉！！",number,@"%"];
    NSMutableAttributedString *atb_str = [[NSMutableAttributedString alloc] initWithString:self.lbl_content.text];
    [atb_str addAttributes:@{NSForegroundColorAttributeName:HexRGB(0xF7DE0D),NSFontAttributeName:[UIFont boldSystemFontOfSize:17]} range:NSMakeRange(12, number.length+1)];
    [atb_str addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:17]} range:NSMakeRange(self.lbl_content.text.length-6, 6)];
    self.lbl_content.attributedText = atb_str;
}
- (void)leftNumber:(NSString *)number andTotal:(NSString *)total
{
    self.lbl_left.text = [NSString stringWithFormat:@"答对：%@ /%@题",number,total];
    NSMutableAttributedString *atb_str = [[NSMutableAttributedString alloc] initWithString:self.lbl_left.text];
    [atb_str addAttributes:@{NSForegroundColorAttributeName:HexRGB(0xF7DE0D),NSFontAttributeName:[UIFont boldSystemFontOfSize:17]} range:NSMakeRange(3, number.length)];
    self.lbl_left.attributedText = atb_str;
}

- (void)rightNumber:(NSString *)number andTotal:(NSString *)total
{
    self.lbl_right.text = [NSString stringWithFormat:@"已答：%@ /%@题",number,total];
    NSMutableAttributedString *atb_str = [[NSMutableAttributedString alloc] initWithString:self.lbl_right.text];
    [atb_str addAttributes:@{NSForegroundColorAttributeName:HexRGB(0xF7DE0D),NSFontAttributeName:[UIFont boldSystemFontOfSize:17]} range:NSMakeRange(3, number.length)];
    self.lbl_right.attributedText = atb_str;
}
@end
