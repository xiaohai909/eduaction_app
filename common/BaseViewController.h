//
//  BaseViewController.h
//  eduaction_app
//
//  Created by legendlxd on 2018/10/22.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
-(void)setnavbg_defa;
- (UIButton *)createNavigationLeftItem:(BOOL)isLeft andImage:(NSString *)imageName andTitle:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
