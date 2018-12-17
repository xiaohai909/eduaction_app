//
//  ConsolidateHotMainCollection.m
//  eduaction_app
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ConsolidateHotMainCollection.h"
#import "ConsolidateProblemCVCell.h"
#import "MakeProblemMainModel.h"

static NSString * const cell1 = @"ConsolidateProblemCVCell";

@implementation ConsolidateHotMainCollection


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
    MakeProblemMainModel *model = self.array_models[indexPath.section];
    if (indexPath.row == 0) {
        ConsolidateProblemCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
        [cell setCollectionModify:NO andTitle:[NSString stringWithFormat:@"%ld.%@",indexPath.section+1,model.questionTitle]];
        cell.lbl_content.numberOfLines = 1;
        cell.lbl_content.textColor = HexRGB(0x333333);
        cell.lbl_content.font = [UIFont systemFontOfSize:16];
        cell.lbl_content_left.constant = 15;
        return cell;
    }
    else {
        ConsolidateProblemCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
        [cell setCollectionModify:YES andTitle:[NSString stringWithFormat:@"%@人收藏",model.collectionCount]];
        [cell.btn_image setImage:[UIImage imageNamed:@"consolidate_btn_like"] forState:UIControlStateNormal];
        cell.lbl_content.textColor = HexRGB(0x666666);
        cell.lbl_content.font = [UIFont systemFontOfSize:14];
        cell.lbl_content_left.constant = 40;
        return cell;
    }    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@",indexPath);
}

@end
