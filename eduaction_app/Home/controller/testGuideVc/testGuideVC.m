//
//  testGuideVC.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/30.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "testGuideVC.h"
#import "testGuideDetailVc.h"
#import "testCommTab.h"
#import "guideVMode.h"
@interface testGuideVC ()
{
    BOOL isfirstin;
}
@property(nonatomic,strong)testCommTab *myTab;
@property(nonatomic,strong)guideVMode *myVmode;
@end

@implementation testGuideVC
-(testCommTab *)myTab{
    
    if (!_myTab) {
        _myTab = [[testCommTab alloc]initWithFrame:CGRectMake(0, 0, ZTWidth, ZTHeight-NaviIPHONEX) style:UITableViewStylePlain];
        _myTab.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ZTWidth, 0.1)];


        @weakify(self);
        if (!self.isSec) {
            
            self.myTab.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                @strongify(self);
                [[self.myVmode headerReq] execute:nil];
            }];
        }
        
        [[[self.myTab clickIndex] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
            @strongify(self);
            testGuideVC *cont = [[testGuideVC alloc]init];
            cont.isSec = YES;
            cont.secDataArr = [[NSMutableArray alloc]initWithArray:x];
            [self.navigationController pushViewController:cont animated:YES];
        }];
    }
    return _myTab;
}
- (id)init {
    self = [super init];
    if (self) {
        self.myVmode = [guideVMode new];
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    @weakify(self);
    if (!self.isSec) {
    [[[self.myVmode.headerReq executionSignals] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        
        @strongify(self);
        [self.myTab.mj_header endRefreshing];
        [[x takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
              @strongify(self);
            if ([x isKindOfClass:[testGuideReqModeBaseClass class]]) {
                
                testGuideReqModeBaseClass *mode = x;
                if (mode.resultCode == 10000) {
                    [self.myTab setreqDataSource:mode];
                }
                DDLogVerbose(@"%@",x);
                
            }
        }];
        
        
    }];
    }
    else{
        
        [self.myTab setereqDataSourceWitharr:self.secDataArr];
    }
   
    
    [self.view addSubview:self.myTab];
    
   
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    [self setnavbg_defa];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    if (!isfirstin && !self.isSec) {
        isfirstin = YES;
        [[self.myTab mj_header] beginRefreshing];
    }
}
-(void)dealloc{
    
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
