//
//  trainRightCollection.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/19.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "trainRightCollection.h"
#import "trainRightCell.h"
#import "trainRightHead.h"
static NSString * const cell1 = @"trainRightCell";
static NSString * const HID = @"trainRightHead";
@implementation trainRightCollection
{
    NSMutableArray *titleArr;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if ([super initWithFrame:frame collectionViewLayout:layout]) {
        
        self.showsVerticalScrollIndicator =NO;
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([trainRightCell class]) bundle:nil] forCellWithReuseIdentifier:cell1];
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([trainRightHead class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HID];
        self.delegate =self;
        self.dataSource =self;
        
        NSArray *arr = @[@{@"title":@"基础科目",@"data":@[@"兽医法律法规与职业道德",@"动物解刨、组织与胚胎学",@"动物生理学",@"动物生物化学",@"兽医病理学"]},@{@"title":@"预防科目",@"data":@[@"兽医法律法规与职业道德",@"动物解刨、组织与胚胎学",@"动物生理学",@"动物生物化学",@"兽医病理学"]},@{@"title":@"预防科目",@"data":@[@"兽医法律法规与职业道德",@"动物解刨、组织与胚胎学",@"动物生理学",@"动物生物化学",@"兽医病理学"]},@{@"title":@"临床科目",@"data":@[@"兽医法律法规与职业道德",@"动物解刨、组织与胚胎学",@"动物生理学",@"动物生物化学",@"兽医病理学"]},@{@"title":@"综合应用科目",@"data":@[@"兽医法律法规与职业道德",@"动物解刨、组织与胚胎学",@"动物生理学",@"动物生物化学",@"兽医病理学"]}];
        titleArr = [[NSMutableArray alloc]initWithArray:arr];
    }
    return self;
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return titleArr.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    

    NSDictionary *dic = [titleArr objectAtIndex:section];
    NSArray *arr = dic[@"data"];
    return arr.count;
    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NSDictionary *dic = [titleArr objectAtIndex:indexPath.section];
    NSArray *arr = dic[@"data"];
    NSString *title = arr[indexPath.item];
    
    trainRightCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
    cell.titleLab.text = title;
    return cell;
   
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 4;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 4;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return (CGSize){(ZTWidth - 99),54*scale_H};
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{

    return CGSizeZero;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return (CGSize){(ZTWidth - 123)/2.0,54*scale_H};
    
}



-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{

        
        if (kind == UICollectionElementKindSectionHeader)
        {
            
            NSDictionary *dic = [titleArr objectAtIndex:indexPath.section];
            NSArray *arr = dic[@"data"];
            NSString *title = arr[indexPath.item];
            
            
            trainRightHead * headVc = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HID forIndexPath:indexPath];
            
            headVc.titleLab.text = title;
            return headVc;
        }
    

    
    
    return nil;
}
@end
