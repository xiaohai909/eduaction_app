//
//  topFilterCell.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/21.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "topFilterCell.h"

@implementation topFilterCell
{
    UIButton *rightArrow;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    rightArrow.hidden = !selected;
    self.selectBtn.selected = selected;

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        rightArrow = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightArrow setImage:[UIImage imageNamed:@"curriculum_btn_opt"] forState:UIControlStateNormal];
        [self addSubview:rightArrow];
        rightArrow.hidden = YES;
        rightArrow.userInteractionEnabled = NO;
        [rightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(44, 44));
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(0);
        }];
        self.selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.selectBtn setTitleColor:HexRGB(0xFF6B6B) forState:UIControlStateSelected];
        [self.selectBtn setTitleColor:HexRGB(0x666666) forState:UIControlStateNormal];
        [_selectBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [self addSubview:self.selectBtn];
        self.selectBtn.userInteractionEnabled = NO;
        self.selectBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(44);
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(0);
            make.right.mas_equalTo(rightArrow.mas_left).offset(-10);
        }];
        
    }
    return self;
}
@end
