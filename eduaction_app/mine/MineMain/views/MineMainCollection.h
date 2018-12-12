//
//  MineMainCollection.h
//  eduaction_app
//
//  Created by Mac on 2018/11/26.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineMainCollection : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSMutableDictionary *dic_title;
@property (nonatomic, strong) NSArray *arr_title;
@property (nonatomic, copy) void (^blockGoOn)(NSString *title);

@end

NS_ASSUME_NONNULL_END
