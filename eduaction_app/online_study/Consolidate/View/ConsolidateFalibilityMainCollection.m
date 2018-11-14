//
//  ConsolidateFalibilityMainCollection.m
//  eduaction_app
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ConsolidateFalibilityMainCollection.h"
#import "ConsolidateProblemCVCell.h"


static NSString * const cell1 = @"ConsolidateProblemCVCell";

@implementation ConsolidateFalibilityMainCollection

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([ConsolidateProblemCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell1];
        
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}
#pragma mark --- change

#pragma mark --- collection
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.array_models.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(section?1:0, 0, 0, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.py_width, indexPath.row?25:40);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        ConsolidateProblemCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
        [cell setCollectionModify:NO andTitle:@"1.盐类泻药应选用（）"];
        cell.lbl_content.textColor = HexRGB(0x333333);
        cell.lbl_content.font = [UIFont systemFontOfSize:16];
        cell.lbl_content_left.constant = 15;
        return cell;
    }
    else {
        ConsolidateProblemCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
        [cell setCollectionModify:YES andTitle:@"123456人答错"];
        [cell.btn_image setImage:[UIImage imageNamed:@"error prone_ico_wrong question"] forState:UIControlStateNormal];
        cell.lbl_content.textColor = HexRGB(0xFF6B6B);
        cell.lbl_content.font = [UIFont systemFontOfSize:14];
        cell.lbl_content_left.constant = 40;
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
@end
