//
//  AppDelegate.m
//  eduaction_app
//
//  Created by legendlxd on 2018/10/22.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [myNetworkManager sharemyNetworkManager];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [IQKeyboardManager sharedManager].enable = YES;
    [[LogManager sharedManager]config];
    //[IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    [self gologinView];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark 跳转到登录界面
-(void)gologinView{
    
    LoginViewController *cont = [[LoginViewController alloc]init];
    MyNav *nav = [[MyNav alloc]initWithRootViewController:cont];
    nav.navigationBarHidden = YES;
    [self.window setRootViewController:nav];
    
}
#pragma mark 进入首页
-(void)goTabarView
{
    
    
    MYtabarViewController * bar = [MYtabarViewController shareGWHomeViewController];
    MyNav * nav=[[MyNav alloc]initWithRootViewController:bar];
    self.window.rootViewController =  nav;
    
}
@end
