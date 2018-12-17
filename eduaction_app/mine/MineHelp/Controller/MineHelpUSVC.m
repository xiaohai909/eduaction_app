//
//  MineHelpUSVC.m
//  eduaction_app
//
//  Created by Mac on 2018/12/12.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineHelpUSVC.h"

@interface MineHelpUSVC ()

@end

@implementation MineHelpUSVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self setnavbg_defa];
    self.title = @"关于我们";
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
