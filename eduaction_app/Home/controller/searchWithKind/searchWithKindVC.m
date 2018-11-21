//
//  searchWithKindVC.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/19.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "searchWithKindVC.h"
#import "searchKindVM.h"
#import "TopfilteringV.h"
@interface searchWithKindVC ()
@property (strong, nonatomic) ZYSideSlipFilterController *filterController;
@property (strong, nonatomic) searchKindVM *filterVM;
@end

@implementation searchWithKindVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.filterVM = [[searchKindVM alloc]init];
    
    [self setfilterV];
    
    // Do any additional setup after loading the view.
}
-(void)setfilterV{
    
    self.filterController = [[ZYSideSlipFilterController alloc] initWithSponsor:self resetBlock:^(NSArray *dataList) {
        
        
        [self.filterVM resetFunction:dataList];
        
    } commitBlock:^(NSArray *dataList) {
        
        
        
        
    }];
    
    _filterController.animationDuration = .3f;
    _filterController.sideSlipLeading = 0.15*[UIScreen mainScreen].bounds.size.width;
    _filterController.dataList = [self.filterVM packageDataList:[[NSMutableArray alloc]initWithArray:@[@"授课方式",@"授课类型",@"价格区间"]]];
    [_filterController show];
    [self.filterController.commitBtn setBackgroundImage:[UIImage imageNamed:@"curriculum_bottom_btn_bg"] forState:UIControlStateNormal];
    [self.filterController.commitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
 
    //self.filterController.BottomV.py_height = UI_IS_IPHONE_X?88:64;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
