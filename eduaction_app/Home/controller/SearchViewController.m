//
//  SearchViewController.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/4.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchhotAndhisV.h"
#import "Searchkey.h"
#import "searchresultCV.h"
#import "MainCollectionFowLayout.h"
@interface SearchViewController ()
@property(strong,nonatomic)MySearchBar *mySearchBar;
@property(strong,nonatomic)SearchhotAndhisV *hotView;
@property(strong,nonatomic)SearchhotAndhisV *hisSearchView;
@property(strong,nonatomic)SearchSecionV *hotSec;
@property(strong,nonatomic)SearchSecionV *hisSec;
@property(strong,nonatomic)searchresultCV *resultV;
@end

@implementation SearchViewController
-(searchresultCV *)resultV
{
    if (!_resultV) {
    MainCollectionFowLayout * layout = [[MainCollectionFowLayout alloc]init];
    
    _resultV = [[searchresultCV alloc]initWithFrame:CGRectMake(0, NaviIPHONEX, ZTWidth, ZTHeight-NaviIPHONEX) collectionViewLayout:layout];
    _resultV.headtitile = @[@"文章",@"课程"];
    _resultV.showsVerticalScrollIndicator = NO;
    _resultV.backgroundColor = [UIColor whiteColor];
    _resultV.hidden = YES;

    }
    return _resultV;
}
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
        _hisSec.actionBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
        [_hisSec.actionBtn setImage:[UIImage imageNamed:@"search_btn_delete"] forState:UIControlStateNormal];
        [_hisSec.actionBtn setTitle:@"清除记录" forState:UIControlStateNormal];
        [[_hisSec.actionBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [[Searchkey defaultcache]removeObjectForKey:searchkey];
                [self.hisSearchView refreshview:@[]];
            });
            
            
        }];
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
            
            @strongify(self);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.mySearchBar setText:x];
                self.mySearchBar.CancelBtn.selected= NO;
                [self ClickCancelBtn:self.mySearchBar.CancelBtn];
            });
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
    if ([[Searchkey defaultcache] objectForKey:searchkey] != nil) {
        
        NSArray *arr =(NSArray *) [[Searchkey defaultcache] objectForKey:searchkey];
        [self.hisSearchView setupView:arr];
    }
    [self.view addSubview:self.resultV];
    
   
    // Do any additional setup after loading the view.
}
-(void)ClickBackBtn:(UIButton *)btn{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark 开始搜索
-(void)ClickCancelBtn:(UIButton *)btn{
    DDLogVerbose(@"开始搜索 == %@",self.mySearchBar.text);
    if (btn.selected == YES) {
        self.resultV.hidden = YES;
        [self.mySearchBar resignFirstResponder];
    }
    else{
    if (self.mySearchBar.text.length == 0) {
        
        popAlert(@"关键字不能为空",1);
        return;
    }
    [self.mySearchBar resignFirstResponder];
    
    if ([[Searchkey defaultcache] objectForKey:searchkey] != nil) {
        
        NSArray *arr =(NSArray *) [[Searchkey defaultcache] objectForKey:searchkey];
        NSMutableSet *temp_arr = [[NSMutableSet alloc]initWithArray:arr];
        if (![[temp_arr allObjects] containsObject:self.mySearchBar.text]) {
            
            [temp_arr addObject:self.mySearchBar.text];
            @weakify(self);
            [[Searchkey defaultcache] setObject:[temp_arr allObjects] forKey:searchkey withBlock:^{
                @strongify(self);
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.hisSearchView refreshview:[temp_arr allObjects]];
                });
            }];
        }
        
       
       
    }
    else{
        NSMutableSet *temp_arr = [[NSMutableSet alloc]init];
        [temp_arr addObject:self.mySearchBar.text];
        @weakify(self);
        [[Searchkey defaultcache] setObject:[temp_arr allObjects] forKey:searchkey withBlock:^{
            @strongify(self);
            dispatch_async(dispatch_get_main_queue(), ^{
            [self.hisSearchView refreshview:[temp_arr allObjects]];
            });
        }];
    }

    _resultV.hidden = NO;
    }
    
 
}
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    return YES;
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    if (searchBar.text.length == 0) {
        
        self.mySearchBar.CancelBtn.selected = YES;
    }
    else if (searchBar.text.length > 0){
        
        self.mySearchBar.CancelBtn.selected = NO;
    }
    
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    DDLogVerbose(@"%@",searchBar.text);
    if (searchBar.text.length == 0) {
        
        self.mySearchBar.CancelBtn.selected = YES;
        
    }
    else if (searchBar.text.length > 0){
        
        self.mySearchBar.CancelBtn.selected = NO;
    }
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
     [self ClickCancelBtn:self.mySearchBar.CancelBtn];
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
