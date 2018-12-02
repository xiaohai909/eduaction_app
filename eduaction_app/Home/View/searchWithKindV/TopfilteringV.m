//
//  TopfilteringV.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/19.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "TopfilteringV.h"
#import "topFilterCell.h"
@implementation TopfilteringV
{
    UITableView *kinSelectTab;
    NSMutableArray *filterData1;
    NSMutableArray *filterData2;
    

    
    NSInteger selectindex_1;
    NSInteger selectindex_2;
    
    
    UIView *topView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@synthesize selectTopindex;
-(instancetype)initWithFrame:(CGRect)frame{
    
    if ([super initWithFrame:frame]) {
        //self.backgroundColor = HexRGBAlpha(0x000000, 0.6);
        
        
        filterData1 = [[NSMutableArray alloc]initWithArray:@[@"全部课程",@"阅读写作"]];
        filterData2 = [[NSMutableArray alloc]initWithArray:@[@"热门课程",@"最新开课"]];
        selectTopindex  = 0;
        self.clickIndex = [RACSubject subject];
        
        topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ZTWidth, 40)];
        topView.backgroundColor = [UIColor whiteColor];
        [self addSubview:topView];
        
        CGFloat btnwidth = (ZTWidth-3)/3.0;
        
        NSArray *title = @[@"分类",@"排序",@"筛选"];
        NSArray *image = @[@"curriculum_btn_pull",@"curriculum_btn_pull",@"curriculum_btn_filtrate_nor"];
        NSArray *imageSelect = @[@"curriculum_btn_push",@"curriculum_btn_push",@"curriculum_btn_filtrate_sel"];
        
        for (NSInteger i = 0 ; i<title.count; i++) {
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitleColor:HexRGB(0x666666) forState:UIControlStateNormal];
            [btn setTitle:[NSString stringWithFormat:@"%@",title[i]] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
            [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
            [btn setImage:[UIImage imageNamed:image[i]] forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:imageSelect[i]] forState:UIControlStateSelected];
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
    
        UIView *bottomV = [[UIView alloc]initWithFrame:CGRectMake(0, 40, ZTWidth, ZTHeight - 40 - NaviIPHONEX)];
        bottomV.backgroundColor = [UIColor clearColor];
        [self addSubview:bottomV];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture)];
        [bottomV addGestureRecognizer:tap];
        
        kinSelectTab =[[UITableView alloc]initWithFrame:CGRectMake(0, 40, ZTWidth, (filterData1.count*44<(ZTHeight - 40 - NaviIPHONEX)/2.0)?filterData1.count*44:(ZTHeight - 40 - NaviIPHONEX)/2.0) style:UITableViewStyleGrouped];
        kinSelectTab.delegate = self;
        kinSelectTab.dataSource =self;
        kinSelectTab.hidden = YES;
        kinSelectTab.backgroundColor = [UIColor clearColor];
        [self addSubview:kinSelectTab];
        @weakify(self);
        [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"clickBackCover" object:nil]takeUntil:self.rac_willDeallocSignal] subscribeNext:^(NSNotification * _Nullable x) {
            @strongify(self);
            
            DDLogVerbose(@"%s 接收到通知，x = %@", __FUNCTION__, x);
            UIButton *btn3 = [self->topView viewWithTag:3];
            btn3.selected = NO;
        }];

        
    }
    return self;
}
-(void)tapGesture{
    kinSelectTab.hidden = YES;
    UIButton *btn1 = [topView viewWithTag:1];
    UIButton *btn2 = [topView viewWithTag:2];
    UIButton *btn3 = [topView viewWithTag:3];
    btn1.selected = NO;
    btn2.selected = NO;
    btn3.selected = NO;
    self.backgroundColor = [UIColor clearColor];
}
-(void)updatefilterArr:(NSArray *)arr{
    
  
   
}
-(void)clickTopBtn:(UIButton *)sender{
    UIButton *btn1 = [topView viewWithTag:1];
    UIButton *btn2 = [topView viewWithTag:2];
    UIButton *btn3 = [topView viewWithTag:3];
    
    if (sender.tag ==3) {
        selectTopindex = 2;
        self.backgroundColor = [UIColor clearColor];
        btn1.selected = NO;
        btn2.selected = NO;
        kinSelectTab.hidden = YES;
        if (sender.selected == NO) {
            
            [self.filterController show];
        }
        else{
            [self.filterController dismiss:^{
                
            }];
        }
        
    }
    else if (sender.tag == 1){
        [self.filterController dismiss:^{
            
        }];
        self.backgroundColor = HexRGBAlpha(0x000000, 0.6);
        btn3.selected = NO;
        btn2.selected = NO;
        if (sender.selected == NO) {
        kinSelectTab.hidden = NO;
        selectTopindex = 0;
         [kinSelectTab reloadData];
         [kinSelectTab selectRowAtIndexPath:[NSIndexPath indexPathForRow:selectindex_1 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
        kinSelectTab.frame =CGRectMake(0, 40, ZTWidth, (filterData1.count*44<(ZTHeight - 40 - NaviIPHONEX)/2.0)?filterData1.count*44:(ZTHeight - 40 - NaviIPHONEX)/2.0);
        }
        else{
        kinSelectTab.hidden = YES;
        [kinSelectTab reloadData];
        }
        
    }
    else if (sender.tag == 2){
        [self.filterController dismiss:^{
            
        }];
        self.backgroundColor = HexRGBAlpha(0x000000, 0.6);
        btn1.selected = NO;
        btn3.selected = NO;
        if (sender.selected ==NO) {
            kinSelectTab.hidden = NO;
            selectTopindex = 1;
            [kinSelectTab reloadData];
            [kinSelectTab selectRowAtIndexPath:[NSIndexPath indexPathForRow:selectindex_2 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
            kinSelectTab.frame =CGRectMake(0, 40, ZTWidth, (filterData2.count*44<(ZTHeight - 40 - NaviIPHONEX)/2.0)?filterData1.count*44:(ZTHeight - 40 - NaviIPHONEX)/2.0);
        }
        else{
            kinSelectTab.hidden = YES;
            [kinSelectTab reloadData];
        }
      
    }
    sender.selected = !sender.selected;
    [self.clickIndex sendNext:@(selectTopindex)];
    
}
-(void)setfilterV:(UIViewController *)view{
    @weakify(self);
    self.filterController = [[ZYSideSlipFilterController alloc] initWithSponsor:view resetBlock:^(NSArray *dataList) {
        @strongify(self);
        
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
#pragma mark table delaget
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 3;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ZTWidth, 3)];
    view.backgroundColor = HexRGB(0xF1F0F0);
    return view;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (selectTopindex == 0) {
          return filterData1.count;
    }
    else if (selectTopindex == 1) {
        
        return filterData2.count;
    }
    return 0;
  
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    topFilterCell *cell = (topFilterCell *)[tableView dequeueReusableCellWithIdentifier:@"filterCell"];
    if (!cell) {
        cell = [[topFilterCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"filterCell"];
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (selectTopindex == 0) {
        
    [cell.selectBtn setTitle:filterData1[indexPath.row] forState:UIControlStateNormal];
        
    }
    else if (selectTopindex == 1) {
        
   
    [cell.selectBtn setTitle:filterData2[indexPath.row] forState:UIControlStateNormal];
    
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DDLogVerbose(@"Select index %@",indexPath);
    if (selectTopindex == 0) {
        
        
        selectindex_1 = indexPath.row;
        
    }
    else if (selectTopindex == 1) {
        selectindex_2 =indexPath.row;
    }
    
}
-(void)dealloc{
    

}
@end
