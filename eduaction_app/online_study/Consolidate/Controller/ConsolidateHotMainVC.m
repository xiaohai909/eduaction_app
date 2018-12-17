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
#import "ConsolidateBottomPageView.h"

#import "MakeProblemMainModel.h"

@interface ConsolidateHotMainVC ()
@property (nonatomic, strong) ConsolidateHotMainCollection *collection_main;
@property (nonatomic, strong) UIButton *btn_right;
@property (nonatomic, strong) ConsolidateBottomPageView *view_page;
@property (nonatomic, strong) DataModel *data_model;
@property (nonatomic, assign) NSInteger pageCount;
@end

@implementation ConsolidateHotMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setnavbg_defa];
    self.btn_right = [self createNavigationLeftItem:NO andImage:@"" andTitle:@"排序"];
    [[self.btn_right rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        //刷新数据
#warning mark --- 这里要对数据进行排序
        [self requestRefresh:YES];
    }];
//
    self.title = @"热点考题";
    [self.view addSubview:self.view_page];
    [self.view addSubview:self.collection_main];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
#pragma --- view creat
- (ConsolidateHotMainCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0.0;
        layout.minimumInteritemSpacing = 4.0;
        
        _collection_main = [[ConsolidateHotMainCollection alloc] initWithFrame:(CGRect){0, 0, ZTWidth, ZTHeight-NaviIPHONEX-TabIPHONEX} collectionViewLayout:layout];
        _collection_main.backgroundColor = HexRGB(0xF1F0F0);
        //数据
        [self requestRefresh:YES];
    }
    return _collection_main;
}
- (ConsolidateBottomPageView *)view_page
{
    if (!_view_page) {
        _view_page = [ConsolidateBottomPageView instancetypeWithXib];
        _view_page.frame = (CGRect){0,ZTHeight-NaviIPHONEX-TabIPHONEX,ZTWidth,TabIPHONEX};
        @weakify(self)
        _view_page.tag = 1;
        [[_view_page.btn_last rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self)
            if (self.view_page.tag>1) {
                self.view_page.tag -= 1;
                self.view_page.lbl_now.text = [NSString stringWithFormat:@"%@/%@",@(self.view_page.tag),@(self.pageCount)];
                self.collection_main.array_models = (NSMutableArray *)[self.data_model.result subarrayWithRange:NSMakeRange((self.view_page.tag-1)*10, 10)];
                [self.collection_main reloadData];
            }
            else{
                DDLogVerbose(@"没有上一页");
            }
        }];
        [[_view_page.btn_next rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self)
            if (self.view_page.tag<self.pageCount) {
                self.view_page.tag += 1;
                if (self.data_model.pageNumber>=_view_page.tag) {
                    self.view_page.lbl_now.text = [NSString stringWithFormat:@"%@/%@",@(self.view_page.tag),@(self.pageCount)];
                    self.collection_main.array_models = (NSMutableArray *)[self.data_model.result subarrayWithRange:NSMakeRange((self.view_page.tag-1)*10, 10)];
                    [self.collection_main reloadData];
                }
                else{
                    [self requestRefresh:NO];
                }
            }
            else{
                DDLogVerbose(@"没有下一页");
            }
        }];
    }
    return _view_page;
}
#pragma mark --- request
- (void)requestRefresh:(BOOL)refresh
{
    NSInteger page = refresh?1:self.data_model.pageNumber+1;
    [SQNetworkInterface iRequestConsolidateHotParames:@{@"userId":@"33",@"page":@(page),@"rows":@"10"} andResult:^(NSInteger state, NSString * _Nonnull msg, NSString * _Nonnull total, id  _Nonnull resultData) {
        if (state == CODE_SUCCESS) {
            NSMutableArray *array = [MakeProblemMainModel mj_objectArrayWithKeyValuesArray:resultData];
            self.collection_main.array_models = array;
            self.pageCount = ([total integerValue]%10)?([total integerValue]/10+1):([total integerValue]/10);
            self.view_page.lbl_now.text = [NSString stringWithFormat:@"%@/%@",@(page),@(self.pageCount)];
            self.title = [NSString stringWithFormat:@"热点考题（%@）",total];
            if (refresh) {
                self.data_model = [DataModel new];
                self.data_model.result = [NSMutableArray arrayWithArray:array];
            }
            else{
                self.data_model.pageNumber = page;
                [self.data_model.result addObjectsFromArray:array];
            }
            if (array.count == 0 || array.count<10) {
                [self.collection_main.mj_footer endRefreshingWithNoMoreData];
            }
        }
        [self.collection_main reloadData];
        [self.collection_main stopHeaderRefresh];
    }];
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
