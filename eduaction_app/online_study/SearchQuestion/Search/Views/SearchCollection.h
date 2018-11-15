//
//  SearchCollection.h
//  eduaction_app
//
//  Created by Mac on 2018/11/15.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface SearchCollection : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSMutableArray *array_hot,*array_history,*array_result;;
@property (nonatomic, assign) BOOL justShow;//只是展示，还是已经在搜索了，已经搜索那就显示搜索关键字相连的关键字
@property (nonatomic, copy) void (^blockGoOn)(NSString *keyValue);
@property (nonatomic, copy) void (^blockClean)();
@property (nonatomic, copy) void (^blockChange)();


+ (SearchCollection *)creatSearchView:(CGRect)frame andHot:(NSArray *)hotArray andHistory:(NSArray *)historyArray;
@end








NS_ASSUME_NONNULL_END
