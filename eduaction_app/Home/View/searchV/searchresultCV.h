//
//  searchresultCV.h
//  eduaction_app
//
//  Created by legendlxd on 2018/11/7.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchResultH.h"
#import "HomenewsCell.h"
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, searchtype){
    forsearchtype,
    forrecommendtype,
};
@interface searchresultCV : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)NSArray *headtitile;
@property (nonatomic,assign)searchtype type;
@end

NS_ASSUME_NONNULL_END
