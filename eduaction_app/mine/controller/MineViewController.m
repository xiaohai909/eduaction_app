//
//  MineViewController.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/1.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
     [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)viewWillAppear:(BOOL)animated {
 
    
    //[self.navigationController setNavigationBarHidden:YES animated:NO];
    
    self.tabBarController.navigationItem.rightBarButtonItem =nil;
    self.tabBarController.navigationItem.titleView = nil;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
