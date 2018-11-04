//
//  SearchViewController.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/4.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
@property(strong,nonatomic)MySearchBar *mySearchBar;
@end

@implementation SearchViewController
-(MySearchBar *)mySearchBar{
    if (!_mySearchBar) {
        
        _mySearchBar = [[MySearchBar alloc]initWithFrame:CGRectMake(0, 0, ZTWidth, NaviIPHONEX)];
        
        _mySearchBar.delegate = self;
        _mySearchBar.Mydelaget=self;

        _mySearchBar.backgroundColor =HexRGB(0xFF6B6B);
        _mySearchBar.isKindSearch=YES;
        
        
        
        
        
        
        
        for (UIView *view in _mySearchBar.subviews) {
            // for before iOS7.0
            if ([view isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                [view removeFromSuperview];
                break;
            }
            // for later iOS7.0(include)
            if ([view isKindOfClass:NSClassFromString(@"UIView")] && view.subviews.count > 0) {
                [[view.subviews objectAtIndex:0] removeFromSuperview];
                break;
            }
        }
        
    }
    return _mySearchBar;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.mySearchBar];
    
    // Do any additional setup after loading the view.
}
-(void)ClickBackBtn:(UIButton *)btn{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark 开始搜索
-(void)ClickCancelBtn:(UIButton *)btn{
    
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
