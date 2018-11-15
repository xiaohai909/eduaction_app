//
//  SQSearchView.m
//  eduaction_app
//
//  Created by Mac on 2018/11/15.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "SQSearchView.h"

@implementation SQSearchView

+ (SQSearchView *)creatSearchViewHot:(NSArray *)hotArray andHistory:(NSArray *)historyArray
{
    static SQSearchView *searchView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        searchView = [[SQSearchView alloc] initWithFrame:(CGRect){0, 0, ZTWidth, ZTHeight}];
        searchView.backgroundColor = [UIColor whiteColor];
        
        searchView.bar = [SQSearchBar creatSearchBar];
        [searchView addSubview:searchView.bar];
        [[searchView.bar.leftBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [searchView.superview removeFromSuperview];
            [searchView removeFromSuperview];
        }];
        [searchView.bar setBlockGoOn:^(NSString * _Nonnull keyValue) {
            [searchView.superview removeFromSuperview];
            [searchView removeFromSuperview];
            if (searchView.blockGoOn) {
                searchView.blockGoOn(keyValue);
            }
        }];
        
        searchView.collection_main = [SearchCollection creatSearchView:(CGRect){0, NaviIPHONEX, ZTWidth, ZTHeight-NaviIPHONEX} andHot:hotArray andHistory:historyArray];
        [searchView addSubview:searchView.collection_main];
        [searchView.collection_main setBlockGoOn:^(NSString * _Nonnull keyValue) {
            [searchView.superview removeFromSuperview];
            [searchView removeFromSuperview];
            if (searchView.blockGoOn) {
                searchView.blockGoOn(keyValue);
            }
        }];
    });
    [searchView.bar.textField becomeFirstResponder];
    return searchView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
