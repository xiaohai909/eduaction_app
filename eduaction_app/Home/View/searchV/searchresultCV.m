//
//  searchresultCV.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/7.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "searchresultCV.h"
static NSString * const cell1 = @"HomenewsCell";
static NSString * const HID = @"SearchResultH";
@implementation searchresultCV

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    if ([super initWithFrame:frame collectionViewLayout:layout]) {
        
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([HomenewsCell class]) bundle:nil] forCellWithReuseIdentifier:cell1];
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([SearchResultH class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HID];
        
        self.delegate =self;
        self.dataSource =self;
    }
    return self;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    
 
    HomenewsCell * cell_1 = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
    
    return cell_1;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{

    return (CGSize){ZTWidth,34};
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{

    return CGSizeZero;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(ZTWidth, 120);
    
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        if (kind == UICollectionElementKindSectionHeader)
        {
            
            SearchResultH * headVc = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HID forIndexPath:indexPath];
            [headVc setupBtn:self.headtitile];
            
            return headVc;
        }
    }
    
    
    
    return nil;
}
@end
