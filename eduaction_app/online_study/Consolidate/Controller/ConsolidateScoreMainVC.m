//
//  ConsolidateScoreMainVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ConsolidateScoreMainVC.h"
#import "ConsolidateScoreLineView.h"

@interface ConsolidateScoreMainVC ()
@property (nonatomic, strong) ConsolidateScoreLineView *view_main;
@end

@implementation ConsolidateScoreMainVC
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setnavbg_defa];
    self.title = @"我的成绩";
    
    self.view_main = [[ConsolidateScoreLineView alloc] initWithFrame:(CGRect){0,0,ZTWidth,260}];
    [self.view_main creatBezierPathViewWithNumbers:@[@"300",@"200",@"500",@"600",@"800",@"500"]];
    [self.view addSubview:self.view_main];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
@end
