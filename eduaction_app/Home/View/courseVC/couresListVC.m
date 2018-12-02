//
//  couresListVC.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/28.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "couresListVC.h"
#import "courseCalendarV.h"
@interface couresListVC ()
@property(nonatomic,strong)courseCalendarV *calendarV;
@end

@implementation couresListVC
-(courseCalendarV *)calendarV{
    if (!_calendarV) {
        
        _calendarV = [[courseCalendarV alloc]initWithFrame:CGRectMake(0, 0, ZTWidth, 5*Iphone6Scale(54)+48 +HeaderViewHeight)];
    }
    return _calendarV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self.view addSubview:self.calendarV];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [self setnavbg_defa];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
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
