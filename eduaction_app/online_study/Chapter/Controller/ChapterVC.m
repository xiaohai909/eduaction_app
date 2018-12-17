//
//  ChapterVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/5.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ChapterVC.h"
#import "ChapterMainCollection.h"

#import "ChapterListVC.h"
#import "ChapterCleanVC.h"

#import "ChapterListModel.h"

@interface ChapterVC ()
@property (nonatomic, strong) ChapterMainCollection *collection_main;
@end

@implementation ChapterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setnavbg_defa];
    self.title = @"章节列表";
    
    [self.view addSubview:self.collection_main];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.collection_main.mj_header beginRefreshing];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma --- view creat
- (ChapterMainCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 1.0;
        layout.minimumInteritemSpacing = 4.0;

        _collection_main = [[ChapterMainCollection alloc] initWithFrame:(CGRect){0, 0, ZTWidth, ZTHeight-NaviIPHONEX} collectionViewLayout:layout];
        _collection_main.backgroundColor = HexRGB(0xF1F0F0);
        
        @weakify(self)
        [_collection_main setBlockGoOn:^(NSIndexPath * _Nonnull indexPath) {
            @strongify(self)
            if (indexPath.section == 1) {
                //跳转到对应的章节
                ChapterListVC *vc = [ChapterListVC new];
                vc.model = self.collection_main.model_array[indexPath.row];
                [self.navigationController pushViewController:vc animated:YES];
            }
            else{
             //清空
                ChapterCleanVC *vc = [ChapterCleanVC new];
                [vc setBlockClean:^{
                    [self request];
                }];
                [self.navigationController pushViewController:vc animated:YES];
            }            
        }];        
        
        //数据
        [_collection_main setupHeaderRefresh:^{
            [self request];
        }];
//        [_collection_main.mj_header beginRefreshing];
    }
    return _collection_main;
}

#pragma mark --- request
- (void)request
{
    [SQNetworkInterface iRequestChapterMainParames:@{@"parentId":@"1",@"userId":@"33"} andResult:^(NSInteger state, NSString * _Nonnull msg,NSString * _Nonnull total, id  _Nonnull resultData) {
        if (state == CODE_SUCCESS) {
            self.collection_main.qsAnswerCount = [NSString stringWithFormat:@"%@",resultData[@"qsAnswerCount"]];
            self.collection_main.qsAverage = [NSString stringWithFormat:@"%@",resultData[@"qsAverage"]];
            self.collection_main.qsCorrectCount = [NSString stringWithFormat:@"%@",resultData[@"qsCorrectCount"]];
            self.collection_main.qsTotal = [NSString stringWithFormat:@"%@",resultData[@"qsTotal"]];
            self.collection_main.model_array = [ChapterListModel mj_objectArrayWithKeyValuesArray:resultData[@"ListData"]];
        }
        [self.collection_main reloadData];
        [self.collection_main stopHeaderRefresh];
    }];
}
@end
