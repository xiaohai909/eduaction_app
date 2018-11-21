//
//  TopfilteringV.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/19.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "TopfilteringV.h"

@implementation TopfilteringV

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    
    if ([super initWithFrame:frame]) {
        //self.backgroundColor = HexRGBAlpha(0x000000, 0.6);
        
        UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ZTWidth, 40)];
        topView.backgroundColor = [UIColor whiteColor];
        [self addSubview:topView];
        
        CGFloat btnwidth = (ZTWidth-3)/3.0;
        
        NSArray *title = @[@"分类",@"排序",@"筛选"];
        NSArray *image = @[@"curriculum_btn_pull",@"curriculum_btn_pull",@"curriculum_btn_filtrate_nor"];
        
        for (NSInteger i = 0 ; i<title.count; i++) {
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitleColor:HexRGB(0x666666) forState:UIControlStateNormal];
            [btn setTitle:[NSString stringWithFormat:@"%@",title[i]] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
            [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
            [btn setImage:[UIImage imageNamed:image[i]] forState:UIControlStateNormal];
            btn.isImageRight = YES;
            [topView addSubview:btn];
            btn.tag = i+1;
            [btn addTarget:self action:@selector(clickTopBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(btnwidth, topView.py_height));
                make.left.mas_equalTo((btnwidth+1)*i);
                make.top.mas_equalTo(0);
            }];
            UIView *line = [[UIView alloc]init];
            line.backgroundColor = HexRGB(0xAFAFAF);
            [topView addSubview:line];
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(btn.mas_right);
                make.centerY.mas_equalTo(topView.mas_centerY);
                make.height.mas_equalTo(20);
                make.width.mas_equalTo(1);
            }];
        }
        
        
    }
    return self;
}
-(void)clickTopBtn:(UIButton *)sender{
    
    if (sender.tag ==3) {
        
        if (sender.selected == NO) {
            
            [self.filterController show];
        }
        else{
            [self.filterController dismiss];
        }
        sender.selected = !sender.selected;
    }
    
}
-(void)setfilterV:(UIViewController *)view{
    
    self.filterController = [[ZYSideSlipFilterController alloc] initWithSponsor:view resetBlock:^(NSArray *dataList) {
        
        
        [self.viewMode resetFunction:dataList];
        
    } commitBlock:^(NSArray *dataList) {
        
        
        
        
    }];
    
    _filterController.animationDuration = .3f;
    _filterController.sideSlipLeading = 0.15*[UIScreen mainScreen].bounds.size.width;
    _filterController.dataList = [self.viewMode packageDataList:[[NSMutableArray alloc]initWithArray:@[@"授课方式",@"授课类型",@"价格区间"]]];
    //[_filterController show];
    [self.filterController.commitBtn setBackgroundImage:[UIImage imageNamed:@"curriculum_bottom_btn_bg"] forState:UIControlStateNormal];
    [self.filterController.commitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //self.filterController.BottomV.py_height = UI_IS_IPHONE_X?88:64;
}
@end
