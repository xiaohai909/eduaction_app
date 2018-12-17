//
//  ConsolidateHotMainCollection.h
//  eduaction_app
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ConsolidateHotMainCollection : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSMutableArray *array_models;//数据



@end

NS_ASSUME_NONNULL_END
