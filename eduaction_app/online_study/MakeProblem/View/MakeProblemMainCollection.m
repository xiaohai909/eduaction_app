//
//  MakeProblemMainCollection.m
//  eduaction_app
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MakeProblemMainCollection.h"
#import "MakeProblemTopicCVCell.h"
#import "MakeProblemOptionCVCell.h"
#import "MakeProblemAnswerCVCell.h"
#import "MakeProblemCommitCVCell.h"

#import "MakeProlemAnswerCRView.h"
#import "MakeProblemCommitCRView.h"

static NSString * const cell1 = @"MakeProblemTopicCVCell";
static NSString * const cell2 = @"MakeProblemOptionCVCell";
static NSString * const cell3 = @"MakeProblemAnswerCVCell";
static NSString * const cell4 = @"MakeProblemCommitCVCell";



static NSString * const crView1 = @"MakeProlemAnswerCRView";
static NSString * const crView2 = @"MakeProblemCommitCRView";


@interface MakeProblemMainCollection ()
@property (nonatomic, assign) BOOL commitShow;//评论是否都展示出来
@end

@implementation MakeProblemMainCollection

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout andType:(MakeProblemMode)viewMode {
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([MakeProblemTopicCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell1];
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([MakeProblemOptionCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell2];
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([MakeProblemAnswerCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell3];
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([MakeProblemCommitCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell4];

        [self registerNib:[UINib nibWithNibName:NSStringFromClass([MakeProlemAnswerCRView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:crView1];
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([MakeProblemCommitCRView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:crView2];

        self.delegate = self;
        self.dataSource = self;
        
        self.viewMode = viewMode;
        self.commitShow = YES;
    }
    return self;
}

#pragma mark -- model
- (void)setModel:(MakeProblemMode)viewMode andFrame:(CGRect)frame andModel:(MakeProblemMainModel *)model {
    self.frame = frame;
    self.viewMode = viewMode;
    self.model = model;
    
    //用户选择
//    self.indexPath = [NSIndexPath indexPathForRow:random()%5 inSection:1];
    [self reloadData];
}

#pragma mark --- set
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (self.model.isSelelct && (self.viewMode != MakeProblemModeExam)) {//用户已经选择且不是考试模式
//    if (self.indexPath && (self.viewMode != MakeProblemModeExam)) {//用户已经选择且不是考试模式
        //还要看是不是自动跳转
        if (self.isAutoReturn && self.model.selectTrue) {
            return 2;
        }
        return 4;
    }
    else {
        return 2;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if (section == 1){
        return 5;//答案的个数
    }
    else if (section == 2) {
        return 3;//答案，解析，笔记
    }
    else {
        return self.commitShow?2:0;//评论的个数，是不是展开
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark --- ReusableView
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (self.viewMode != MakeProblemModeExam) {//只要不是考试模式就展示,因为选择过了才会有第二第三组，这里就不判断了
        if (section == 2) {
            return CGSizeMake(self.py_width, 50);
        }
        else if (section == 3) {//评论
            return CGSizeMake(self.py_width, self.commitShow?70:41);
        }
    }
    return CGSizeMake(0, 0);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader] && (self.viewMode != MakeProblemModeExam)) {
        if (indexPath.section == 2) {
            //答对了还是答错了
            MakeProlemAnswerCRView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:crView1 forIndexPath:indexPath];
            view.btn_state.selected = (self.viewMode == MakeProblemModeMemory)?YES:self.model.selectTrue;//用户选择的是正确的还是错误的
            return view;
        }
        else if (indexPath.section == 3) {
            MakeProblemCommitCRView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:crView2 forIndexPath:indexPath];
            view.btn_detail.selected = self.commitShow;
            
            [[view.btn_detail rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
               //是否展示评论
                self.commitShow = !view.btn_detail.selected;
                [self reloadSections:[NSIndexSet indexSetWithIndex:3]];
            }];
            return view;
        }
    }
    return nil;
}
- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    view.layer.zPosition = 0.0;//修改滑动块被UICollectionReusableView隔断
}


#pragma mark --- cell
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(self.py_width, (indexPath.row%2)?(92+100):92);//就看要不要显示图片了
    }
    else if (indexPath.section == 1){
        return CGSizeMake(self.py_width, 35);//固定的
    }
    else if (indexPath.section == 2){
        return CGSizeMake(self.py_width, 107);//答案，解析，笔记：按照内容的大小来
    }
    else{
        return CGSizeMake(self.py_width, 100);//按照评论的内容大小来
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MakeProblemTopicCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
        cell.img_content_height.constant = indexPath.row%2?100:0;
        cell.lbl_now.text = [NSString stringWithFormat:@"%ld",self.tag+1];
        cell.lbl_total.text = [NSString stringWithFormat:@"/%ld",self.allNumber];
        return cell;
    }
    else if (indexPath.section == 1) {
        MakeProblemOptionCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell2 forIndexPath:indexPath];
        [cell setContent:@"答案" andRow:indexPath.row andState:[self stateForIndexPath:indexPath]];
        return cell;
    }
    else if (indexPath.section == 2) {
        MakeProblemAnswerCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell3 forIndexPath:indexPath];
        return cell;
    }
    else {
     //评论
        MakeProblemCommitCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell4 forIndexPath:indexPath];
        return cell;
    }
}
/*
 //单选，多选
 if (@"单选"||@"判断题") {//选择完就确认对错}
 else if(@"多选") {//通过确认按钮来确认答题对错}
 else{ }
 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    /*
     1.如果是考试模式，就不提示解析，要不要告诉对方正确与否呢
     2.如果是其他情况都要告诉对方问题解析
     */
    if (!self.model.isSelelct) {//是否已经选择
//    if (!self.indexPath.section) {//单选，选择完后就不能再选
        self.model.selelct = [NSString stringWithFormat:@"%ld",indexPath.row];
//        self.indexPath = indexPath;
        
        //如果这题选对了且能自动跳转到下一题才自动跳转
        if (self.isAutoReturn && self.model.selectTrue) {
            //进入下一题
            [collectionView reloadSections:[NSIndexSet indexSetWithIndex:1]];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (self.blockGoOn) {
                    self.blockGoOn();
                }
            });
        }
        else{
            //如果自动跳转到下一题，就reloadSections 然后跳转到下一题
            //如果不是，才要按照类型来展示界面
            if (self.viewMode == MakeProblemModeExam) {
                //如果是考试模式，
                //显示一下答案就行
                [collectionView reloadSections:[NSIndexSet indexSetWithIndex:1]];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    if (self.blockGoOn) {
                        self.blockGoOn();
                    }
                });
            }
            else{
                //如果是其他模式，那就要把解析等其他信息显示出来
                [collectionView reloadData];
            }
        }
    }
}


