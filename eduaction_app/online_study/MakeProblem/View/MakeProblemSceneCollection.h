//
//  MakeProblemSceneCollection.h
//  eduaction_app
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MakeProblemMainCollection.h"
//一场练习

NS_ASSUME_NONNULL_BEGIN

@interface MakeProblemSceneCollection : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, assign) MakeProblemMode viewMode;//答题模式
@property (nonatomic, strong) NSNumber *currentPage;//


- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout andType:(MakeProblemMode)viewMode;

@end

NS_ASSUME_NONNULL_END
