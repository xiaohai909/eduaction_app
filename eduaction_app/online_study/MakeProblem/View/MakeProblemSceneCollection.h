//
//  MakeProblemSceneCollection.h
//  eduaction_app
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MakeProblemMainCollection.h"
#import "MakeProblemPopView.h"
//一场练习

NS_ASSUME_NONNULL_BEGIN

@interface MakeProblemSceneCollection : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, assign) BOOL isAutoReturn;//是否自动跳转
@property (nonatomic, assign) NSInteger addTextFont;//字体更改的倍数
@property (nonatomic, assign) MakeProblemMode viewMode;//答题模式
@property (nonatomic, strong) NSNumber *currentPage;//

@property (nonatomic, assign) NSInteger total;
@property (nonatomic, strong) NSMutableArray *array_models;
@property (nonatomic, copy) void (^blockMakeProblem)(NSString *correct);
@property (nonatomic, copy) void (^blockRequestPage)(NSInteger row);


- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout andType:(MakeProblemMode)viewMode;

@end

NS_ASSUME_NONNULL_END
