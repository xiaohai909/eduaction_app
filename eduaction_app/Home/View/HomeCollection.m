//
//  HomeCollection.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/2.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "HomeCollection.h"
static NSString * const cell1 = @"HomecourseCell";
static NSString * const cell2 = @"HomenewsCell";
static NSString * const HID = @"HomeCollHeadV";
static NSString * const HID2 = @"HometestplanHeader";
static NSString * const HID3 = @"Hometestfooter";
@implementation HomeCollection
{
    NSMutableArray *deviceArr;
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
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([HomecourseCell class]) bundle:nil] forCellWithReuseIdentifier:cell1];
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([HomenewsCell class]) bundle:nil] forCellWithReuseIdentifier:cell2];

    
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([homeheaderCR class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HID];
        
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([homeheaderCR2 class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HID2];

 
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([homeFooterRefresh class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:HID3];
        
        self.delegate =self;
        self.dataSource =self;
        
    }
    return self;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return  0;
    }
    else if (section == 1){
        return 1;
    }
    else{
        return 1;
    }

}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    


    
    
    HomecourseCell *cell_1 = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
    HomenewsCell * cell_2 = [collectionView dequeueReusableCellWithReuseIdentifier:cell2 forIndexPath:indexPath];
    if (indexPath.section == 1) {
        
        return cell_1;
    }
    else if (indexPath.section == 2){
        
        return cell_2;
    }
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
    if (section == 0) {
         return (CGSize){ZTWidth,124};
    }
    return (CGSize){ZTWidth,44};
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 1) {
          return (CGSize){ZTWidth,36};
    }
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
         
            homeheaderCR2 * headVc = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HID2 forIndexPath:indexPath];

            
             return headVc;
        }
    }
  
    else if (indexPath.section == 1){
        
        if (kind == UICollectionElementKindSectionHeader)
        {
              homeheaderCR * headVc = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HID forIndexPath:indexPath];
            

             return headVc;
        }
        else if (kind == UICollectionElementKindSectionFooter){
            
            homeFooterRefresh *footer= [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:HID3 forIndexPath:indexPath];
             return footer;
        }
        
    }
    else{
        
        if (kind == UICollectionElementKindSectionHeader)
        {
            homeheaderCR * headVc = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HID forIndexPath:indexPath];
            

            
            return headVc;
            
        }
       
    }
   
    
    return nil;
}
@end
