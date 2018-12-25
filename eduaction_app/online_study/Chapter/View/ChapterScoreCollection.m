//
//  ChapterScoreCollection.m
//  eduaction_app
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ChapterScoreCollection.h"
#import "ChapterScoreHeadCVCell.h"
#import "ChapterScoreCVCell.h"

static NSString * const cell1 = @"ChapterScoreHeadCVCell";
static NSString * const cell2 = @"ChapterScoreCVCell";


@implementation ChapterScoreCollection

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([ChapterScoreHeadCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell1];
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([ChapterScoreCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell2];
        
        
        self.contentInset = UIEdgeInsetsMake(-(UI_IS_IPHONE_X?44:0), 0, 0, 0);
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
    else {
        return 4;
    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, section?9:0, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(self.py_width, UI_IS_IPHONE_X?274:230);
    }
    else {
        return CGSizeMake(self.py_width/2-0.5, 100);
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        ChapterScoreHeadCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
        if (self.model) {
            [cell contentNumber:[NSString stringWithFormat:@"%@",self.model.correctLv]];
            [cell leftNumber:[NSString stringWithFormat:@"%@",self.model.correctCount] andTotal:[NSString stringWithFormat:@"%@",self.model.answerCount]];
            [cell rightNumber:[NSString stringWithFormat:@"%@",self.model.answerCount] andTotal:[NSString stringWithFormat:@"%@",self.model.questionCount]];
        }
        //takeUntil:cell.rac_prepareForReuseSignal保证只对当前的cell响应，重用的cell不响应
        [[[cell.btn_back rac_signalForControlEvents:UIControlEventTouchUpInside] takeUntil:cell.rac_prepareForReuseSignal] subscribeNext:^(__kindof UIControl * _Nullable x) {
            if (self.blockGoOn) {
                self.blockGoOn(indexPath);
            }
        }];
        return cell;
    }
    else {
        ChapterScoreCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell2 forIndexPath:indexPath];
        NSArray *array_image = @[@"grade_ico_wrong question",@"grade_ico_collection",@"grade_ico_notes",@"grade_ico_analysis"];
        NSArray *array_title = @[@"本章错题",@"本章收藏",@"本章笔记",@"错题解析"];
        if (self.model) {
            NSArray *array_detail = @[[NSString stringWithFormat:@"做错%@题，未做%@题",self.model.wrongCount,self.model.leftCount],@"收藏起来，反复练习",@"学到成功 少不了笔记",@"错题解析 还要练习哦"];
            [cell setImageName:array_image[indexPath.row] andTitle:array_title[indexPath.row] andDetail:array_detail[indexPath.row]];
        }
        else{
            NSArray *array_detail = @[@"做错0题，未做0题",@"收藏起来，反复练习",@"学到成功 少不了笔记",@"错题解析 还要练习哦"];
            [cell setImageName:array_image[indexPath.row] andTitle:array_title[indexPath.row] andDetail:array_detail[indexPath.row]];
        }
    
        return cell;
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        if (self.blockGoOn) {
            self.blockGoOn(indexPath);
        }
    }
    
}
@end
