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
    
    self.btn_back_top.constant = UI_IS_IPHONE_X?0:20;

    self.img_head.layer.cornerRadius = self.img_head.py_height/2.0;
    self.img_head.layer.masksToBounds = YES;
}
- (void)contentNumber:(NSString *)number {
    
    if ([number floatValue]>80) {
        self.lbl_content.text = [NSString stringWithFormat:@"您本章正确率为 %@\n真棒！！",number];
    }
    else if ([number floatValue]>60) {
        self.lbl_content.text = [NSString stringWithFormat:@"您本章正确率为 %@\n再接再厉！！",number];
    }
    else{
        self.lbl_content.text = [NSString stringWithFormat:@"您本章正确率为 %@\n继续努力！！",number?number:@"0%"];
    }
    
    NSMutableAttributedString *atb_str = [[NSMutableAttributedString alloc] initWithString:self.lbl_content.text];
    [atb_str addAttributes:@{NSForegroundColorAttributeName:HexRGB(0xF7DE0D),NSFontAttributeName:[UIFont boldSystemFontOfSize:17]} range:NSMakeRange(8, number.length?number.length:2)];
    [atb_str addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:17]} range:NSMakeRange(self.lbl_content.text.length-6, 6)];
    self.lbl_content.attributedText = atb_str;
}
- (void)leftNumber:(NSString *)number andTotal:(NSString *)total
{
    self.lbl_left.text = [NSString stringWithFormat:@"答对：%@ /%@题",number?number:@"0",total?total:@"0"];
    NSMutableAttributedString *atb_str = [[NSMutableAttributedString alloc] initWithString:self.lbl_left.text];
    [atb_str addAttributes:@{NSForegroundColorAttributeName:HexRGB(0xF7DE0D),NSFontAttributeName:[UIFont boldSystemFontOfSize:17]} range:NSMakeRange(3, number.length?number.length:1)];
    self.lbl_left.attributedText = atb_str;
}

- (void)rightNumber:(NSString *)number andTotal:(NSString *)total
{
    self.lbl_right.text = [NSString stringWithFormat:@"已答：%@ /%@题",number?number:@"0",total?total:@"0"];
    NSMutableAttributedString *atb_str = [[NSMutableAttributedString alloc] initWithString:self.lbl_right.text];
    [atb_str addAttributes:@{NSForegroundColorAttributeName:HexRGB(0xF7DE0D),NSFontAttributeName:[UIFont boldSystemFontOfSize:17]} range:NSMakeRange(3, number.length?number.length:1)];
    self.lbl_right.attributedText = atb_str;
}
@end
