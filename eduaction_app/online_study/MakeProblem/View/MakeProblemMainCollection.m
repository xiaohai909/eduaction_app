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
        self.commitShow = NO;
        
        //添加左右滑动的效果
        UISwipeGestureRecognizer *swipe_left = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(pageChange:)];//下一页
        swipe_left.direction = UISwipeGestureRecognizerDirectionLeft;
        [self addGestureRecognizer:swipe_left];
        UISwipeGestureRecognizer *swipe_right = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(pageChange:)];//上一页
        swipe_right.direction = UISwipeGestureRecognizerDirectionRight;
        [self addGestureRecognizer:swipe_right];
    }
    return self;
}

- (void)pageChange:(UISwipeGestureRecognizer *)gesture
{
    if (self.blockPageChange) {
        self.blockPageChange(gesture.direction==UISwipeGestureRecognizerDirectionLeft);
    }
}
#pragma mark -- model
- (void)setModel:(MakeProblemMode)viewMode andFrame:(CGRect)frame andModel:(MakeProblemMainModel *)model {
    self.frame = frame;
    self.viewMode = viewMode;
    self.model = model;
    [self reloadData];
}

#pragma mark --- set
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (self.model.isSelelct && self.viewMode != MakeProblemModeExam) {//用户已经选择且不是考试模式
        return 4;
    }
    else if(self.viewMode == MakeProblemModeMemory){//如果是背题模式，不用选择
        return 4;
    }
    else{
        return 2;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if (section == 1){
        return self.model.questionOptionList.count;//答案的个数
    }
    else if (section == 2) {
        return self.model.questionAnswer.notes.length?3:2;//答案，解析，笔记
    }
    else {
        return self.commitShow?self.model.commits.count:0;//评论的个数，是不是展开
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
            view.lbl_title.text = [NSString stringWithFormat:@"评论（%@）",self.model.discussCount];            
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
        return CGSizeMake(self.py_width,self.model.height_title);//就看要不要显示图片了
    }
    else if (indexPath.section == 1){
        return CGSizeMake(self.py_width, 35);//固定的
    }
    else if (indexPath.section == 2){
        if (indexPath.row == 0) {
             return CGSizeMake(self.py_width, 100);
        }
        else if (indexPath.row == 1) {
             return CGSizeMake(self.py_width, self.model.height_analysis);
        }
        else{
             return CGSizeMake(self.py_width, self.model.height_notes);
        }
       //答案，解析，笔记：按照内容的大小来
    }
    else{
        return CGSizeMake(self.py_width, 100);//按照评论的内容大小来
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MakeProblemTopicCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
        cell.img_content_height.constant = self.model.image.length?100:0;
        cell.lbl_now.text = [NSString stringWithFormat:@"%ld",self.tag+1];
        cell.lbl_total.text = [NSString stringWithFormat:@"/%ld",self.allNumber];
        cell.lbl_content.text = [NSString stringWithFormat:@"[%@]%@",self.model.questionType,self.model.questionTitle];//题目
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:5];
        NSMutableAttributedString *atb_detail = [[NSMutableAttributedString alloc] initWithString:cell.lbl_content.text];
        [atb_detail addAttribute:NSForegroundColorAttributeName value:HexRGB(0xFF6B6B) range:NSMakeRange(0,self.model.questionType.length+2)];
        [atb_detail addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,cell.lbl_content.text.length)];
        cell.lbl_content.attributedText = atb_detail;
        
        //字体变化
        cell.lbl_now.font = [UIFont systemFontOfSize:16+self.addTextFont];
        cell.lbl_total.font = [UIFont systemFontOfSize:16+self.addTextFont];