#pragma mark -- 数据操作
//现在这个位置的答案是正确的吗
- (BOOL)nowIsRight:(NSIndexPath *)indexPath
{
    return [self.model isTrueResult:[NSString stringWithFormat:@"%ld",indexPath.row]];
//    return (indexPath.row == 2)?YES:NO;
}
//当前cell的转态
- (OptionState)stateForIndexPath:(NSIndexPath *)indexPath
{
    //现在是正确答案
    if([self nowIsRight:indexPath] ) {
        if (self.model.isSelelct||self.viewMode == MakeProblemModeMemory) {//用户已经选择过，背题模式,都可以直接显示
//        if (self.indexPath||self.viewMode == MakeProblemModeMemory) {//用户已经选择过，背题模式,都可以直接显示
            return OptionStateRight;
        }//用户还没选择，但是要看这个不是背题模式
        return OptionStateNormal;
    }
    else {
        //现在不是正确答案
        //用户选择了这个错误的答案
        if ([self.model.selelct isEqualToString:[NSString stringWithFormat:@"%ld",indexPath.row]] && self.viewMode != MakeProblemModeMemory ) {//用户选的,且当前状态不是背题模式
//        if ([indexPath isEqual:self.indexPath] && self.viewMode != MakeProblemModeMemory ) {//用户选的,且当前状态不是背题模式
            return OptionStateError;//用户选错了
        }
        return OptionStateNormal;
    }
}
@end
