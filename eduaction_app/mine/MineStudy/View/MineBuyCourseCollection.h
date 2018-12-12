//
//  MineBuyCourseCollection.h
//  eduaction_app
//
//  Created by Mac on 2018/12/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineBuyCourseCollection : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) DataModel *data_model;
@property (nonatomic, copy) void (^blockGoOn)(NSIndexPath *indexPath);

@end

NS_ASSUME_NONNULL_END