//        cell.lbl_type.font = [UIFont systemFontOfSize:14+self.addTextFont];
        //这里type就不单独写了，跟content一起z写
        cell.lbl_content.font = [UIFont systemFontOfSize:14+self.addTextFont];
        
        return cell;
    }
    else if (indexPath.section == 1) {
        MakeProblemOptionModel *option_model = self.model.questionOptionList[indexPath.row];
        MakeProblemOptionCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell2 forIndexPath:indexPath];
        [cell setContent:option_model.optionDescribe andOption:option_model.option andState:[self stateForIndexPath:indexPath]];
        
        //字体变化
        cell.btn_order.titleLabel.font = [UIFont systemFontOfSize:14+self.addTextFont];
        cell.btn_content.titleLabel.font = [UIFont systemFontOfSize:14+self.addTextFont];
        return cell;
    }
    else if (indexPath.section == 2) {
        MakeProblemAnswerCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell3 forIndexPath:indexPath];
        cell.btn_wrong.hidden = YES;

        if (indexPath.row == 0) {
            cell.btn_wrong.hidden = NO;
            cell.lbl_title.text = [NSString stringWithFormat:@"答案：%@  ",self.model.answer];
            if (self.viewMode == MakeProblemModeMemory) {
                cell.lbl_detail.text =[NSString stringWithFormat:@"全站正确率为%@",self.model.allCorrectLv];
            }
            else{
                cell.lbl_detail.text =[NSString stringWithFormat:@"您选择：%@\n全站正确率为%@",self.model.selelct,self.model.allCorrectLv];
                NSMutableAttributedString *atb_title = [[NSMutableAttributedString alloc] initWithString:cell.lbl_title.text];
                [atb_title addAttributes:@{NSForegroundColorAttributeName:HexRGB(0x179AF5)} range:NSMakeRange(3, 1)];
                cell.lbl_title.attributedText = atb_title;
                
                NSMutableAttributedString *atb_detail = [[NSMutableAttributedString alloc] initWithString:cell.lbl_detail.text];
                [atb_detail addAttributes:@{NSForegroundColorAttributeName:HexRGB(0x333333)} range:NSMakeRange(0, 3)];
                [atb_detail addAttributes:@{NSForegroundColorAttributeName:HexRGB(0xFF7B77)} range:NSMakeRange(4, 1)];
                NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
                [paragraphStyle setLineSpacing:10];
                [atb_detail addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,cell.lbl_detail.text.length)];
                cell.lbl_detail.attributedText = atb_detail;
            }
        }
        else if (indexPath.row == 1){
            cell.lbl_title.text = @"解析";
            cell.lbl_detail.text = self.model.analysis;
            NSMutableAttributedString *atb_detail = [[NSMutableAttributedString alloc] initWithString:cell.lbl_detail.text];
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setLineSpacing:5];
            paragraphStyle.firstLineHeadIndent = 20.f; // 首行缩进
            [atb_detail addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,cell.lbl_detail.text.length)];
            cell.lbl_detail.attributedText = atb_detail;

        }
        else if (indexPath.row == 2) {
            cell.lbl_title.text = @"笔记";
            cell.lbl_detail.text = self.model.questionAnswer.notes;
            NSMutableAttributedString *atb_detail = [[NSMutableAttributedString alloc] initWithString:cell.lbl_detail.text];
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setLineSpacing:5];
            paragraphStyle.firstLineHeadIndent = 20.f; // 首行缩进
            [atb_detail addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0,cell.lbl_detail.text.length)];
            cell.lbl_detail.attributedText = atb_detail;
        }
        
        //字体变化
        cell.btn_wrong.titleLabel.font = [UIFont systemFontOfSize:12+self.addTextFont];
        cell.lbl_title.font = [UIFont systemFontOfSize:14+self.addTextFont];
        cell.lbl_detail.font = [UIFont systemFontOfSize:14+self.addTextFont];
        return cell;
    }
    else {
     //评论
        MakeProblemCommitCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell4 forIndexPath:indexPath];
        //设置评论的数据
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
        MakeProblemOptionModel *option_model = self.model.questionOptionList[indexPath.row];
        self.model.selelct = option_model.option;
        self.model.optionId = option_model.optionId;
        if (self.blockMakeProblem) {
            self.blockMakeProblem(self.model.selectTrue?@"1":@"0");
        }
//        [self requestAnswer];//告诉后台用户的选择
#warning 这里界面的变化，要不要等提交给后台答题情况后再做动作
        //如果这题选对了且能自动跳转到下一题才自动跳转
        if (self.isAutoReturn && self.model.selectTrue) {
            //进入下一题
            [collectionView reloadData];
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
    MakeProblemOptionModel *option_model = self.model.questionOptionList[indexPath.row];
    return [self.model isTrueResult:option_model.option];
}
//当前cell的转态
- (OptionState)stateForIndexPath:(NSIndexPath *)indexPath
{
    MakeProblemOptionModel *option_model = self.model.questionOptionList[indexPath.row];
    if (self.model.selelct) {
        //现在是正确答案
        if ([self nowIsRight:indexPath]) {
             return OptionStateRight;
        }
        else{
            if ([self.model.selelct isEqualToString:option_model.option]) {//用户选择了错误的
                return OptionStateError;//用户选错了
            }
            else{
                return OptionStateNormal;
            }
        }
    }
    else{
        if (self.viewMode == MakeProblemModeMemory && [self nowIsRight:indexPath]) {
            return OptionStateRight;
        }
       return OptionStateNormal;
    }
}

#pragma mark --- request
- (void)requestAnswer//告诉后台回答的情况
{
    //self.model.ID
    NSMutableDictionary *dic = [self.model.questionAnswer mj_keyValues];
    [dic removeObjectForKey:@"ID"];
    [dic setObject:self.model.questionAnswer.ID forKey:@"id"];
    [dic setObject:self.model.selectTrue?@"1":@"0" forKey:@"correct"];
    [dic setObject:[SQNetworkInterface nowTime] forKey:@"answerTime"];
    [dic setObject:@"33" forKey:@"userId"];
    [dic setObject:self.model.ID forKey:@"questionId"];
    [SQNetworkInterface iRequestMakeProblemMakeParames:dic andResult:^(NSInteger state, NSString * _Nonnull msg, NSString * _Nonnull total, id  _Nonnull resultData) {
        if (state == CODE_SUCCESS) {
            //
            self.model.questionAnswer.collection = dic[@"collection"];
            DDLogVerbose(@"提交做题的正确与否");
        }
    }];
}
@end
