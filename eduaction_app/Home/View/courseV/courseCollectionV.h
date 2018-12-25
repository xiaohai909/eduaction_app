//
//  courseCollectionV.h
//  eduaction_app
//
//  Created by legendlxd on 2018/12/23.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface courseCollectionV : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)RACSubject *clickCourse;
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout AndkechengTypeId:(NSInteger )kechengTypeId_temp Andkemu:(NSString *)kemuCode; 
@end

NS_ASSUME_NONNULL_END
