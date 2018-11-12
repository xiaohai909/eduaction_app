//
//  MyNav.m
//  LTExchangeRate
//
//  Created by legendlxd on 15/9/21.
//  Copyright © 2015年 administrator. All rights reserved.
//

#import "MyNav.h"

@implementation MyNav

-(void)viewDidLoad
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.delegate = self;
        self.delegate = self;
    }
    
    //标题颜色
    NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:18]};
    [self.navigationBar setTitleTextAttributes:dict];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if ( [self respondsToSelector:@selector(interactivePopGestureRecognizer)] &&animated == YES )
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    [super pushViewController:viewController animated:animated];
    
}
-(NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if( [self respondsToSelector:@selector(interactivePopGestureRecognizer)] ) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    return [super popToViewController:viewController animated:animated];
    
    
}

#pragma mark UINavigationControllerDelegate 
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animate {
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]&&self.ShouldNointeractivePopGestureRecognizer==NO) {
        
        self.interactivePopGestureRecognizer.enabled = YES;
//        DDLogVerbose(@"%@",[viewController description]);
        
//        if ([[viewController description] containsString:@"GWProjectVc"]) {
//             self.interactivePopGestureRecognizer.enabled = NO;
//        }
//        else
        if(self.interactivePopGestureRecognizer_NO){
            
             self.interactivePopGestureRecognizer.enabled = NO;

        }
    }
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    if ( [self respondsToSelector:@selector(interactivePopGestureRecognizer)] &&animated == YES )
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    return  [super popToRootViewControllerAnimated:animated];
    
}
-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    if ( [self respondsToSelector:@selector(interactivePopGestureRecognizer)] &&animated == YES )
    {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
    
    return  [super popViewControllerAnimated:animated];
}
- (UIStatusBarStyle)preferredStatusBarStyle

{
    
    return  self.topViewController.preferredStatusBarStyle;
    
}
- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
