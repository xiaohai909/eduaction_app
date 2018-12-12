//
//  MakeProblemOptionCVCell.m
//  eduaction_app
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MakeProblemOptionCVCell.h"

@implementation MakeProblemOptionCVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.btn_order.layer.cornerRadius = 10.0;
    self.btn_order.layer.masksToBounds = YES;
    self.btn_order.layer.borderWidth = 1.0;
    self.btn_order.layer.borderColor = HexRGB(0xFF6B6B).CGColor;
}

- (void)setContent:(NSString *)title andOption:(NSString *)option andState:(OptionState)state {
    if (state == OptionStateError) {
        self.btn_order.layer.borderWidth = 0.0;
        [self.btn_order setImage:[UIImage imageNamed:@"wrong question_btn_fork"] forState:UIControlStateNormal];
        [self.btn_order setTitle:@"" forState:UIControlStateNormal];
        [self.btn_content setTitleColor:HexRGB(0xFF6B6B) forState:UIControlStateNormal];
    }
    else if (state == OptionStateRight) {
        self.btn_order.layer.borderWidth = 0.0;
        [self.btn_order setImage:[UIImage imageNamed:@"wrong question_btn_check"] forState:UIControlStateNormal];
        [self.btn_order setTitle:@"" forState:UIControlStateNormal];
        [self.btn_content setTitleColor:HexRGB(0x179AF5) forState:UIControlStateNormal];
    }
    else{
        self.btn_order.layer.borderWidth = 1.0;
        [self.btn_order setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [self.btn_order setTitle:option forState:UIControlStateNormal];
        [self.btn_content setTitleColor:HexRGB(0x1F1F1F) forState:UIControlStateNormal];
    }
    
    [self.btn_content setTitle:title forState:UIControlStateNormal];
}
//+ (NSString *)getOption:(NSInteger)row
//{
//    return [@"ABCDEFGHIJKLMNOPQRSTUVWXYZ" substringWithRange:NSMakeRange(row, 1)];
//}
@end
