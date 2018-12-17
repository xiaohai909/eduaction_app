//
//  MakeProblemQuestionCardVC.h
//  eduaction_app
//
//  Created by Mac on 2018/11/8.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MakeProblemQuestionCardVC : BaseViewController
@property (nonatomic, strong) NSString *questionHouse;
@property (nonatomic, assign) NSInteger now_row;
//@property (nonatomic, strong) NSMutableArray *array_models;//数据
@property (nonatomic, copy) void (^blockGoOn)(NSIndexPath *indexPath);
@end

NS_ASSUME_NONNULL_END
