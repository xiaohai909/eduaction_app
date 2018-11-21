//
//  sideFilterCell.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/21.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "sideFilterCell.h"
#import "FilterCommonCollectionViewCell.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define FILTER_LEADING ((ZYSideSlipFilterController *)self.delegate).sideSlipLeading
#define CELL_WIDTH SCREEN_WIDTH - FILTER_LEADING

#define LINE_SPACE_COLLECTION_ITEM 8
#define GAP_COLLECTION_ITEM 8
#define NUM_OF_ITEM_ONCE_ROW 3.f
#define ITEM_WIDTH ((CELL_WIDTH - (NUM_OF_ITEM_ONCE_ROW+1)*GAP_COLLECTION_ITEM-16)/NUM_OF_ITEM_ONCE_ROW)
#define ITEM_WIDTH_HEIGHT_RATIO 4.f
#define ITEM_HEIGHT ceil(ITEM_WIDTH/ITEM_WIDTH_HEIGHT_RATIO)

@implementation sideFilterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (NSString *)cellReuseIdentifier {
    return @"sideFilterCell";
}

+ (instancetype)createCellWithIndexPath:(NSIndexPath *)indexPath {
    sideFilterCell *cell = [[NSBundle mainBundle] loadNibNamed:@"sideFilterCell" owner:nil options:nil][0];
    cell.indexPath = indexPath;
    [cell configureCell];
    return cell;
}
- (void)configureCell {
    _myCollectionV.delegate = self;
    _myCollectionV.dataSource = self;
    //_myCollectionV.contentInset = UIEdgeInsetsMake(0, GAP_COLLECTION_ITEM, 0, GAP_COLLECTION_ITEM);
    [_myCollectionV registerClass:[FilterCommonCollectionViewCell class] forCellWithReuseIdentifier:[FilterCommonCollectionViewCell cellReuseIdentifier]];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}
- (void)updateCellWithModel:(ZYSideSlipFilterRegionModel **)model
                  indexPath:(NSIndexPath *)indexPath {
    self.indexPath = indexPath;
    self.regionModel = *model;
    //title
    [self.titleLab setText:_regionModel.regionTitle];
    //content
    self.dataList = _regionModel.itemList;
//    //icon
//    if (_regionModel.isShowAll) {
//        [_controlIcon setImage:[UIImage imageNamed:@"icon_up"]];
//    } else {
//        [_controlIcon setImage:[UIImage imageNamed:@"icon_down"]];
//    }
    //controlLabel
    self.selectedItemList = [NSMutableArray arrayWithArray:_regionModel.selectedItemList];
//    [self generateControlLabelText];
    //selectionType
    NSNumber *selectionType = _regionModel.customDict[REGION_SELECTION_TYPE];
    if (selectionType) {
        self.selectionType = [selectionType unsignedIntegerValue];
    }
    //UI
    [self.myCollectionV reloadData];
    [self fitCollectonViewHeight];
}
//根据数据源个数决定collectionView高度
- (void)fitCollectonViewHeight {
    CGFloat displayNumOfRow  = ceil(_dataList.count/NUM_OF_ITEM_ONCE_ROW);;
//    if (_regionModel.isShowAll) {
//        //displayNumOfRow = ceil(_dataList.count/NUM_OF_ITEM_ONCE_ROW);
//        displayNumOfRow = NUM_OF_ITEM_ONCE_ROW;
//    } else {
//        displayNumOfRow = BRIEF_ROW;
//    }
    CGFloat collectionViewHeight = displayNumOfRow*ITEM_HEIGHT + (displayNumOfRow - 1)*LINE_SPACE_COLLECTION_ITEM;
    
    self.collectionHeight.constant = collectionViewHeight;
    [self.myCollectionV updateHeight:collectionViewHeight];
}
- (void)tap2SelectItem:(NSIndexPath *)indexPath {
    switch (_selectionType) {
        case BrandTableViewCellSelectionTypeSingle:
        {
            NSArray *itemArray = _regionModel.itemList;
            CommonItemModel *model = [itemArray objectAtIndex:indexPath.row];
            if (!model.selected) {
                for (CommonItemModel *item in itemArray) {
                    item.selected = NO;
                }
                [self.selectedItemList removeAllObjects];
                [self.selectedItemList addObject:model];
            } else {
                [self.selectedItemList removeObject:model];
            }
            model.selected = !model.selected;
        }
            break;
        case BrandTableViewCellSelectionTypeMultiple:
        {
            NSArray *itemArray = _regionModel.itemList;
            CommonItemModel *model = [itemArray objectAtIndex:indexPath.row];
            model.selected = !model.selected;
            if (model.selected) {
                [self.selectedItemList addObject:model];
            } else {
                [self.selectedItemList removeObject:model];
            }
        }
            break;
        default:
            break;
    }
    _regionModel.selectedItemList = _selectedItemList;
    //[self generateControlLabelText];
}
#pragma mark - DataSource Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FilterCommonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[FilterCommonCollectionViewCell cellReuseIdentifier] forIndexPath:indexPath];
    CommonItemModel *model = [_dataList objectAtIndex:indexPath.row];
    [cell updateCellWithModel:model];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"ITEM_WIDTH %@ %@ %@",@(ITEM_WIDTH),@(CELL_WIDTH),@(ITEM_HEIGHT));
    return CGSizeMake(ITEM_WIDTH, ITEM_HEIGHT);
    //return CGSizeMake(20, 20);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return LINE_SPACE_COLLECTION_ITEM;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.5*GAP_COLLECTION_ITEM;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:NO];
    [self tap2SelectItem:indexPath];
    [self.myCollectionV reloadData];
}

- (IBAction)clickShowMoreButton:(id)sender {
    _regionModel.isShowAll = !_regionModel.isShowAll;
    [self fitCollectonViewHeight];
    //reload
    if ([self.delegate respondsToSelector:@selector(sideSlipTableViewCellNeedsReload:)]) {
        [self.delegate sideSlipTableViewCellNeedsReload:_indexPath];
    }
    //scroll
    if (_regionModel.isShowAll && [self.delegate respondsToSelector:@selector(sideSlipTableViewCellNeedsScrollToCell:atScrollPosition:animated:)]) {
        [self.delegate sideSlipTableViewCellNeedsScrollToCell:self atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    }
}
- (NSMutableArray *)selectedItemList {
    if (!_selectedItemList) {
        _selectedItemList = [NSMutableArray array];
    }
    return _selectedItemList;
}
@end
