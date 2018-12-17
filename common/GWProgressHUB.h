//
//  GWProgressHUB.h
//  ZTCallLinPhone
//
//  Created by MacBook on 2017/7/25.
//  Copyright © 2017 ABB Genway Xiamen Electrical Equipment Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWProgressHUB : NSObject

/**
 HUB函数库
 
 @return <#return value description#>
 */
+(GWProgressHUB *)sharedYGGWProgressHUB;

/**
 HUB显示

 @param hubVc <#hubVc description#>
 */
-(void)YGShowHUB:(UIView *)hubVc;

/**
HUB 消失
 */
-(void)YGDismiss:(UIView *)hubVc;

/**
 HUB显示（自定义文字）

 @param hubVc <#hubVc description#>
 @param message <#message description#>
 */
//-(void)YGShowHUB:(UIView *)hubVc AndMsg:(NSString *)message;

-(MBProgressHUD *)YGShowHUB_WithReturn:(UIView *)hubVc AndMsg:(NSString *)message;
-(void)YGShowHUB:(UIView *)hubVc AndMsg:(NSString *)message AndUserinterface:(BOOL)userinterface;

-(void)YGShowHUB_result:(UIView *)hubVc Andmsg:(NSString *)msg;













@end
