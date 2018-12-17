//
//  ConsolidateNoteMainCollection.h
//  eduaction_app
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConsolidateMyWrongModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ConsolidateNoteMainCollection : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSMutableArray *array_models;//数据
@property (nonatomic, strong) NSMutableSet *set_choise;//选择的数组;

@property (nonatomic, copy) void (^blockAllChoise)(BOOL all);
@property (nonatomic, copy) void (^blockGoOn)(NSIndexPath *indexPath);
- (void)setCollectionModify:(BOOL)modify andAll:(BOOL)all;
@end

NS_ASSUME_NONNULL_END
