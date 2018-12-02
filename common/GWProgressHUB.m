//
//  GWProgressHUB.m
//  ZTCallLinPhone
//
//  Created by MacBook on 2017/7/25.
//  Copyright © 2017 ABB Genway Xiamen Electrical Equipment Co., Ltd. All rights reserved.
//

#import "GWProgressHUB.h"


@implementation GWProgressHUB

+(GWProgressHUB *)sharedYGGWProgressHUB
{
    static GWProgressHUB * public = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (public == nil)
        {
            public = [GWProgressHUB new];
        }
    });
    return public;

}
-(void)YGShowHUB_result:(UIView *)hubVc Andmsg:(NSString *)msg
{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:hubVc animated:YES];
    hud.label.text = msg;
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
//    UIImage *image = [[UIImage imageNamed:@"toast_loading"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
//    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
//    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
//    anima.toValue = @(M_PI*2);
//    anima.duration = 1.0f;
//    anima.repeatCount = 1000.0f;
//    [imgView.layer addAnimation:anima forKey:nil];
   // hud.customView = imgView;
    
    hud.bezelView.color = [UIColor colorWithWhite:0.0 alpha:1];
    //文字颜色
    hud.contentColor = [UIColor whiteColor];
    
    hud.animationType = MBProgressHUDAnimationFade;
    [hud hideAnimated:YES afterDelay:1];
    
}
-(void)YGShowHUB:(UIView *)hubVc
{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:hubVc animated:YES];
    hud.label.text = @"加载中……";
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [[UIImage imageNamed:@"toast_loading"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima.toValue = @(M_PI*2);
    anima.duration = 1.0f;
    anima.repeatCount = 1000.0f;
    [imgView.layer addAnimation:anima forKey:nil];
    hud.customView = imgView;
    
    hud.bezelView.color = [UIColor colorWithWhite:0.0 alpha:1];
    //文字颜色
    hud.contentColor = [UIColor whiteColor];
    hud.animationType = MBProgressHUDAnimationFade;
}
-(void)YGShowHUB:(UIView *)hubVc AndMsg:(NSString *)message AndUserinterface:(BOOL)userinterface
{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:hubVc animated:YES];
    hud.label.text = message;
    hud.mode = MBProgressHUDModeCustomView;
    
    if (userinterface) {
        hud.userInteractionEnabled = NO;
    }
    
    UIImage *image = [[UIImage imageNamed:@"toast_loading"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima.toValue = @(M_PI*2);
    anima.duration = 1.0f;
    anima.repeatCount = MAXFLOAT;
    [imgView.layer addAnimation:anima forKey:nil];
    hud.customView = imgView;
    hud.bezelView.color = [UIColor colorWithWhite:0.0 alpha:1];
    //文字颜色
    hud.contentColor = [UIColor whiteColor];
    hud.animationType = MBProgressHUDAnimationFade;
}
-(MBProgressHUD *)YGShowHUB_WithReturn:(UIView *)hubVc AndMsg:(NSString *)message
{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:hubVc animated:YES];
    hud.label.text = message;
    hud.mode = MBProgressHUDModeCustomView;
    hud.userInteractionEnabled = YES;
    UIImage *image = [[UIImage imageNamed:@"toast_loading"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima.toValue = @(M_PI*2);
    anima.duration = 1.0f;
    anima.repeatCount = MAXFLOAT;
    [imgView.layer addAnimation:anima forKey:nil];
    hud.customView = imgView;
    hud.bezelView.color = [UIColor colorWithWhite:0.0 alpha:1];
    //文字颜色
    hud.contentColor = [UIColor whiteColor];
    hud.animationType = MBProgressHUDAnimationFade;
    
    return hud;
}
-(void)YGDismiss:(UIView *)hubVc
{
    
    [MBProgressHUD hideHUDForView:hubVc animated:YES];
}







@end
