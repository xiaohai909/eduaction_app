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
@interface testGuideVC ()
@property(nonatomic,strong)testCommTab *myTab;
@end

@implementation testGuideVC
-(testCommTab *)myTab{
    
    if (!_myTab) {
        _myTab = [[testCommTab alloc]initWithFrame:CGRectMake(0, 0, ZTWidth, ZTHeight-NaviIPHONEX) style:UITableViewStylePlain];
        _myTab.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ZTWidth, 0.1)];
        @weakify(self);
        [[[_myTab clickIndex] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
            @strongify(self);
            testGuideDetailVc *cont = [[testGuideDetailVc alloc]init];
            [cont setTitle:@"考试指南"];
            [self.navigationController pushViewController:cont animated:YES];
        }];
        
    }
    return _myTab;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.myTab];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
    [self setnavbg_defa];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
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
