//
//  ChapterMainCollection.m
//  eduaction_app
//
//  Created by Mac on 2018/11/5.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ChapterMainCollection.h"
#import "ChapterMainCVCell.h"
#import "ChapterCVCell.h"

static NSString * const cell1 = @"ChapterMainCVCell";
static NSString * const cell2 = @"ChapterCVCell";

@implementation ChapterMainCollection

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([ChapterMainCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell1];
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([ChapterCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell2];
        [self registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"foot"];
        
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
        return self.model_array.count;
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(section?4:0, 0, 0, 0);
}

#pragma mark -- foot
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        return (CGSize){collectionView.py_width,40};
    }
    return (CGSize){0,0};
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        UICollectionReusableView *foot = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"foot" forIndexPath:indexPath];
        if (![foot viewWithTag:1]) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = (CGRect){collectionView.py_width-100,0,100,foot.py_height};
            btn.tag = 1;
            [btn setTitle:@"  清空答题" forState:UIControlStateNormal];
            [btn setImage:[UIImage imageNamed:@"search_btn_delete"] forState:UIControlStateNormal];
            [btn setTitleColor:HexRGB(0x999999) forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:13];
            [foot addSubview:btn];
            [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
                if (self.blockGoOn) {
                    self.blockGoOn([NSIndexPath indexPathForRow:0 inSection:0]);
                }
            }];
            
        }
        return foot;
    }
    return nil;
}

#pragma mark --- cell
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(self.py_width, 116);
    }
    else {
        return CGSizeMake(self.py_width, 86);
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        ChapterMainCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
        if (self.qsTotal) {
            [cell leftNumber:self.qsAnswerCount andTotal:self.qsTotal];
            [cell rightNumber:self.qsCorrectCount];
            [cell.view_ratio creatRatioViewWithNumber:[self.qsAverage floatValue] andType:RatioViewTypeRedLine];
        }
        else{
            [cell.view_ratio creatRatioViewWithNumber:0.0 andType:RatioViewTypeRedLine];
        }
        return cell;
    }
    else{
        ChapterListModel *model = self.model_array[indexPath.row];
        ChapterCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell2 forIndexPath:indexPath];
        [cell setChapterMainModel:model];
        [cell.view_ratio creatRatioViewWithNumber:[model.correctLv floatValue]/100.0 andType:RatioViewTypeYellow];
        return cell;
    }    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.blockGoOn && indexPath.section) {
        self.blockGoOn(indexPath);
    }
}
@end
