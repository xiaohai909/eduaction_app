//
//  MyNav.h
//  LTExchangeRate
//
//  Created by legendlxd on 15/9/21.
//  Copyright © 2015年 administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyNav : UINavigationController<UIGestureRecognizerDelegate,UINavigationControllerDelegate>
@property (nonatomic,assign)BOOL ShouldNointeractivePopGestureRecognizer;
@property (nonatomic,assign)BOOL interactivePopGestureRecognizer_NO;
@end
