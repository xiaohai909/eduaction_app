//
//  MyCollectionMainVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/13.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MyCollectionMainVC.h"
#import "MyCollectionMainCollection.h"
#import "RechargeMainBottomView.h"
#import "ConsolidateBottomPageView.h"

@interface MyCollectionMainVC ()
@property (nonatomic, strong) MyCollectionMainCollection *collection_main;
@property (nonatomic, strong) UIButton *btn_right;
@property (nonatomic, strong) RechargeMainBottomView *view_bottom;
@property (nonatomic, strong) ConsolidateBottomPageView *view_page;
@property (nonatomic, strong) DataModel *data_model;
@end

@implementation MyCollectionMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setnavbg_defa];
    self.btn_right = [self createNavigationLeftItem:NO andImage:@"" andTitle:@"编辑"];
    [self.btn_right setTitle:@"完成" forState:UIControlStateSelected];
    [[self.btn_right rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        self.btn_right.selected = !self.btn_right.selected;
        [self changeViewMode];
    }];
    
    self.title = @"我的收藏";
    [self.view addSubview:self.collection_main];
    [self.view addSubview:self.view_page];
    [self.view addSubview:self.view_bottom];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
#pragma --- view creat
- (MyCollectionMainCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 1.0;
        layout.minimumInteritemSpacing = 4.0;
        
        _collection_main = [[MyCollectionMainCollection alloc] initWithFrame:(CGRect){0, 0, ZTWidth, ZTHeight-NaviIPHONEX-self.view_page.py_height} collectionViewLayout:layout];
        _collection_main.backgroundColor = HexRGB(0xF1F0F0);
        @weakify(self)
        [_collection_main setBlockAllChoise:^(BOOL all) {
            @strongify(self)
            self.view_bottom.btn_left.selected = all;
        }];
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
                self.collection_main.array_models = (NSMutableArray *)[self.data_model.result subarrayWithRange:NSMakeRange((self.view_page.tag-1)*10, 10)];
                [self.collection_main reloadData];
            }
            else{
                DDLogVerbose(@"没有上一页");
            }
        }];
        [[_view_page.btn_next rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self)
            if (self.view_page.tag>1) {
                self.view_page.tag += 1;
                if (self.data_model.pageNumber>=_view_page.tag) {
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
- (RechargeMainBottomView *)view_bottom {
    if (!_view_bottom) {
        _view_bottom = [[RechargeMainBottomView alloc] initWithFrame:(CGRect){0,ZTHeight,ZTWidth,50} andViewType:BottomViewTypeCollection];
        
        @weakify(self)
        [_view_bottom setBlockActionClick:^(NSString * _Nonnull title) {
            @strongify(self)
            if ([title isEqualToString:@"取消"]) {
                self.btn_right.selected = NO;
                [self changeViewMode];
            }
            else if ([title isEqualToString:@"移除"]) {
                //如果当前页删除了数据，那后面的数据就要重新获取
                self.data_model.pageNumber = self.view_page.tag;
                self.data_model.result = (NSMutableArray *)[self.data_model.result subarrayWithRange:NSMakeRange(0, (self.view_page.tag-1)*10)];
                self.collection_main.set_choise = [NSMutableSet set];
                [self.collection_main setCollectionModify:NO andAll:NO];
                
                [self requestDelete:self.collection_main.set_choise];
            }
            else{
                [self.collection_main setCollectionModify:self.btn_right.selected andAll:self.view_bottom.btn_left.selected];
            }
        }];
    }
    return _view_bottom;
}
- (void)changeViewMode
{
    //修改collection的状态
    [self.collection_main setCollectionModify:self.btn_right.selected andAll:self.view_bottom.btn_left.selected];
    [self.collection_main reloadData];
    
    if (self.btn_right.selected) {
        [UIView animateWithDuration:0.3 animations:^{
            self.view_bottom.py_bottom = ZTHeight-NaviIPHONEX;
        }];
        self.collection_main.py_height = ZTHeight-NaviIPHONEX-self.view_bottom.py_height;
    }
    else{
        self.collection_main.py_height = ZTHeight-NaviIPHONEX;
        [UIView animateWithDuration:0.3 animations:^{
            self.view_bottom.py_y = ZTHeight;
        }];
    }
}

#pragma mark --- request
- (void)requestRefresh:(BOOL)refresh
{
    NSInteger page = refresh?1:self.data_model.pageNumber+1;    
    if (self.questionHouse) {
        //获取本章节本题型的收藏
        [SQNetworkInterface iRequestChapterScoreDetailListParames:@{@"questionHouse":self.questionHouse,@"type":self.myCollectionType,@"userId":@"33",@"page":@(page),@"rows":@"10"} andResult:^(NSInteger state, NSString * _Nonnull msg,NSString * _Nonnull total, id  _Nonnull resultData) {
            if (state == CODE_SUCCESS) {
                NSMutableArray *array = [ConsolidateMyWrongModel mj_objectArrayWithKeyValuesArray:resultData];
                self.collection_main.array_models = array;
                NSInteger pageCount = ([total integerValue]%10)?([total integerValue]/10+1):([total integerValue]/10);
                self.view_page.lbl_now.text = [NSString stringWithFormat:@"%@/%@",@(page),@(pageCount)];
                self.title = [NSString stringWithFormat:@"我的收藏（%@）",total];
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
    else{
     //获取所有的收藏
        [SQNetworkInterface iRequestConsolidateCollectionParames:@{@"userId":@"33",@"page":@(page),@"rows":@"10"} andResult:^(NSInteger state, NSString * _Nonnull msg,NSString * _Nonnull total, id  _Nonnull resultData) {
            if (state == CODE_SUCCESS) {
                NSMutableArray *array = [ConsolidateMyWrongModel mj_objectArrayWithKeyValuesArray:resultData];
                self.collection_main.array_models = array;
                NSInteger pageCount = ([total integerValue]%10)?([total integerValue]/10+1):([total integerValue]/10);
                self.view_page.lbl_now.text = [NSString stringWithFormat:@"%@/%@",@(page),@(pageCount)];
                self.title = [NSString stringWithFormat:@"我的收藏（%@）",total];
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
    
}
- (void)requestDelete:(NSMutableSet *)deleteSet
{
    if (deleteSet.count) {
        NSMutableString *ids = [NSMutableString string];
        for (ConsolidateMyWrongModel *model in deleteSet) {
           [ids appendFormat:@"%@,",model.questionId];
        }
        [SQNetworkInterface iRequestChapterCollectionDeleteParames:@{@"ids":@"1,",@"userId":@"33"} andResult:^(NSInteger state, NSString * _Nonnull msg,NSString * _Nonnull total, id  _Nonnull resultData) {
            if (state == CODE_SUCCESS) {
                [self requestRefresh:NO];
            }
            [self.collection_main reloadData];
        }];
    }
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
