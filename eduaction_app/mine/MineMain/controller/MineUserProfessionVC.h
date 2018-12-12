//
//  MineUserProfessionVC.h
//  eduaction_app
//
//  Created by Mac on 2018/12/11.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MineUserProfessionVC : BaseViewController
@property (nonatomic, copy) void (^blockGoOn)(NSIndexPath *indexPath);

@end

NS_ASSUME_NONNULL_END
