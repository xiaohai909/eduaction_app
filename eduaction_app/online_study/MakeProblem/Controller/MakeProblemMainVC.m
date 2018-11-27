//
//  MakeProblemMainVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MakeProblemMainVC.h"
#import "MakeProblemSceneCollection.h"
#import "MakeProblemToolView.h"

#import "MakeProblemPopView.h"
#import "ChapterScoreVC.h"
#import "MakeProblemQuestionCardVC.h"

#import "MakeProblemMainModel.h"

@interface MakeProblemMainVC ()
@property (nonatomic, strong) MakeProblemSceneCollection *collection_main;
@property (nonatomic, strong) MakeProblemToolView *view_bottom;//底部工具栏
@property (nonatomic, strong) MakeProblemToolView *view_change;//只在错题练习的时候，可以切换模式
@property (nonatomic, strong) MakeProblemToolView *view_more;//只在随机练习的时候，可以有更多操作

@property (nonatomic, assign) MakeProblemMainMode viewMode;//做题的类型

@property (nonatomic, strong) NSMutableArray *array_models;


@end

/*
 这里有一个比较大的问题，题目更改的时候，底下的工具栏是要针对题目而变得
 */

@implementation MakeProblemMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"随机练习";
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self createNavigationLeftItem:YES andImage:@"top_btn_return" andTitle:@"   "];
    UIButton *btn = [self createNavigationLeftItem:NO andImage:@"" andTitle:@"题卡"];
    
    @weakify(self);
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        MakeProblemQuestionCardVC *vc = [MakeProblemQuestionCardVC new];
        vc.array_models = self.array_models;
        vc.now_row = [self.collection_main.currentPage integerValue];
        
        [vc setBlockGoOn:^(NSIndexPath * _Nonnull indexPath) {
            self.collection_main.currentPage = @(indexPath.row);
            [self.collection_main selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionLeft];
        }];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    [self.navigationController.navigationBar setBackgroundImage:[CommonFunciton BgImageFromColors:@[HexRGB(0xFF5F5E),HexRGB(0xFC7456),HexRGB(0xFC7855)] withFrame:CGRectMake(0, 0, ZTWidth, NaviIPHONEX) gradientDir:leftToright] forBarMetrics:UIBarMetricsDefault];
}

