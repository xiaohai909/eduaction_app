//
//  ChapterMainCVCell.m
//  eduaction_app
//
//  Created by Mac on 2018/11/5.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ChapterMainCVCell.h"

@implementation ChapterMainCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.layer.shadowColor = HexRGBAlpha(0x212121,0.2).CGColor;
    self.contentView.layer.shadowOffset = CGSizeMake(0,2);
    self.contentView.layer.shadowOpacity = 1;
    self.contentView.layer.shadowRadius = 9;
    self.contentView.layer.cornerRadius = 2.5;
}

- (void)leftNumber:(NSString *)number andTotal:(NSString *)total
{
    self.lbl_leftNumber.text = [NSString stringWithFormat:@"%@ /%@题",number,total];
    NSMutableAttributedString *atb_str = [[NSMutableAttributedString alloc] initWithString:self.lbl_leftNumber.text];
    [atb_str addAttributes:@{NSForegroundColorAttributeName:HexRGB(0xFF6F69),NSFontAttributeName:[UIFont boldSystemFontOfSize:17]} range:NSMakeRange(0, number.length)];
    self.lbl_leftNumber.attributedText = atb_str;
}

- (void)rightNumber:(NSString *)number
{
    self.lbl_rightNumber.text = [NSString stringWithFormat:@"%@ 题",number];
    NSMutableAttributedString *atb_str = [[NSMutableAttributedString alloc] initWithString:self.lbl_rightNumber.text];
    [atb_str addAttributes:@{NSForegroundColorAttributeName:HexRGB(0xFF6F69),NSFontAttributeName:[UIFont boldSystemFontOfSize:17]} range:NSMakeRange(0, number.length)];
    self.lbl_rightNumber.attributedText = atb_str;
}
@end
