//
//  MineUserCollection.h
//  eduaction_app
//
//  Created by Mac on 2018/11/27.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineUserCollection : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, copy) void (^blockGoOn)(NSIndexPath *indexPath);

@end

NS_ASSUME_NONNULL_END
