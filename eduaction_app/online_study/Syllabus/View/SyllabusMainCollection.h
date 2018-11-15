//
//  SyllabusMainCollection.h
//  eduaction_app
//
//  Created by Mac on 2018/11/15.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SyllabusMainCollection : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSIndexPath *select_section;
@property (nonatomic, copy) void (^blockGoOn)(NSIndexPath *indexPath);

@end

NS_ASSUME_NONNULL_END
