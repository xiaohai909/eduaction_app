//
//  MineMessageCollection.m
//  eduaction_app
//
//  Created by Mac on 2018/11/27.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineMessageCollection.h"
#import "MineMessageFromCVCell.h"
#import "MineMassageCVCell.h"

static NSString * const cell1 = @"MineMassageCVCell";
static NSString * const cell2 = @"MineMessageFromCVCell";


@implementation MineMessageCollection

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
        
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([MineMassageCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell1];
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([MineMessageFromCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell2];

        
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

#pragma mark --- collection
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;//2018打开
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return 10;
}
- (UIEdgeInsets )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(section?0:10, 0, 10, 0);
}

#pragma mark --- cell
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.py_width, 80);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MineMassageCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
        cell.lbl_count.text = @"4";
        return cell;
    }
    else {
        MineMessageFromCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell2 forIndexPath:indexPath];
        return cell;
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.blockGoOn) {
        self.blockGoOn(indexPath);
    }
}

@end
