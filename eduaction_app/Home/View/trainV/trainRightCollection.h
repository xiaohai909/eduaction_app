//
//  trainRightCollection.h
//  eduaction_app
//
//  Created by legendlxd on 2018/11/19.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface trainRightCollection : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong)RACSubject *clickindex;
@end

NS_ASSUME_NONNULL_END
