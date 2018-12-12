//
//  ConsolidateMyWrongMainCollection.m
//  eduaction_app
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ConsolidateMyWrongMainCollection.h"
#import "ConsolidateProblemCVCell.h"


static NSString * const cell1 = @"ConsolidateProblemCVCell";

@interface ConsolidateMyWrongMainCollection ()
{
    BOOL collection_modify;
}
@end

@implementation ConsolidateMyWrongMainCollection
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([ConsolidateProblemCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell1];
        
        self.delegate = self;
        self.dataSource = self;
        
        self.set_choise = [NSMutableSet set];
        self.array_models = [NSMutableArray array];
    }
    return self;
}
#pragma mark --- change
- (void)setArray_models:(NSMutableArray * _Nonnull)array_models
{
    _array_models = array_models;
    [self reloadData];
}
- (void)setCollectionModify:(BOOL)modify andAll:(BOOL)all
{
    collection_modify = modify;
    if (all) {
        //全选
        [self.set_choise addObjectsFromArray:self.array_models];
    }
    else{
        [self.set_choise removeAllObjects];
    }
    [self reloadData];
}

#pragma mark --- collection
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.array_models.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(section?1:0, 0, 0, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ConsolidateMyWrongModel *model = self.array_models[indexPath.section];
    return CGSizeMake(self.py_width, collection_modify?model.height_modify:model.height);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ConsolidateMyWrongModel *model = self.array_models[indexPath.section];
    
    ConsolidateProblemCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
    [cell setCollectionModify:collection_modify andTitle:[NSString stringWithFormat:@"%ld.%@",indexPath.section+1,model.questionTitle]];
    if (collection_modify) {//是不是编辑状态
        //是否存在
        bool isExist = [self.set_choise containsObject:self.array_models[indexPath.section]];
        cell.btn_image.selected = isExist;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (collection_modify) {
        //在编辑的时候。才有选择的功能
        bool isExist = [self.set_choise containsObject:self.array_models[indexPath.section]];
        if (isExist) {
            [self.set_choise removeObject:self.array_models[indexPath.section]];
            if (self.set_choise.count == self.array_models.count-1) {
                if (self.blockAllChoise) {
                    self.blockAllChoise(NO);
                }
            }
        }
        else{
            [self.set_choise addObject:self.array_models[indexPath.section]];
            if (self.set_choise.count == self.array_models.count) {
                if (self.blockAllChoise) {
                    self.blockAllChoise(YES);
                }
            }
        }
        //变更
        [collectionView reloadItemsAtIndexPaths:@[indexPath]];
    }
    else {
        if (self.blockGoOn) {
            self.blockGoOn(indexPath);
        }
    }
}

@end
