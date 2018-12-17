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


//每一页获取的题目个数
static NSInteger const pageCount = 30;
typedef NS_ENUM(NSUInteger, MakeProblemMainMode) {
    MakeProblemMainModeSimulateExam,//模拟考试
    
    MakeProblemMainModeErrorPractice,//错题练习
    MakeProblemMainModeRandomPractice,//随机练习
};

@interface MakeProblemMainVC ()
@property (nonatomic, strong) MakeProblemSceneCollection *collection_main;
@property (nonatomic, strong) UIButton *btn_add;//添加评论
@property (nonatomic, strong) MakeProblemToolView *view_bottom;//底部工具栏
@property (nonatomic, strong) MakeProblemToolView *view_change;//只在错题练习的时候，可以切换模式
@property (nonatomic, strong) MakeProblemToolView *view_more;//只在随机练习的时候，可以有更多操作

@property (nonatomic, assign) MakeProblemMainMode viewMode;//做题的类型
@property (nonatomic, assign) MakeProblemMainVCMode vcModel;//做题界面

@property (nonatomic, strong) DataModel *data_model;
//@property (nonatomic, assign) NSInteger total;//总的数据

@end

/*
 这里有一个比较大的问题，题目更改的时候，底下的工具栏是要针对题目而变得
 */

@implementation MakeProblemMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[IQKeyboardManager sharedManager] setEnable:NO];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self createNavigationLeftItem:YES andImage:@"top_btn_return" andTitle:@"   "];
    [self.navigationController.navigationBar setBackgroundImage:[CommonFunciton BgImageFromColors:@[HexRGB(0xFF5F5E),HexRGB(0xFC7456),HexRGB(0xFC7855)] withFrame:CGRectMake(0, 0, ZTWidth, NaviIPHONEX) gradientDir:leftToright] forBarMetrics:UIBarMetricsDefault];
}

