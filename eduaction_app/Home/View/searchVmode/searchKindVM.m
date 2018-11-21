//
//  searchKindVM.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/21.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "searchKindVM.h"
#import "CommonItemModel.h"
#import "sideFilterCell.h"
@implementation searchKindVM
-(void)resetFunction:(NSArray *)dataList{
    
    for (ZYSideSlipFilterRegionModel *model in dataList) {
        //selectedStatus
        for (CommonItemModel *itemModel in model.itemList) {
            [itemModel setSelected:NO];
        }
        //selectedItem
        model.selectedItemList = nil;
    }
}
-(NSArray *)packageDataList:(NSMutableArray *)tittleArr{
    
    
    NSMutableArray *dataArray = [NSMutableArray array];
    for (NSString *title in tittleArr) {
        
    [dataArray addObject:[self commonFilterRegionModelWithKeyword:title selectionType:BrandTableViewCellSelectionTypeMultiple]];
    }
 
    return [dataArray mutableCopy];
}
- (ZYSideSlipFilterRegionModel *)commonFilterRegionModelWithKeyword:(NSString *)keyword selectionType:(CommonTableViewCellSelectionType)selectionType {
    
    ZYSideSlipFilterRegionModel *model = [[ZYSideSlipFilterRegionModel alloc] init];
    model.containerCellClass = @"sideFilterCell";
    model.regionTitle = keyword;
    model.customDict = @{REGION_SELECTION_TYPE:@(selectionType)};
    model.isShowAll = YES;
    model.itemList = @[[self createItemModelWithTitle:[NSString stringWithFormat:@"%@一", keyword] itemId:@"0000" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"%@二", keyword] itemId:@"0001" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"%@三", keyword] itemId:@"0002" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"%@四", keyword] itemId:@"0003" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"%@五", keyword] itemId:@"0004" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"%@六", keyword] itemId:@"0005" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"%@七", keyword] itemId:@"0006" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"%@八", keyword] itemId:@"0007" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"%@九", keyword] itemId:@"0008" selected:NO],
                       [self createItemModelWithTitle:[NSString stringWithFormat:@"%@十", keyword] itemId:@"0009" selected:NO]
                       ];
    return model;
}
- (CommonItemModel *)createItemModelWithTitle:(NSString *)itemTitle
                                       itemId:(NSString *)itemId
                                     selected:(BOOL)selected {
    CommonItemModel *model = [[CommonItemModel alloc] init];
    model.itemId = itemId;
    model.itemName = itemTitle;
    model.selected = selected;
    return model;
}
@end
