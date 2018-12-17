//
//  ConsolidateMyWrongMainVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ConsolidateMyWrongMainVC.h"
#import "ConsolidateMyWrongMainCollection.h"
#import "RechargeMainBottomView.h"
#import "ConsolidateBottomPageView.h"

#import "MakeProblemMainVC.h"
#import "MakeProblemMainModel.h"

@interface ConsolidateMyWrongMainVC ()
@property (nonatomic, strong) ConsolidateMyWrongMainCollection *collection_main;
@property (nonatomic, strong) UIButton *btn_right;
@property (nonatomic, strong) RechargeMainBottomView *view_bottom;
@property (nonatomic, strong) ConsolidateBottomPageView *view_page;
@property (nonatomic, strong) DataModel *data_model;
@property (nonatomic, assign) NSInteger pageCount;

@end

@implementation ConsolidateMyWrongMainVC
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
    
    self.title = @"我的错题";
    [self.view addSubview:self.collection_main];
    [self.view addSubview:self.view_page];
    [self.view addSubview:self.view_bottom];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
#pragma --- view creat
- (ConsolidateMyWrongMainCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 1.0;
        layout.minimumInteritemSpacing = 4.0;
        
        _collection_main = [[ConsolidateMyWrongMainCollection alloc] initWithFrame:(CGRect){0, 0, ZTWidth, ZTHeight-NaviIPHONEX-self.view_page.py_height} collectionViewLayout:layout];
        _collection_main.backgroundColor = HexRGB(0xF1F0F0);
        @weakify(self)
        [_collection_main setBlockAllChoise:^(BOOL all) {
            @strongify(self)
            self.view_bottom.btn_left.selected = all;
        }];
        [_collection_main setBlockGoOn:^(NSIndexPath * _Nonnull indexPath) {
            @strongify(self)
            //选择其中其中一道题，然后跳转到错题解析
            if (self.questionHouse) {
                //本章错题就不跳了
            }
            else{
                //我的错题就要跳
                MakeProblemMainVC *vc = [MakeProblemMainVC new];
                vc.lastNum = [NSString stringWithFormat:@"%ld",indexPath.section+1+(self.view_page.tag-1)*10];
                [vc setMakeProblemVC:MakeProblemMainVCMyWrong];
                [self.navigationController pushViewController:vc animated:YES];
            }
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
        [SQNetworkInterface iRequestChapterScoreDetailListParames:@{@"questionHouse":self.questionHouse,@"type":self.myWrongType,@"userId":@"33",@"page":@(page),@"rows":@"10"} andResult:^(NSInteger state, NSString * _Nonnull msg,NSString * _Nonnull total, id  _Nonnull resultData) {
            if (state == CODE_SUCCESS) {
                NSMutableArray *array = [MakeProblemMainModel mj_objectArrayWithKeyValuesArray:resultData];
                self.collection_main.array_models = array;
                
                self.pageCount = ([total integerValue]%10)?([total integerValue]/10+1):([total integerValue]/10);
                self.view_page.lbl_now.text = [NSString stringWithFormat:@"%@/%@",@(page),@(self.pageCount)];
                self.title = [NSString stringWithFormat:@"我的错题（%@）",total];
                
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
        //获取所有错题解析
        [SQNetworkInterface iRequestConsolidateMyWrongParames:@{@"userId":@"33",@"page":@(page),@"rows":@"10"} andResult:^(NSInteger state, NSString * _Nonnull msg,NSString * _Nonnull total, id  _Nonnull resultData) {
            if (state == CODE_SUCCESS) {
                NSMutableArray *array = [MakeProblemMainModel mj_objectArrayWithKeyValuesArray:resultData];
                self.collection_main.array_models = array;
                
                self.pageCount = ([total integerValue]%10)?([total integerValue]/10+1):([total integerValue]/10);
                self.view_page.lbl_now.text = [NSString stringWithFormat:@"%@/%@",@(page),@(self.pageCount)];
                self.title = [NSString stringWithFormat:@"我的错题（%@）",total];
                
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

}
@end