#pragma mark --- 从外部带回来的参数
- (void)setMode:(MakeProblemMainMode)mode {
    self.viewMode = mode;
    
    //设置完参数，界面才要加载
    [self setVCTitle];
    [self.view addSubview:self.collection_main];
    [self.view addSubview:self.view_bottom];
    
    //设置数据
    self.array_models = [NSMutableArray arrayWithObjects:[MakeProblemMainModel new],[MakeProblemMainModel new],[MakeProblemMainModel new],[MakeProblemMainModel new],[MakeProblemMainModel new],[MakeProblemMainModel new],[MakeProblemMainModel new],[MakeProblemMainModel new],[MakeProblemMainModel new],[MakeProblemMainModel new],[MakeProblemMainModel new],[MakeProblemMainModel new], nil];
    self.collection_main.array_models = self.array_models;
    [self.collection_main reloadData];
}
- (void)setVCTitle {
    if (self.viewMode == MakeProblemMainModeSimulateExam) {
        self.title = @"模拟考试";
    }
    else if (self.viewMode == MakeProblemMainModeErrorPractice) {
        self.title = @"错题练习";
    }
    else {
        self.title = @"随机练习";
    }
}
- (MakeProblemMode)getSceneCollectionMode{//获得题目的类型
    if (self.viewMode == MakeProblemMainModeSimulateExam) {
        return MakeProblemModeExam;
    }//非考试模式下，默认为答题模式，切换得根据工具栏选择来切换
    else {
        return MakeProblemModeAnswer;
    }
}
- (MakeProblemToolType)getBottomToolMode{//获得底下工具栏的类型
    if (self.viewMode == MakeProblemMainModeSimulateExam) {
        return MakeProblemToolTypeSimulateExam;
    }
    else if (self.viewMode == MakeProblemMainModeErrorPractice) {
        return MakeProblemToolTypeErrorPractice;
    }
    else {
        return MakeProblemToolTypeRandomPractice;
    }
}
#pragma --- view creat
- (MakeProblemSceneCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0.5;
        layout.minimumInteritemSpacing = 0.5;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collection_main = [[MakeProblemSceneCollection alloc] initWithFrame:(CGRect){0, 0, ZTWidth,ZTHeight-NaviIPHONEX-self.view_bottom.py_height} collectionViewLayout:layout andType:[self getSceneCollectionMode]];
        //错题练习随机练习都是答题模式，是不是背题就得看浏览模式还是答题模式
        _collection_main.showsHorizontalScrollIndicator = NO;
        _collection_main.pagingEnabled = YES;
        _collection_main.backgroundColor = [UIColor whiteColor];
        
        //题目更改的时候
        [RACObserve(_collection_main, currentPage) subscribeNext:^(NSNumber *newPage) {
            [self viewBottomChange:newPage];
        }];
        
    }
    return _collection_main;
}
- (MakeProblemToolView *)view_bottom {
    if (!_view_bottom) {
        _view_bottom = [[MakeProblemToolView alloc] initWithFrame:(CGRect){0,ZTHeight-NaviIPHONEX-45,ZTWidth,45}];
        [_view_bottom creatToolViewWithType:[self getBottomToolMode]];//这个根据
        
        @weakify(self)
        [_view_bottom setBlockGoOn:^(UIButton * _Nonnull btn) {
           //这里判断每个类型的对应的操作
            @strongify(self)
            [self viewBottomAction:btn];
        }];
    }
    return _view_bottom;
}
//只在错题练习的时候会加载
- (MakeProblemToolView *)view_change
{
    if (!_view_change) {
        _view_change = [[MakeProblemToolView alloc] initWithFrame:(CGRect){ZTWidth/2,ZTHeight-NaviIPHONEX-41-41*2-30,ZTWidth/4,41*2}];
        [_view_change creatToolViewWithType:MakeProblemToolTypeChangeMode];
        
        @weakify(self)
        @weakify(_view_change)
        [_view_change setBlockGoOn:^(UIButton * _Nonnull btn) {
            //这里判断每个类型的对应的操作
            @strongify(self)
            @strongify(_view_change)
            if ([btn.titleLabel.text isEqualToString:@"浏览模式"]) {
                self.collection_main.viewMode = MakeProblemModeMemory;//背诵
            }
            else{//答题模式
                self.collection_main.viewMode = MakeProblemModeAnswer;//答题模式
            }
            _view_change.hidden = YES;
        }];        
        //
        _view_change.hidden = YES;
        [self.view addSubview:_view_change];
    }
    [self.view bringSubviewToFront:_view_change];
    return _view_change;
}
//只在随机练习的时候有机会加载
- (MakeProblemToolView *)view_more
{
    if (!_view_more) {
        _view_more = [[MakeProblemToolView alloc] initWithFrame:(CGRect){ZTWidth/4*3,ZTHeight-NaviIPHONEX-41-41*4-30,ZTWidth/4,41*4}];
        [_view_more creatToolViewWithType:MakeProblemToolTypeMoreMode];
        
        @weakify(self)
        @weakify(_view_more)
        [_view_more setBlockGoOn:^(UIButton * _Nonnull btn) {
            //这里判断每个类型的对应的操作
            @strongify(self)
            @strongify(_view_more)
            if ([btn.titleLabel.text isEqualToString:@"考试模式"]) {
                self.collection_main.viewMode = MakeProblemModeExam;//考试
            }
            else if ([btn.titleLabel.text isEqualToString:@"背题模式"]) {
                self.collection_main.viewMode = MakeProblemModeMemory;//背诵
            }
            else{//答题模式
                self.collection_main.viewMode = MakeProblemModeAnswer;//答题模式
            }
            _view_more.hidden = YES;
        }];
        _view_more.hidden = YES;
        [self.view addSubview:_view_more];
    }
    [self.view bringSubviewToFront:_view_more];
    return _view_more;
}
#pragma mark --- 针对不同的题目设置底下的工具栏
- (void)viewBottomChange:(NSNumber *)currentPage
{
    //设置bottomView的状态,就收藏和笔记
    
}
- (void)viewBottomAction:(UIButton *)btn {
    //self.collection_main.currentPage,获取对应的题目的信息，并做对应的操作
    btn.selected = !btn.selected;//这个要看本道题的状态了
    if ([btn.titleLabel.text isEqualToString:@"收藏"]) {
#warning 收藏还没做
    }
    else if ([btn.titleLabel.text isEqualToString:@"笔记"]) {
        [self showViewInWindowWithView:[MakeProblemPopView creatNotePopView]];
    }
    else if ([btn.titleLabel.text isEqualToString:@"切换"]) {
        self.view_change.hidden = !self.view_change.hidden;
    }
    else if ([btn.titleLabel.text isEqualToString:@"更多"]) {
        self.view_more.hidden = !self.view_more.hidden;
    }
    else if ([btn.titleLabel.text isEqualToString:@"设置"]) {
        MakeProblemPopView *view =[MakeProblemPopView creatSetPopView];
        [view setBlockChange:^{
            NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:MakeProblemSetMessage];
            self.collection_main.isAutoReturn = [[dic objectForKey:MakeProblemSetMessageGO] boolValue];
            self.collection_main.addTextFont = [[dic objectForKey:MakeProblemSetMessageTextFont] integerValue];
            [self.collection_main reloadData];
        }];
        [self showViewInWindowWithView:view];
    }
    else if ([btn.titleLabel.text isEqualToString:@"批阅"]) {
    /*
     1.如果当前已回答完所有题目，直接跳转到我的成绩；
     2.如果未回答完所有题目，则计算已答问题的正确率
     */
        BOOL isAll = NO;
        NSString *rightPercent = [self countModels:0 isAll:isAll];
        if (isAll) {
            [self.navigationController pushViewController:[ChapterScoreVC new] animated:YES];
        }
        else{
            NSString *message = [NSString stringWithFormat:@"本次练习正确率%@",rightPercent];
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alert addAction:cancel];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
    else if ([btn.titleLabel.text isEqualToString:@"交卷"]) {
        //提示是否交卷
        NSString *message = [NSString stringWithFormat:@"还剩%@道题未答，确定交卷吗",[self countModels:1 isAll:NO]];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //交卷
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:confirm];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
    }
}
//计算做题
- (NSString *)countModels:(NSInteger)type isAll:(BOOL)all
{
    NSMutableArray *wrong = [NSMutableArray array];
    NSMutableArray *right = [NSMutableArray array];
    NSMutableArray *normal = [NSMutableArray array];
    for (MakeProblemMainModel *model in self.array_models) {
        if (model.isSelelct) {
            if (model.selectTrue) {
                [right addObject:model];
            }
            else{
                [wrong addObject:model];
            }
        }
        else{
            [normal addObject:model];
        }
    }
    if (normal.count == 0) {
        all = YES;
    }
    if (type == 0) {//批阅
        if (wrong.count+right.count == 0) {
            return @"0";
        }
        return [NSString stringWithFormat:@"%.2f%@",((float)right.count/(float)(wrong.count+right.count))*100,@"%"];//正确率
    }
    else if(type == 1){//交卷
        return [NSString stringWithFormat:@"%lu",(unsigned long)normal.count];//未做题
    }
    else{
        return @"";
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
