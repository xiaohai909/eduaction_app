//
//  ChapterCleanVC.h
//  eduaction_app
//
//  Created by Mac on 2018/11/28.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChapterCleanVC : BaseViewController
@property (nonatomic, copy) void (^blockClean)(void);
@end

NS_ASSUME_NONNULL_END
