//
//  SyllabusMainCollection.m
//  eduaction_app
//
//  Created by Mac on 2018/11/15.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "SyllabusMainCollection.h"
#import "SyllabusMainCRView.h"
#import "SyllabusMainCVCell.h"

static NSString * const cr_cell1 = @"SyllabusMainCRView";
static NSString * const cell1 = @"SyllabusMainCVCell";


@implementation SyllabusMainCollection

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
        
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([SyllabusMainCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell1];
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([SyllabusMainCRView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:cr_cell1];
        
        self.delegate = self;
        self.dataSource = self;
        
        self.select_section = [NSIndexPath indexPathForRow:0 inSection:0];
    }
    return self;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 6;//2018打开
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return (self.select_section.section==section && section)?3:0;
}
#pragma mark --- head
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(self.py_width, 30);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        SyllabusMainCRView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:cr_cell1 forIndexPath:indexPath];
        view.lbl_content.text = @"2018年考试大纲";
        view.btn_sign_left.constant = indexPath.section?39:16;
        if (self.select_section.section == indexPath.section || indexPath.section == 0) {
            view.btn_sign.selected = YES;
        }
        else{
            view.btn_sign.selected = NO;
        }
        [view setBlockClick:^{
            if (self.select_section == [NSIndexPath indexPathForRow:0 inSection:0]) {//打开一个
                self.select_section = indexPath;
                [self reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]];
            }
            else if(self.select_section == indexPath){//原来选中现在关闭
                self.select_section = [NSIndexPath indexPathForRow:0 inSection:0];
                [self reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section]];
            }
            else{//更改
                self.select_section = indexPath;
                [self reloadData];
            }
        }];
        return view;
    }
    return nil;
}

#pragma mark --- cell
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.py_width, 85);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SyllabusMainCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
    [cell setTitle:@"细菌的形态" andContent:@"(1)细菌的个性形态   (2)细菌的群体形态" andModel:0];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.blockGoOn) {
        self.blockGoOn(indexPath);
    }
}

@end
