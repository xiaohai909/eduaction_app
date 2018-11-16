//
//  MakeProblemSceneCVCell.h
//  eduaction_app
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MakeProblemMainCollection.h"
#import "MakeProblemToolView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MakeProblemSceneCVCell : UICollectionViewCell
@property (nonatomic, assign) BOOL isAutoReturn;//是否自动跳转
@property (nonatomic, assign) NSInteger addTextFont;//字体更改的倍数
@property (strong, nonatomic) MakeProblemMainCollection *collection_main;
@property (strong, nonatomic) MakeProblemToolView *view_bottom;
@property (nonatomic, copy) void (^blockGoOn)(UIButton *btn);

@end

NS_ASSUME_NONNULL_END
