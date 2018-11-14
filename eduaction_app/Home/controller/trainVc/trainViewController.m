//
//  trainViewController.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/7.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "trainViewController.h"

@interface trainViewController ()

@end

@implementation trainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setnav_BackBtn];
  
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
   
    [super viewWillAppear:animated];
    [self setnavbg_defa];
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
