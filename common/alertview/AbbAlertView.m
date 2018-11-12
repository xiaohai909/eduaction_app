//
//  AbbAlertView.m
//  ABB
//
//  Created by orvibo on 14-4-16.
//  Copyright (c) 2014年 orvibo. All rights reserved.
//

#import "AbbAlertView.h"
@interface AbbAlertView ()
//@property (nonatomic ,strong)AbbLoadingView *loadingView;


@end
@implementation AbbAlertView
@synthesize finishBlock;
@synthesize failedBlock;
@synthesize finishStringBlock;
@synthesize popType;
//@synthesize loadingView;
-(void)dealloc
{
//    [loadingView release];
//    [finishStringBlock release];
//    [failedBlock release];
//    [finishBlock release];
//    [popView release];
//    [contentLabel release];
//    [super dealloc];
}

//-(void)stopLoading
//{
//    if (self.loadingView) {
//
//        [self.loadingView stop];
//    }
//}
//-(void)loading
//{
//    [self stopLoading];
//    self.loadingView = [AbbLoadingView playLoading];
//}

//- (void)alertTimeout:(NSString *)alert
//{
//    [self stopLoading];
//    [AppUtils showAlertView:alert delay:2.0];
//}
+(id)view
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
}

+(id)viewInNib:(NSString *)nibName
{
    return [[[NSBundle mainBundle]loadNibNamed:nibName owner:nil options:nil]lastObject];
}

+(id)showWithNib:(NSString *)nibName finishBlock:(void (^)(void))block
{
    AbbAlertView *abbAlert = [[self class] viewInNib:nibName];
    abbAlert.finishBlock = block;
    abbAlert.popType = NO;
    [abbAlert showInWindow];
    return abbAlert;
}

- (void)showInWindow
{
    UIWindow *shareWindow = [UIApplication sharedApplication].keyWindow;
    CGRect frame = self.bounds;
    frame.size = shareWindow.bounds.size;
    frame.origin.x = shareWindow.bounds.size.width;
    self.frame = frame;
    [shareWindow addSubview:self];
    
    frame.origin.x -= shareWindow.bounds.size.width;
    [UIView animateWithDuration:0.25 animations:^{
        
        self.frame = frame;
        
    }completion:^(BOOL finished) {
        
    }];
}

