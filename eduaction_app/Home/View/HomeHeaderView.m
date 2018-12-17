//
//  HomeHeaderView.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/2.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "HomeHeaderView.h"





@implementation HomeHeaderView
{
    ImagePlayerView *playerImageView;
    UIView *secbg;
    
    UIButton *todaybtn;
    UIButton *hisbtn;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        
        
        _ClickHeader_btn = [RACSubject subject];
        
        [self setSCview];
        [self setup_secbg];
        [self setthirview];
        
        
    }
    return self;
}
-(void)setSCview
{
    
    playerImageView  = [[ImagePlayerView alloc]initWithFrame:CGRectMake(0, 0, ZTWidth, ZTWidth*0.4)];
    
    playerImageView.imagePlayerViewDelegate = self;
    
    // set auto scroll interval to x seconds
    playerImageView.scrollInterval = 2.0;
    
    // adjust pageControl position
    playerImageView.pageControlPosition = ICPageControlPosition_BottomCenter;
    
    // hide pageControl or not
    playerImageView.hidePageControl = NO;
    
    // endless scroll
    playerImageView.endlessScroll = YES;
    // adjust edgeInset
    //    self.imagePlayerView.edgeInsets = UIEdgeInsetsMake(10, 20, 30, 40);
    
    
    playerImageView.backgroundColor=[UIColor clearColor];
    [self addSubview:playerImageView];
    
    
}
-(void)setup_secbg{
    
   CGFloat bgheight = (btnwidth*2+2*topspace+centerspcae+2*titlespcae+2*btn_title_height);
   CGFloat btn_bwt_spcae = (ZTWidth - (btnwidth*4 + leftspace*2))/3.0;
    
    secbg =[[UIView alloc]init];
    [secbg setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:secbg];
    [secbg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.width.mas_equalTo(ZTWidth);
        make.height.mas_equalTo(bgheight);
        make.top.mas_equalTo(playerImageView.mas_bottom);
        make.left.mas_equalTo(0);
    }];
    
    
    NSArray *iconArr = @[@[@"index_sort_btn_01",@"index_sort_btn_02",@"index_sort_btn_03",@"index_sort_btn_04"],@[@"index_sort_btn_05",@"index_sort_btn_06",@"index_sort_btn_07",@"index_sort_btn_08"]];
     NSArray *titleArr = @[@[@"执兽培训",@"技能培训",@"推荐课程",@"公开课"],@[@"本地缓存",@"考试指南",@"药物查询",@"在线题库"]];
    
    for (NSInteger i = 0 ; i<iconArr.count; i++) {
        
        NSArray *temp = [iconArr objectAtIndex:i];
        NSArray *temp_title = [titleArr objectAtIndex:i];
        
        for (NSInteger j= 0; j<temp.count; j++) {
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag = i*4+j+1;
            [btn setImage:[UIImage imageNamed:temp[j]] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(CenterBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [secbg addSubview:btn];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(btnwidth, btnwidth));
                make.left.mas_equalTo(leftspace+(btn_bwt_spcae+btnwidth)*j);
                make.top.mas_equalTo(topspace+(btnwidth+titlespcae+centerspcae+btn_title_height)*i);
                
            }];
            [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
                
                [_ClickHeader_btn sendNext:@(btn.tag)];
                
            }];
            UILabel *lab = [[UILabel alloc]init];
            lab.font = [UIFont systemFontOfSize:13];
            lab.textColor = HexRGB(0x444754);
            lab.textAlignment = NSTextAlignmentCenter;
            [secbg addSubview:lab];
            lab.text = temp_title[j];
            [lab mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.height.mas_equalTo(14);
                make.top.mas_equalTo(btn.mas_bottom).offset(titlespcae);
                make.centerX.mas_equalTo(btn.mas_centerX);
            }];
            
        }
        
    }
    
}
-(void)setthirview{
    
    todaybtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [todaybtn setBackgroundImage:[UIImage imageNamed:@"iindex_sort_btn_09"] forState:UIControlStateNormal];
    [self addSubview:todaybtn];
    [todaybtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(secbg.mas_bottom).offset(10);
        make.height.mas_equalTo(84);
        make.width.mas_equalTo((ZTWidth-30)/2.0);
    }];
    [[todaybtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [_ClickHeader_btn sendNext:@(9)];
    }];
    hisbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [hisbtn setBackgroundImage:[UIImage imageNamed:@"iindex_sort_btn_10"] forState:UIControlStateNormal];
    [self addSubview:hisbtn];
    [hisbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(secbg.mas_bottom).offset(10);
        make.height.mas_equalTo(84);
        make.width.mas_equalTo((ZTWidth-30)/2.0);
    }];
    [[hisbtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [_ClickHeader_btn sendNext:@(10)];
    }];
    
}
-(void)CenterBtnClick:(UIButton *)sender
{
    
}
/**
 *  Number of items
 *
 *  @return Number of items
 */
- (NSInteger)numberOfItems
{
    
    
    return 1;
    
}

/**
 *  Init imageview
 *
 *  @param imagePlayerView ImagePlayerView object
 *  @param imageView       UIImageView object
 *  @param index           index of imageview
 */
- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView loadImageForImageView:(UIImageView *)imageView index:(NSInteger)index{
    
     DDLogVerbose(@"imagePlayerView loadImageForImageView %@", @(index));
}



/**
 *  Tap ImageView action
 *
 *  @param imagePlayerView ImagePlayerView object
 *  @param index           index of imageview
 */
- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView didTapAtIndex:(NSInteger)index{
    
    DDLogVerbose(@"imagePlayerView didTapAtIndex %@", @(index));
}

/**
 *  Scroll ImageView action
 *  @param imagePlayerView ImagePlayerView object
 *  @param index           current index
 **/
- (void)imagePlayerView:(ImagePlayerView *)imagePlayerView didScorllIndex:(NSInteger)index{
    
    DDLogVerbose(@"imagePlayerView didScorllIndex %@", @(index));
}
@end
