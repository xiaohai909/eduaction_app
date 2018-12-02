//
//  BaseViewController.h
//  eduaction_app
//
//  Created by legendlxd on 2018/10/22.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
#define  XFAdjustsScrollViewInsets(scrollView)\
do {\
_Pragma("clang diagnostic push")\
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")\
if ([scrollView respondsToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
NSMethodSignature *signature = [UIScrollView instanceMethodSignatureForSelector:@selector(setContentInsetAdjustmentBehavior:)];\
NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];\
NSInteger argument = 2;\
invocation.target = scrollView;\
invocation.selector = @selector(setContentInsetAdjustmentBehavior:);\
[invocation setArgument:&argument atIndex:2];\
[invocation retainArguments];\
[invocation invoke];\
}\
_Pragma("clang diagnostic pop")\
} while (0)
@interface BaseViewController : UIViewController
@property (nonatomic,strong)UIButton *rightBtn;
@property (nonatomic,strong)UIButton *leftBtn;
@property (nonatomic,strong)RACDisposable *leftDis;
-(void)setnavbg_defa;
-(void)setnav_BackBtn;
- (UIButton *)createNavigationLeftItem:(BOOL)isLeft andImage:(NSString *)imageName andTitle:(NSString *)title;
-(void)setRigthbtn_inNav:(UIImage *)image andtitle:(NSString *)titile;
-(void)rightAction:(UIButton *)sender;
-(void)setNavTitle:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