- (void)showDismiss
{
    CGRect frame = self.frame;
    frame.origin.x = self.superview.bounds.size.width;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.frame = frame;
        
    }completion:^(BOOL finished) {
        
        [super removeFromSuperview];
    }];
}
-(void)setAlertString:(NSString *)string
{
    CGSize size = contentLabel.bounds.size;
    CGFloat h = stringHeight(string, nil, size.width).height;
    if (h > size.height) {
        popView.frame = setHeight(popView, h + 40);
    }else{
        contentLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    if (UI_IS_IPHONE_X) {
        CGPoint center = screenCenter();
        center.y -= 44;
        popView.center = center;
    }
    else{
        CGPoint center = screenCenter();
        center.y -= 64;
        popView.center = center;
    }
    
    contentLabel.adjustsFontSizeToFitWidth = YES;
    
    contentLabel.text = string;
}
+ (id)popWithString:(NSString *)string afterDelay:(CGFloat)delay
{
    AbbAlertView *abbAlert = [[self class] viewInNib:@"AlertStringView"];
    abbAlert.popType = YES;
    [abbAlert setAlertString:string];
    [abbAlert popInWindow];
    [abbAlert performSelector:@selector(popDismiss) withObject:nil afterDelay:delay];
    return abbAlert;
}

-(void)setAlertString:(NSString *)string font:(UIFont *)font
{
    CGSize size = contentLabel.bounds.size;
    CGFloat h = stringHeight(string, font, size.width).height;
    if (h > size.height) {
        //contentLabel.textAlignment = UITextAlignmentLeft;
        popView.frame = setHeight(popView, popView.frame.size.height + h - size.height);
    }else{
        //contentLabel.textAlignment = UITextAlignmentCenter;
    }
    contentLabel.text = string;
}
-(void)setMarkAlertString:(NSString *)string
{
    CGSize size = contentLabel.bounds.size;
    CGFloat h = stringHeight(string, nil, size.width).height;
    if (h > size.height) {
        //contentLabel.textAlignment = UITextAlignmentLeft;
        popView.frame = setHeight(popView, h + 40);
    }else{
        //contentLabel.textAlignment = UITextAlignmentCenter;
    }
    contentLabel.text = string;
}
+ (id)popMarkString:(NSString *)string afterDelay:(CGFloat)delay
{
    if (string.length) {
        
        AbbAlertView *abbAlert = [[self class] viewInNib:@"AlertMarkStringView"];
        abbAlert.popType = YES;
        [abbAlert setMarkAlertString:string];
        [abbAlert popInWindow];
        [abbAlert performSelector:@selector(popDismiss) withObject:nil afterDelay:delay];
        return abbAlert;
    }
    return nil;
}
+ (id)popMarkString:(NSString *)string afterDelay:(CGFloat)delay finishBlock:(void (^)(void))block
{
    if (string.length) {
        
        AbbAlertView *abbAlert = [[self class] viewInNib:@"AlertMarkStringView"];
        abbAlert.popType = YES;
        abbAlert.finishBlock = block;
        [abbAlert setMarkAlertString:string];
        [abbAlert popInWindow];
        [abbAlert performSelector:@selector(popDismiss) withObject:nil afterDelay:delay];
        return abbAlert;
    }
    return nil;
}

+ (id)popWithString:(NSString *)string finishBlock:(void (^)(void))block
{
    if (string.length) {
        AbbAlertView *abbAlert = [[self class] viewInNib:@"AlertSelectView"];
        abbAlert.popType = YES;
        abbAlert.finishBlock = block;
        [abbAlert setAlertString:string font:[UIFont systemFontOfSize:17]];
        [abbAlert popInWindow];
        
        return abbAlert;
    }
    return nil;
}

+ (id)popConfirmWithString:(NSString *)string finishBlock:(void (^)(void))block
{
    if (string.length) {
        AbbAlertView *abbAlert = [[self class] viewInNib:@"AlertConfirmView"];
        abbAlert.popType = YES;
        abbAlert.finishBlock = block;
        [abbAlert setAlertString:string font:[UIFont systemFontOfSize:17]];
        [abbAlert popInWindow];
        
        return abbAlert;
    }
    return nil;
}

+ (id)popWithString:(NSString *)string afterDelay:(CGFloat)delay finishBlock:(void (^)(void))block
{
    AbbAlertView *abbAlert = [[self class] viewInNib:@"AlertStringView"];
    abbAlert.popType = YES;
    abbAlert.finishBlock = block;
    [abbAlert setAlertString:string];
    [abbAlert popInWindow];
    [abbAlert performSelector:@selector(popDismiss) withObject:nil afterDelay:delay];
    return abbAlert;
}

+(id)popWithFinishBlock:(void (^)(void))block
{
    AbbAlertView *abbAlert = [[self class] view];
    abbAlert.popType = YES;
    abbAlert.finishBlock = block;
    [abbAlert popInWindow];
    return abbAlert;
}

+(id)popWithFinishStringBlock:(void (^)(NSString * string))block
{
    AbbAlertView *abbAlert = [[self class] view];
    abbAlert.popType = YES;
    abbAlert.finishStringBlock = block;
    [abbAlert popInWindow];
    return abbAlert;
}

+(id)popWithFinishBlock:(void (^)(void))block failedBlock:(void (^)(void))failed
{
    AbbAlertView *abbAlert = [[self class] view];
    abbAlert.popType = YES;
    abbAlert.finishBlock = block;
    abbAlert.failedBlock = failed;
    [abbAlert popInWindow];
    return abbAlert;
}

+(id)popWithNib:(NSString *)nibName finishBlock:(void (^)(void))block
{
    AbbAlertView *abbAlert = [[self class] viewInNib:nibName];
    abbAlert.popType = YES;
    abbAlert.finishBlock = block;
    [abbAlert popInWindow];
    return abbAlert;
}

+ (id)popWithNib:(NSString *)nibName finishBlock:(void (^)(void))block failedBlock:(void (^)(void))failed
{
    AbbAlertView *abbAlert = [[self class] viewInNib:nibName];
    abbAlert.popType = YES;
    abbAlert.finishBlock = block;
    abbAlert.failedBlock = failed;
    [abbAlert popInWindow];
    return abbAlert;
}

+(id)popWithNib:(NSString *)nibName afterDelay:(CGFloat)delay
{
    AbbAlertView *abbAlert = [[self class] viewInNib:nibName];
    abbAlert.popType = YES;
    [abbAlert popInWindow];
    [abbAlert performSelector:@selector(remove) withObject:nil afterDelay:delay];
    return abbAlert;
}

+(id)popWithNib:(NSString *)nibName afterDelay:(CGFloat)delay finishBlock:(void (^)(void))block
{
    AbbAlertView *abbAlert = [[self class] viewInNib:nibName];
    abbAlert.finishBlock = block;
    abbAlert.popType = YES;
    [abbAlert popInWindow];
    [abbAlert performSelector:@selector(popDismiss) withObject:nil afterDelay:delay];
    return abbAlert;
}


-(void)popInWindow
{
    UIWindow *shareWindow = [UIApplication sharedApplication].keyWindow;
    
    self.frame = shareWindow.bounds;
    
    popView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [shareWindow addSubview:self];
    
    [UIView animateWithDuration:0.25 animations:^{
        popView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
}
- (void)popDismiss
{
    if (finishBlock) {
        finishBlock();
    }
    [self remove];
}
- (void)popNow
{
    if (finishBlock) {
        finishBlock();
    }
    [super removeFromSuperview];
}

-(void)remove
{
    [UIView animateWithDuration:0.25 animations:^{
        
        popView.transform = CGAffineTransformMakeScale(0.1, 0.1);
        popView.alpha = 0.0;
        self.alpha = 0.0;
    }completion:^(BOOL finished) {
        
        [super removeFromSuperview];
    }];
}



- (IBAction)confirm:(UIButton *)sender
{
    if (popType) {
        
        [self popDismiss];
    }
}

- (IBAction)cancel:(UIButton *)sender
{
    if (popType) {
        
        if (failedBlock) {
            failedBlock();
        }
        [self remove];
    }
    
}
CGSize stringHeight(NSString *string ,UIFont *font , CGFloat w)
{
    if (!font) {
        font = [UIFont systemFontOfSize:17.0];
    }
    CGFloat labelWidth = w;
    
    CGSize fSize = CGSizeMake(labelWidth,1000);
    
    CGSize size = [string boundingRectWithSize:fSize
                                       options: NSStringDrawingTruncatesLastVisibleLine
                   | NSStringDrawingUsesLineFragmentOrigin
                   | NSStringDrawingUsesFontLeading
                                    attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font.pointSize + 1]}
                                       context:nil].size;
    
    return size;
}
CGRect setHeight(UIView * view , CGFloat h)
{
    CGRect frame = view.frame;
    frame.size.height = h;
    return frame;
}
CGPoint screenCenter()
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    return CGPointMake(size.width / 2.0, size.height / 2.0);
}
id popAlert(NSString *alertString , int delay)
{
    UIWindow *shareWindow = [UIApplication sharedApplication].keyWindow;
    
    for (AbbAlertView *view in shareWindow.subviews) {
        if ([view isKindOfClass:[AbbAlertView class]]
                  &&(view.userInteractionEnabled == NO)){
            [view popNow];
        }
    }
    
    return [AbbAlertView popWithString:alertString afterDelay:delay];
}
@end

