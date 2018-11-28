//
//  ConsolidateHotMainVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ConsolidateHotMainVC.h"
#import "ConsolidateHotMainCollection.h"
#import "RechargeMainBottomView.h"

@interface ConsolidateHotMainVC ()
@property (nonatomic, strong) ConsolidateHotMainCollection *collection_main;
@property (nonatomic, strong) UIButton *btn_right;
@property (nonatomic, strong) RechargeMainBottomView *view_bottom;
@end

@implementation ConsolidateHotMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setnavbg_defa];
    self.btn_right = [self createNavigationLeftItem:NO andImage:@"" andTitle:@"排序"];
    [[self.btn_right rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        //刷新数据
    }];
    
    self.title = @"热点考题";
    [self.view addSubview:self.collection_main];
    [self.view addSubview:self.view_bottom];
    
    self.collection_main.array_models = [@[@"1",@"2",@"3",@"4",@"5",@"1",@"2",@"3",@"4",@"5",@"1",@"2",@"3",@"4",@"5"] mutableCopy];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
#pragma --- view creat
- (ConsolidateHotMainCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0.0;
        layout.minimumInteritemSpacing = 4.0;
        
        _collection_main = [[ConsolidateHotMainCollection alloc] initWithFrame:(CGRect){0, 0, ZTWidth, ZTHeight-NaviIPHONEX} collectionViewLayout:layout];
        _collection_main.backgroundColor = HexRGB(0xF1F0F0);
//        @weakify(self)
//        [_collection_main setBlockAllChoise:^(BOOL all) {
//            @strongify(self)
//            self.view_bottom.btn_left.selected = all;
//        }];
    }
    return _collection_main;
}
- (RechargeMainBottomView *)view_bottom {
    if (!_view_bottom) {
        _view_bottom = [[RechargeMainBottomView alloc] initWithFrame:(CGRect){0,ZTHeight,ZTWidth,50} andViewType:BottomViewTypeCollection];
        
        @weakify(self)
        [_view_bottom setBlockActionClick:^(NSString * _Nonnull title) {
            @strongify(self)
            if ([title isEqualToString:@"上一页"]) {

            }
            else if ([title isEqualToString:@"下一页"]) {
                
            }
            else{

            }
            [self.collection_main reloadData];
        }];
    }
    return _view_bottom;
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
