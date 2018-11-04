//
//  SearchViewController.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/4.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchhotAndhisV.h"
@interface SearchViewController ()
@property(strong,nonatomic)MySearchBar *mySearchBar;
@property(strong,nonatomic)SearchhotAndhisV *hotView;
@property(strong,nonatomic)SearchhotAndhisV *hisSearchView;
@property(strong,nonatomic)SearchSecionV *hotSec;
@property(strong,nonatomic)SearchSecionV *hisSec;
@end

@implementation SearchViewController
-(SearchSecionV *)hotSec
{
    if (!_hotSec) {
        _hotSec =[SearchSecionV creatXib];
        _hotSec.frame = CGRectMake(0, NaviIPHONEX, ZTWidth, 44);
        _hotSec.titleV.text = @"热门搜索";
        _hotSec.actionBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
        
    }
    return _hotSec;
}
-(SearchSecionV *)hisSec
{
    if (!_hisSec) {
        _hisSec =[SearchSecionV creatXib];
        _hisSec.titleV.text = @"搜索记录";
        _hisSec.actionBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
        [_hisSec.actionBtn setImage:[UIImage imageNamed:@"search_btn_delete"] forState:UIControlStateNormal];
    }
    return _hisSec;
}
-(SearchhotAndhisV *)hotView
{
    if (!_hotView) {
        _hotView =[[SearchhotAndhisV alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.hotSec.frame)+5, ZTWidth, 100)];
        @weakify(self);
        [_hotView.LabClcik_action subscribeNext:^(id  _Nullable x) {
            
        }];
    }
    return _hotView;
}
-(SearchhotAndhisV *)hisSearchView
{
    if (!_hisSearchView) {
        _hisSearchView =[[SearchhotAndhisV alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.hisSec.frame)+5, ZTWidth, 100)];
        @weakify(self);
        [_hisSearchView.LabClcik_action subscribeNext:^(id  _Nullable x) {
            
        }];
    }
    return _hisSearchView;
}

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
    [self.view addSubview:self.hotSec];
    
    [self.view addSubview:self.hotView];
    [self.hotView setupView:@[@"Java奥术大师大大大大大大大少时诵诗书所大", @"Python", @"Objective-C", @"Swift", @"C", @"C++", @"PHP", @"C#", @"Perl", @"Go", @"JavaScript", @"R", @"Ruby", @"MATLAB"]];
    [self.view addSubview:self.hisSec];
    self.hisSec.frame = CGRectMake(0, CGRectGetMaxY(self.hotView.frame), ZTWidth, 44);
    [self.view addSubview:self.hisSearchView];
    [self.hisSearchView setupView:@[@"Java奥术大师大大大大大大大少时诵诗书所大", @"Python", @"Objective-C", @"Swift", @"C", @"C++", @"PHP", @"C#", @"Perl", @"Go", @"JavaScript", @"R", @"Ruby", @"MATLAB"]];
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
