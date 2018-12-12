//
//  ChapterListVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ChapterListVC.h"
#import "ChapterListCollection.h"

#import "ChapterScoreVC.h"
#import "MakeProblemMainVC.h"

@interface ChapterListVC ()
@property (nonatomic, strong) ChapterListCollection *collection_main;
@end

@implementation ChapterListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setnavbg_defa];
    self.title = self.model.name;
//    self.data_model = [DataModel new];
    
    [self.view addSubview:self.collection_main];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.collection_main.mj_header beginRefreshing];
}
#pragma --- view creat
- (ChapterListCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 1.0;
        layout.minimumInteritemSpacing = 4.0;
        
        _collection_main = [[ChapterListCollection alloc] initWithFrame:(CGRect){0, 0, ZTWidth, ZTHeight-NaviIPHONEX} collectionViewLayout:layout];
        _collection_main.backgroundColor = HexRGB(0xF1F0F0);
        
        @weakify(self)
        [_collection_main setBlockGoOn:^(NSIndexPath * _Nonnull indexPath) {
            @strongify(self)
            //继续做题
            ChapterListModel *model = self.collection_main.data_model.result[indexPath.row];
            MakeProblemMainVC *vc = [MakeProblemMainVC new];
            vc.questionHouse = model.secClassID;
            vc.lastNum = model.lastNum;
            [vc setMode:MakeProblemMainModeErrorPractice andShowMode:MakeProblemModeAnswer];
            [self.navigationController pushViewController:vc animated:YES];
            
            
//            ChapterListModel *model = self.collection_main.data_model.result[indexPath.row];
//            ChapterScoreVC *vc = [ChapterScoreVC new];
//            vc.questionHouse = model.secClassID;
//            [self.navigationController pushViewController:vc animated:YES];
            
        }];
        [_collection_main setBlockScore:^(NSIndexPath * _Nonnull indexPath) {
            @strongify(self)
            //跳转到对应的章节成绩vc
            ChapterListModel *model = self.collection_main.data_model.result[indexPath.row];
            ChapterScoreVC *vc = [ChapterScoreVC new];
            vc.questionHouse = model.secClassID;
            [self.navigationController pushViewController:vc animated:YES];

        }];
        
        //数据
        [_collection_main setupHeaderRefresh:^{
            [self requestRefresh:YES];
        }];
        [_collection_main setupFooterRefresh:^{
            [self requestRefresh:NO];
        }];
    }
    return _collection_main;
}

#pragma mark --- request
- (void)requestRefresh:(BOOL)refresh
{
    NSInteger page = refresh?1:self.collection_main.data_model.pageNumber+1;
    [SQNetworkInterface iRequestChapterListParames:@{@"classId":self.model.classID,@"userId":@"33",@"page":@(page),@"rows":@"10"} andResult:^(NSInteger state, NSString * _Nonnull msg,NSString * _Nonnull total, id  _Nonnull resultData) {
        if (state == CODE_SUCCESS) {
            NSArray *array = [ChapterListModel mj_objectArrayWithKeyValuesArray:resultData];
            if (refresh) {
                self.collection_main.data_model = [DataModel new];
                self.collection_main.data_model.result = [NSMutableArray arrayWithArray:array];
            }
            else{
                self.collection_main.data_model.pageNumber = page;
                [self.collection_main.data_model.result addObjectsFromArray:array];
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
