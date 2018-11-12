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
@property (strong, nonatomic) MakeProblemMainCollection *collection_main;
@property (strong, nonatomic) MakeProblemToolView *view_bottom;
@property (nonatomic, copy) void (^blockGoOn)(UIButton *btn);

@end

NS_ASSUME_NONNULL_END
