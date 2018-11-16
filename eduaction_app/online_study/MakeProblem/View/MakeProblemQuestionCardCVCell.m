//
//  MakeProblemQuestionCardCVCell.m
//  eduaction_app
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MakeProblemQuestionCardCVCell.h"

@implementation MakeProblemQuestionCardCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.btn_number.layer.cornerRadius = self.btn_number.py_width/2.0;
    self.btn_number.layer.masksToBounds = YES;
}

- (void)setBtnTiltle:(NSString *)title andMode:(QuestionCardMode)mode
{
    [self.btn_number setTitle:title forState:UIControlStateNormal];
    
    switch (mode) {
        case QuestionCardModeNormal:
            self.btn_number.backgroundColor = HexRGB(0xD0D0D0);
            [self.btn_number setTitleColor:HexRGB(0x666666) forState:UIControlStateNormal];
            break;
        case QuestionCardModeRight:
            self.btn_number.backgroundColor = HexRGBAlpha(0xFF6B6B,0.5);
            [self.btn_number setTitleColor:HexRGB(0xFF6B6B) forState:UIControlStateNormal];
            break;
        case QuestionCardModeWrong:
            self.btn_number.backgroundColor = HexRGBAlpha(0x179AF5,0.5);
            [self.btn_number setTitleColor:HexRGB(0x1273CE) forState:UIControlStateNormal];
            break;
            
        case QuestionCardModeNowNormal:
            self.btn_number.backgroundColor = HexRGB(0x333333);
            [self.btn_number setTitleColor:HexRGB(0xFFFFFF) forState:UIControlStateNormal];
            break;
        case QuestionCardModeNowRight:
            self.btn_number.backgroundColor = HexRGB(0xFF6B6B);
            [self.btn_number setTitleColor:HexRGB(0xFFFFFF) forState:UIControlStateNormal];
            break;
        case QuestionCardModeNowWrong:
            self.btn_number.backgroundColor = HexRGB(0x179AF5);
            [self.btn_number setTitleColor:HexRGB(0xFFFFFF) forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}
@end
