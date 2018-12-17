//
//  ChapterCleanVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/28.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ChapterCleanVC.h"
#import "ChapterCleanView.h"

@interface ChapterCleanVC ()

@end

@implementation ChapterCleanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setnavbg_defa];
    self.title = @"清空答案";
    
    [self creatView];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)creatView
{
    ChapterCleanView *view = [ChapterCleanView instancetypeWithXib];
    view.frame = (CGRect){0,0,ZTWidth,ZTHeight-NaviIPHONEX};
    [view.btn_clean addTarget:self action:@selector(request) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:view];
}
#pragma mark --- request
- (void)request
{
    [SQNetworkInterface iRequestChapterCleanParames:@{@"userId":@"01"} andResult:^(NSInteger state, NSString * _Nonnull msg,NSString * _Nonnull total, id  _Nonnull resultData) {
        if (state == CODE_SUCCESS) {
            [self.navigationController popViewControllerAnimated:YES];
            if (self.blockClean) {
                self.blockClean();
            }
        }
    }];
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
