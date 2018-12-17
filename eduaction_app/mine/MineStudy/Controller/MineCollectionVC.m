//
//  MineCollectionVC.m
//  eduaction_app
//
//  Created by Mac on 2018/12/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineCollectionVC.h"
#import "MoreTypeScrollView.h"

@interface MineCollectionVC ()
@property (nonatomic, strong) MoreTypeScrollView *view_head;
@property (nonatomic, strong) UIScrollView *scroll_main;
@end

@implementation MineCollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self setnavbg_defa];
    self.title = @"我的收藏";
    
    [self.view addSubview:self.view_head];
}
#pragma mark --- creat
- (MoreTypeScrollView *)view_head
{
    if (!_view_head) {
        _view_head = [[MoreTypeScrollView alloc] initWithFrame:(CGRect){0,0,ZTWidth,50}];
        [_view_head creatTypeWithArray:@[@"课程",@"文章"]];
        [_view_head btnAction:_view_head.array_btns[0]];
        
        [_view_head setBlockClick:^(NSInteger tag) {
           //切换
        }];
    }
    return _view_head;
}
- (UIScrollView *)scroll_main
{
    if (!_scroll_main) {
        _scroll_main = [[UIScrollView alloc] initWithFrame:(CGRect){0,self.view_head.py_height,ZTWidth,ZTHeight-NaviIPHONEX-self.view_head.py_height}];
        _scroll_main.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _scroll_main.contentSize = CGSizeMake(ZTWidth*2, ZTHeight-NaviIPHONEX);
        _scroll_main.scrollEnabled = NO;
    }
    return _scroll_main;
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
