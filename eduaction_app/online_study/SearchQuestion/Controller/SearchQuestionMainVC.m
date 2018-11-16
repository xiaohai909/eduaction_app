//
//  SearchQuestionMainVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/15.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "SearchQuestionMainVC.h"
#import "SQSearchView.h"
#import "SearchQuestionMainView.h"

@interface SearchQuestionMainVC ()
@property (nonatomic, strong) SQSearchView *searchView;
@property (nonatomic, strong) SQSearchBar *searchBar;
@property (nonatomic, strong) SearchQuestionMainView *collection_main;
@end

@implementation SearchQuestionMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.collection_main];
    self.collection_main.array_models = [@[@"",@"",@"",@"",@"",@"",@"",@""] mutableCopy];
    [self.collection_main reloadData];
    
    //搜索的界面
    [self showViewInWindowWithView:self.searchView];

}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.navigationItem.rightBarButtonItem =nil;
    self.tabBarController.navigationItem.titleView = nil;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark ---
- (SQSearchBar *)searchBar
{
    if (!_searchBar) {
       _searchBar = [SQSearchBar creatSearchBar];
        _searchBar.rightBtn.hidden = YES;
        _searchBar.textField.hidden = YES;
        [_searchBar.searchBtn setImage:nil forState:UIControlStateNormal];
        _searchBar.searchBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_searchBar.searchBtn setTitleColor:HexRGB(0x333333) forState:UIControlStateNormal];
        //返回
        [[_searchBar.leftBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [self.navigationController popViewControllerAnimated:YES];
        }];//点击搜索，弹出搜索框
        [[_searchBar.searchBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [self showViewInWindowWithView:self.searchView];
        }];
    }
    return _searchBar;
}
- (SQSearchView *)searchView
{
    if (!_searchView) {
        _searchView = [SQSearchView creatSearchViewHot:@[@"2017真题",@"2018真题",@"2019真题",@"2020真题"] andHistory:@[@"2017真题",@"2018真题",@"2019真题",@"2020真题"]];
        _searchView.bar.textField.text = nil;
        //返回
        [[_searchView.bar.leftBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        //搜索
        @weakify(self)
        [_searchView setBlockGoOn:^(NSString * _Nonnull keyValue) {
            @strongify(self)
            //将shurukuang 
            NSLog(@"%@",keyValue);
            [self.searchBar.searchBtn setTitle:@"关键字" forState:UIControlStateNormal];
            //去搜索
        }];
        [_searchView.collection_main setBlockClean:^{
            //清除
        }];
        [_searchView.collection_main setBlockChange:^{
            //换一批
        }];
        
    }
    return _searchView;    
}

- (SearchQuestionMainView *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 1.0;
        layout.minimumInteritemSpacing = 4.0;
        
        _collection_main = [[SearchQuestionMainView alloc] initWithFrame:(CGRect){0, NaviIPHONEX, ZTWidth, ZTHeight-NaviIPHONEX} collectionViewLayout:layout];
        _collection_main.backgroundColor = HexRGB(0xF1F0F0);
        
        [_collection_main setBlockGoOn:^(NSIndexPath * _Nonnull indexPath) {
            
        }];
    }
    return _collection_main;
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
