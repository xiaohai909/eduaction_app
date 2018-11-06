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

static NSString * const cell1 = @"MakeProblemTopicCVCell";
static NSString * const cell2 = @"MakeProblemOptionCVCell";

@implementation MakeProblemMainCollection

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/*
 答题模式：进入后仅显示问题
 考试模式：问题和倒计时，做完题后，点击下一题
 背题模式：显示问题和解析
*/
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([MakeProblemTopicCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell1];
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([MakeProblemOptionCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell2];
        
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if (section == 1){
        return 5;
    }
    else {
        return 0;
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(section?4:0, 0, 0, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(self.py_width, (indexPath.row%2)?(92+100):92);
    }
    else {
        return CGSizeMake(self.py_width, 35);
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MakeProblemTopicCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
        cell.img_content_height.constant = indexPath.row%2?100:0;
        return cell;
    }
    else{
        MakeProblemOptionCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell2 forIndexPath:indexPath];
        //如果是背题模式，那就直接将正确答案显示出来
//        [cell setContent:@"普通答案" andRow:indexPath.row andState:OptionStateRight];
//        [cell setContent:@"正确答案" andRow:indexPath.row andState:OptionStateNormal];
        
        //其他情况就要判断用户是否已经选择，如果已经选择就提示正确答案，还有选择的是错误答案
        [cell setContent:@"答案" andRow:indexPath.row andState:[self stateForIndexPath:indexPath]];
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
    if (!self.indexPath.section) {//单选，选择完后就不能再选
        self.indexPath = indexPath;
        //如果是考试模式，显示一下答案就行
//        [collectionView reloadSections:[NSIndexSet indexSetWithIndex:1]];
        //如果是其他模式，那就要把解析等其他信息显示出来
        [collectionView reloadData];
    }
}


#pragma mark -- 数据操作
//现在这个位置的答案是正确的吗
- (BOOL)nowIsRight:(NSIndexPath *)indexPath
{
    return (indexPath.row == 2)?YES:NO;
}
//当前cell的转态
- (OptionState)stateForIndexPath:(NSIndexPath *)indexPath
{
    //用户选择的
    if ([indexPath isEqual:self.indexPath] ) {//用户选的
        if ([self nowIsRight:indexPath]) {//用户选对了
            return OptionStateRight;
        }
        return OptionStateError;//用户选错了
    }//正确的答案
    else if([self nowIsRight:indexPath] ) {
#warning 后续这里要加一个背题模式的条件
        if (self.indexPath) {//||（背题模式）：用户已经选择过，背题模式,都可以直接显示
            return OptionStateRight;
        }//用户还没选择，但是要看这个不是背题模式
        return OptionStateNormal;
    }
    else {//普通的
        return OptionStateNormal;
    }
}
@end
