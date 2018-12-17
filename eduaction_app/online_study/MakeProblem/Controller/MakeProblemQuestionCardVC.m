//
//  MakeProblemQuestionCardVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/8.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MakeProblemQuestionCardVC.h"
#import "MakeProblemQuestionCardCVCell.h"


#import "MakeProblemMainModel.h"
#import "ChapterScoreModel.h"

@interface MakeProblemQuestionCardVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collection_main;
@property (nonatomic, strong) ChapterScoreModel *model;
@end

@implementation MakeProblemQuestionCardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setnavbg_defa];
    self.title = @"题卡";
    
    [self.view addSubview:self.collection_main];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self.collection_main.mj_header beginRefreshing];
}
#pragma mark --- view
- (UICollectionView *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 1.0;
        layout.minimumInteritemSpacing = 0.0;
        
        _collection_main = [[UICollectionView alloc] initWithFrame:(CGRect){0,0, ZTWidth, ZTHeight-NaviIPHONEX} collectionViewLayout:layout];
        _collection_main.backgroundColor = HexRGB(0xF1F0F0);
        
        
        [_collection_main registerNib:[UINib nibWithNibName:NSStringFromClass([MakeProblemQuestionCardCVCell class]) bundle:nil] forCellWithReuseIdentifier:@"MakeProblemQuestionCardCVCell"];        
        
        _collection_main.delegate = self;
        _collection_main.dataSource = self;
        
        //数据
        [_collection_main setupHeaderRefresh:^{
            [self request];
        }];        
    }
    return _collection_main;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.model.questionCard.count;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 20, 0, 20);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.collection_main.py_width-4*10-2*20)/5-1, 50);
    
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MakeProblemQuestionCardCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MakeProblemQuestionCardCVCell" forIndexPath:indexPath];
    [cell setBtnTiltle:[NSString stringWithFormat:@"%ld",(long)indexPath.row+1] andMode:[self getCarModeWithIndexPath:indexPath]];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.blockGoOn) {
        self.blockGoOn(indexPath);
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (QuestionCardMode)getCarModeWithIndexPath:(NSIndexPath *)indexPath
{
    MakeProblemCardModel *model = self.model.questionCard[indexPath.row];
    if (model.answerId.length) {
        if ([model.correct isEqualToString:@"1"]) {
            return self.now_row==[model.rownum integerValue]?QuestionCardModeNowRight:QuestionCardModeRight;
        }
        else if ([model.correct isEqualToString:@"0"]){
            return self.now_row==[model.rownum integerValue]?QuestionCardModeNowWrong:QuestionCardModeWrong;
        }
        else{
            return self.now_row==[model.rownum integerValue]?QuestionCardModeNowNormal:QuestionCardModeNormal;
        }
    }
    else{
        return indexPath.row == self.now_row?QuestionCardModeNowNormal:QuestionCardModeNormal;
    }
}
#pragma mark --
- (void)request
{
    [SQNetworkInterface iRequestChapterScoreParames:@{@"questionHouse":self.questionHouse,@"userId":@"33"} andResult:^(NSInteger state, NSString * _Nonnull msg,NSString * _Nonnull total, id  _Nonnull resultData) {
        if (state == CODE_SUCCESS) {
            self.model = [ChapterScoreModel mj_objectWithKeyValues:resultData];;
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
