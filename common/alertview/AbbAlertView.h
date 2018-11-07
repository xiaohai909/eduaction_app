//
//  AbbAlertView.h
//  ABB
//
//  Created by orvibo on 14-4-16.
//  Copyright (c) 2014年 orvibo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AlertBlock)(void);
typedef void (^AlertStringBlock)(NSString *string);

@interface AbbAlertView : UIControl
{
@public
    IBOutlet UIView *popView;
    IBOutlet UILabel *contentLabel;
}

@property (nonatomic, copy) AlertBlock failedBlock;
@property (nonatomic, copy) AlertBlock finishBlock;
@property (nonatomic, copy) AlertStringBlock finishStringBlock;
@property (nonatomic, assign) BOOL popType;
@property (nonatomic, assign) BOOL mShowInCenter;
// 弹出
+ (id)popWithString:(NSString *)string afterDelay:(CGFloat)delay;
+ (id)popMarkString:(NSString *)string afterDelay:(CGFloat)delay;
//+ (id)popMarkString:(NSString *)string afterDelay:(CGFloat)delay finishBlock:(void (^)(void))block;
+ (id)popWithString:(NSString *)string finishBlock:(void (^)(void))block;

+ (id)popConfirmWithString:(NSString *)string finishBlock:(void (^)(void))block;

+ (id)popWithString:(NSString *)string afterDelay:(CGFloat)delay finishBlock:(void (^)(void))block;
//+ (id)popWithString:(NSString *)string finishBlock:(void (^)(void))block failedBlock:(void (^)(void))failed;

+ (id)popWithFinishBlock:(void (^)(void))block;
+ (id)popWithFinishBlock:(void (^)(void))block failedBlock:(void (^)(void))failed;

+ (id)popWithNib:(NSString *)nibName finishBlock:(void (^)(void))block;
+ (id)popWithNib:(NSString *)nibName finishBlock:(void (^)(void))block failedBlock:(void (^)(void))failed;
+ (id)popWithNib:(NSString *)nibName afterDelay:(CGFloat)delay;
+ (id)popWithNib:(NSString *)nibName afterDelay:(CGFloat)delay finishBlock:(void (^)(void))block;

+(id)popWithFinishStringBlock:(void (^)(NSString * string))block;
// 从右滑动到左
+ (id)showWithNib:(NSString *)nibName finishBlock:(void (^)(void))block;

- (void)showDismiss;
- (void)popDismiss;
- (void)popNow;
- (IBAction)cancel:(UIButton *)sender;
- (IBAction)confirm:(UIButton *)sender;

-(void)stopLoading;
-(void)loading;
- (void)alertTimeout:(NSString *)alert;
id popAlert(NSString *alertString , int delay);
@end

