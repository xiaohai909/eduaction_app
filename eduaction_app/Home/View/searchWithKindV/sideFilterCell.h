//
//  sideFilterCell.h
//  eduaction_app
//
//  Created by legendlxd on 2018/11/21.
//  Copyright © 2018年 diandang. All rights reserved.
//


typedef NS_ENUM(NSUInteger, CommonTableViewCellSelectionType) {
    BrandTableViewCellSelectionTypeSingle = 0,                  //单选
    BrandTableViewCellSelectionTypeMultiple = 1,                //双选
};
/**
 数据源model customDict中可配置的key_value
 */
#define REGION_SELECTION_TYPE @"REGION_SELECTION_TYPE"
NS_ASSUME_NONNULL_BEGIN

@interface sideFilterCell : SideSlipBaseTableViewCell <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionV;
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (strong, nonatomic) ZYSideSlipFilterRegionModel *regionModel;
@property (strong, nonatomic) NSArray *dataList;
@property (strong, nonatomic) NSMutableArray *selectedItemList;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionHeight;
@property (assign, nonatomic) CommonTableViewCellSelectionType selectionType;
@end

NS_ASSUME_NONNULL_END