#pragma mark --- 从外部带回来的参数，做题方式
//不同的入口
- (void)setMakeProblemVC:(MakeProblemMainVCMode)vcMode
{
    self.vcModel = vcMode;
    if (vcMode == MakeProblemMainVCChapterWrong) {
        self.title = @"错题解析";
        [self setMode:MakeProblemMainModeErrorPractice andShowMode:MakeProblemModeMemory];        
//        [self requestMyWrongPage:1];
    }
    else if (vcMode == MakeProblemMainVCChapterPractice) {
        self.title = @"章节练习";
        [self setMode:MakeProblemMainModeErrorPractice andShowMode:MakeProblemModeAnswer];
        [self setNavRight];//提卡
    }
    else if(vcMode == MakeProblemMainVCMyWrong){
        self.title = @"错题练习";
        [self setMode:MakeProblemMainModeErrorPractice andShowMode:MakeProblemModeAnswer];
//        [self requestAllMyWrongPage:1];
    }
    else if(vcMode == MakeProblemMainVCSimulateExame){
        self.title = @"模拟考试";
        [self setMode:MakeProblemMainModeSimulateExam andShowMode:MakeProblemModeExam];
    }
    else if (vcMode == MakeProblemMainVCRandomPractice){
        self.title = @"随机练习";
        [self setMode:MakeProblemMainModeRandomPractice andShowMode:MakeProblemModeAnswer];
    }
    else if(vcMode == MakeProblemMainVCMyNote ){
        self.title = @"我的笔记";
        [self setMode:MakeProblemMainModeRandomPractice andShowMode:MakeProblemModeAnswer];
    }
    NSInteger page = self.lastNum.length?(([self.lastNum integerValue]-1)/pageCount+1):1;
    [self gotoRequestPage:page];
}
//数据加载
- (void)gotoRequestPage:(NSInteger)page
{
    if (self.vcModel == MakeProblemMainVCChapterWrong) {
        [self requestMyWrongPage:page];
    }
    else if (self.vcModel == MakeProblemMainVCChapterPractice) {
        [self requestChapterPage:page];
    }
    else if(self.vcModel == MakeProblemMainVCMyWrong){
        [self requestAllMyWrongPage:page];
    }
    else if(self.vcModel == MakeProblemMainVCSimulateExame){
    }
    else if (self.vcModel == MakeProblemMainVCRandomPractice){
    }
    else if (self.vcModel == MakeProblemMainVCMyNote){
        
    }
}
- (void)setMode:(MakeProblemMainMode)mode andShowMode:(MakeProblemMode)showMode{
    //设置完参数，界面才要加载
    self.viewMode = mode;
    [self.view addSubview:self.view_bottom];
    //位置很重要
    [self.view addSubview:self.collection_main];
    self.collection_main.viewMode = showMode;//考试
    [self.view addSubview:self.btn_add];
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
- (void)setNavRight
{
    UIButton *btn = [self createNavigationLeftItem:NO andImage:@"" andTitle:@"题卡"];
    
    @weakify(self);
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        //跳转到指定的题
        MakeProblemQuestionCardVC *vc = [MakeProblemQuestionCardVC new];
        vc.questionHouse = self.questionHouse;
        vc.now_row = [self.collection_main.currentPage integerValue];
        [vc setBlockGoOn:^(NSIndexPath * _Nonnull indexPath) {
            self.collection_main.currentPage = @(indexPath.row);
            MakeProblemAnserModel *model = self.collection_main.array_models[indexPath.row];
            [self.collection_main selectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.row] animated:YES scrollPosition:UICollectionViewScrollPositionLeft];
            //要不要提前加载
            if (model.ID.length == 0) {
                NSInteger page = indexPath.row/pageCount+1;//page从1开始
                [self gotoRequestPage:page];
            }
        }];
        [self.navigationController pushViewController:vc animated:YES];
    }];
}
#pragma mark --- view creat
- (MakeProblemSceneCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0.1;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collection_main = [[MakeProblemSceneCollection alloc] initWithFrame:(CGRect){0, 0, ZTWidth,ZTHeight-NaviIPHONEX-self.view_bottom.py_height} collectionViewLayout:layout andType:[self getSceneCollectionMode]];
        //错题练习随机练习都是答题模式，是不是背题就得看浏览模式还是答题模式
        _collection_main.showsHorizontalScrollIndicator = NO;
        _collection_main.scrollEnabled = NO;
        _collection_main.backgroundColor = [UIColor whiteColor];
        
        //题目更改的时候
        [RACObserve(_collection_main, currentPage) subscribeNext:^(NSNumber *newPage) {
            [self viewBottomChange:newPage];
        }];
        //做题的时候
        @weakify(self)
        [_collection_main setBlockMakeProblem:^(NSString * _Nonnull correct) {
            @strongify(self)
            MakeProblemMainModel *model = self.collection_main.array_models[[self.collection_main.currentPage integerValue]];
            model.questionAnswer.correct = correct;
            model.questionAnswer.answer = model.selelct;
            model.questionAnswer.answerTime = [SQNetworkInterface nowTime];
            [self requestAnswer:[model.questionAnswer mj_keyValues] andType:4];
        }];
        //要展示的题目y还没加载，就去加载
        [_collection_main setBlockRequestPage:^(NSInteger row) {
            @strongify(self)
            [self gotoRequestPage:row/pageCount+1];
        }];
        //什么时候获取到全部数据呢，这个是问题
    }
    return _collection_main;
}
- (UIButton *)btn_add
{
    if (!_btn_add) {
        _btn_add = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn_add.frame = (CGRect){ZTWidth-60,ZTHeight-NaviIPHONEX-45-50-80,50,50};
        [_btn_add setImage:[UIImage imageNamed:@"wrong question_ico_add"] forState:UIControlStateNormal];
        
        [[_btn_add rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            MakeProblemPopView *noteView = [MakeProblemPopView creatNotePopView];
            noteView.lbl_title.text = @"添加评论";
            noteView.view_text.placeholder = @"点击这里，添加评论";
            [[noteView.btn_send rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
                //笔记
                if (noteView.view_text.text.length) {
                    MakeProblemMainModel *model = self.collection_main.array_models[[self.collection_main.currentPage integerValue]];
                    model.questionAnswer.discuss = noteView.view_text.text;
                    model.questionAnswer.discussTime = [SQNetworkInterface nowTime];
                    [self requestAnswer:[model.questionAnswer mj_keyValues] andType:3];
                    noteView.view_text.text = nil;
                }                
                [self.view hideViewInView:noteView];
            }];
            [self.view showViewInViewWithView:noteView];
        }];
    }
    return _btn_add;
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
            [self.collection_main reloadData];
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
    if (self.view_bottom.toolType == MakeProblemToolTypeErrorPractice) {
        //@[@"收藏",@"笔记",@"切换",@"设置"];
        MakeProblemMainModel *model = self.collection_main.array_models[[currentPage integerValue]];
        UIButton *btn_correct = self.view_bottom.btn_array[0];
        btn_correct.selected = [model.questionAnswer.collection isEqualToString:@"1"];
        
        UIButton *btn_note = self.view_bottom.btn_array[1];
        btn_note.selected = model.questionAnswer.notes.length;
    }
    else if (self.view_bottom.toolType == MakeProblemToolTypeRandomPractice) {
        //@[@"收藏",@"笔记",@"批阅",@"设置"];
        MakeProblemMainModel *model = self.collection_main.array_models[[currentPage integerValue]];
        UIButton *btn_correct = self.view_bottom.btn_array[0];
        btn_correct.selected = [model.questionAnswer.collection isEqualToString:@"1"];
        
        UIButton *btn_note = self.view_bottom.btn_array[1];
        btn_note.selected = model.questionAnswer.notes.length;
    }
}
- (void)viewBottomAction:(UIButton *)btn {
    //self.collection_main.currentPage,获取对应的题目的信息，并做对应的操作
    btn.selected = !btn.selected;//这个要看本道题的状态了
    if ([btn.titleLabel.text isEqualToString:@"收藏"]) {
        MakeProblemMainModel *model = self.collection_main.array_models[[self.collection_main.currentPage integerValue]];
        model.questionAnswer.collection = btn.isSelected?@"1":@"0";
        [self requestAnswer:[model.questionAnswer mj_keyValues] andType:1];
    }
    else if ([btn.titleLabel.text isEqualToString:@"笔记"]) {
        MakeProblemPopView *noteView = [MakeProblemPopView creatNotePopView];
        noteView.lbl_title.text = @"添加笔记";
        noteView.view_text.placeholder = @"点击这里，添加笔记";
        [[noteView.btn_send rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            //笔记
            MakeProblemMainModel *model = self.collection_main.array_models[[self.collection_main.currentPage integerValue]];
            model.questionAnswer.notes = noteView.view_text.text;
            [self requestAnswer:[model.questionAnswer mj_keyValues] andType:2];
            noteView.view_text.text = nil;
            [self.view hideViewInView:noteView];
        }];
        [self.view showViewInViewWithView:noteView];
    }
    else if ([btn.titleLabel.text isEqualToString:@"切换"]) {
        self.view_change.hidden = !self.view_change.hidden;
    }
    else if ([btn.titleLabel.text isEqualToString:@"更多"]) {
        self.view_more.hidden = !self.view_more.hidden;
    }
    else if ([btn.titleLabel.text isEqualToString:@"设置"]) {
        btn.selected = NO;
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
//计算做题结果数据
- (NSString *)countModels:(NSInteger)type isAll:(BOOL)all
{
    NSMutableArray *wrong = [NSMutableArray array];
    NSMutableArray *right = [NSMutableArray array];
    NSMutableArray *normal = [NSMutableArray array];
    for (MakeProblemMainModel *model in self.collection_main.array_models) {
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


#pragma mark --- request
//本章错题
- (void)requestChapterPage:(NSInteger)page
{
    NSDictionary *parames;
    parames = @{@"questionHouse":self.questionHouse,@"userId":@"33",@"page":@(page),@"rows":@(pageCount)};
    [SQNetworkInterface iRequestMakeProblemParames:parames andResult:^(NSInteger state, NSString * _Nonnull msg,NSString * _Nonnull total, id  _Nonnull resultData) {
        if (state == CODE_SUCCESS) {
            self.collection_main.total = [total integerValue];
            NSMutableArray *array = [MakeProblemMainModel mj_objectArrayWithKeyValuesArray:resultData];
            [self dataSetArray:array andPage:page];
        }
    }];
}
//本章错题解析
- (void)requestMyWrongPage:(NSInteger)page
{
    if (!self.myWrongType) {
        return;
    }
    //获取本章节本题型的收藏
    [SQNetworkInterface iRequestChapterScoreDetailListParames:@{@"questionHouse":self.questionHouse,@"type":self.myWrongType,@"userId":@"33",@"page":@(page),@"rows":@(pageCount)} andResult:^(NSInteger state, NSString * _Nonnull msg,NSString * _Nonnull total, id  _Nonnull resultData) {
        if (state == CODE_SUCCESS) {
            self.collection_main.total = [total integerValue];
            NSMutableArray *array = [MakeProblemMainModel mj_objectArrayWithKeyValuesArray:resultData];
            [self dataSetArray:array andPage:page];
        }
    }];
}
//所有错题练习
- (void)requestAllMyWrongPage:(NSInteger)page
{
    [SQNetworkInterface iRequestConsolidateMyWrongParames:@{@"userId":@"33",@"page":@(page),@"rows":@(pageCount)} andResult:^(NSInteger state, NSString * _Nonnull msg,NSString * _Nonnull total, id  _Nonnull resultData) {
        if (state == CODE_SUCCESS) {
            self.collection_main.total = [total integerValue];
            NSMutableArray *array = [MakeProblemMainModel mj_objectArrayWithKeyValuesArray:resultData];
            [self dataSetArray:array andPage:page];
        }
    }];
}
//各种数据，获取数据后的数据处理
- (void)dataSetArray:(NSMutableArray *)array andPage:(NSInteger)page
{
    if (self.data_model.result.count == 0 ) {
        self.data_model = [DataModel new];
        for (int i=0; i<self.collection_main.total; i++) {
            MakeProblemMainModel *model = [MakeProblemMainModel new];
            model.rowNum = [NSString stringWithFormat:@"%d",i];
            [self.data_model.result addObject:model];
        }
        //第一次加载
        [self.data_model.result replaceObjectsInRange:NSMakeRange(pageCount*(page-1), array.count) withObjectsFromArray:array];
        self.collection_main.array_models = self.data_model.result;
        [self.collection_main reloadData];
        if (self.lastNum.length) {//调到上次做题的地方
            self.collection_main.currentPage = @([self.lastNum integerValue]-1);
            [self.collection_main selectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:[self.lastNum integerValue]-1] animated:YES scrollPosition:UICollectionViewScrollPositionRight];
        }
    }
    else{//在需要的时候加载
        [self.data_model.result replaceObjectsInRange:NSMakeRange(pageCount*(page-1), array.count) withObjectsFromArray:array];
        self.collection_main.array_models = self.data_model.result;
        [self viewBottomChange:self.collection_main.currentPage];
        [self.collection_main reloadSections:[NSIndexSet indexSetWithIndex:[self.collection_main.currentPage integerValue]]];
    }
}
//做题，收藏，笔记，
- (void)requestAnswer:(NSDictionary *)dic andType:(NSInteger)type//是收藏还是笔记，修改答案，添加评论
{
    MakeProblemMainModel *model = self.collection_main.array_models[[self.collection_main.currentPage integerValue]];

    NSMutableDictionary *parames = [NSMutableDictionary dictionaryWithDictionary:dic];
    [parames setObject:model.ID forKey:@"questionId"];
    [parames setObject:@"33" forKey:@"userId"];
    if (type == 4) {//答题的时候
        [parames setObject:@"1" forKey:@"empty"];
    }
    else{//收藏，笔记，评论
        if (model.questionAnswer.ID.length) {//已经答题
            [parames setObject:@"1" forKey:@"empty"];
        }
        else{
            [parames setObject:@"0" forKey:@"empty"];
        }
    }
    [SQNetworkInterface iRequestMakeProblemMakeParames:parames andResult:^(NSInteger state, NSString * _Nonnull msg, NSString * _Nonnull total, id  _Nonnull resultData) {
        if (state == CODE_SUCCESS) {
            //notes笔记，answer修改答案，correct做题正确与否，answerTime做题时间，discussTime修改时间，collection收藏，discuss评论
            model.questionAnswer.ID = resultData[@"answerId"];
            model.questionAnswer.discussTime = dic[@"discussTime"];
            if (type == 1) {
                model.questionAnswer.collection = dic[@"collection"];
            }
            else if (type == 2) {
                model.questionAnswer.notes = dic[@"notes"];
            }
            else if (type == 3) {
                if (!model.commits) {
                    model.commits = [NSMutableArray array];
                }
                [model.commits addObject:[dic.allValues firstObject]];
            }
            else if (type == 4) {
                model.questionAnswer.answer = dic[@"answer"];
                model.questionAnswer.correct = dic[@"correct"];
                model.questionAnswer.answerTime = dic[@"answerTime"];
            }
            [self.data_model.result replaceObjectAtIndex:[self.collection_main.currentPage integerValue] withObject:model];
            [self.collection_main reloadSections:[NSIndexSet indexSetWithIndex:[self.collection_main.currentPage integerValue]]];
             DDLogDebug(@"提交做题的正确与否");
        }
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
