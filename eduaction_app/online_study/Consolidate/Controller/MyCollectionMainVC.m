//
//  MyCollectionMainVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/13.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MyCollectionMainVC.h"
#import "MyCollectionMainCollection.h"
#import "RechargeMainBottomView.h"

@interface MyCollectionMainVC ()
@property (nonatomic, strong) MyCollectionMainCollection *collection_main;
@property (nonatomic, strong) UIButton *btn_right;
@property (nonatomic, strong) RechargeMainBottomView *view_bottom;
@end

@implementation MyCollectionMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setnavbg_defa];
    self.btn_right = [self createNavigationLeftItem:NO andImage:@"" andTitle:@"编辑"];
    [self.btn_right setTitle:@"完成" forState:UIControlStateSelected];
    [[self.btn_right rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        self.btn_right.selected = !self.btn_right.selected;
        [self changeViewMode];
    }];
    
    self.title = @"我的收藏";
    [self.view addSubview:self.collection_main];
    [self.view addSubview:self.view_bottom];
    
    self.collection_main.array_models = [@[@"1",@"2",@"3",@"4",@"5"] mutableCopy];
    
}
#pragma --- view creat
- (MyCollectionMainCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 1.0;
        layout.minimumInteritemSpacing = 4.0;
        
        _collection_main = [[MyCollectionMainCollection alloc] initWithFrame:(CGRect){0, 0, ZTWidth, ZTHeight-NaviIPHONEX} collectionViewLayout:layout];
        _collection_main.backgroundColor = HexRGB(0xF1F0F0);
        @weakify(self)
        [_collection_main setBlockAllChoise:^(BOOL all) {
            @strongify(self)
            self.view_bottom.btn_left.selected = all;
        }];
    }
    return _collection_main;
}
- (RechargeMainBottomView *)view_bottom {
    if (!_view_bottom) {
        _view_bottom = [[RechargeMainBottomView alloc] initWithFrame:(CGRect){0,ZTHeight,ZTWidth,50} andViewType:BottomViewTypeCollection];
        
        @weakify(self)
        [_view_bottom setBlockActionClick:^(NSString * _Nonnull title) {
            @strongify(self)
            if ([title isEqualToString:@"取消"]) {
                self.btn_right.selected = NO;
                [self changeViewMode];
            }
            else if ([title isEqualToString:@"移除"]) {
                [self.collection_main.array_models removeObjectsInArray:self.collection_main.set_choise.allObjects];
                [self.collection_main reloadData];
            }
            else{
                [self.collection_main setCollectionModify:self.btn_right.selected andAll:self.view_bottom.btn_left.selected];
            }
        }];
    }
    return _view_bottom;
}
- (void)changeViewMode
{
    //修改collection的状态
    [self.collection_main setCollectionModify:self.btn_right.selected andAll:self.view_bottom.btn_left.selected];
    [self.collection_main reloadData];
    
    if (self.btn_right.selected) {
        [UIView animateWithDuration:0.3 animations:^{
            self.view_bottom.py_bottom = ZTHeight-NaviIPHONEX;
        }];
        self.collection_main.py_height = ZTHeight-NaviIPHONEX-self.view_bottom.py_height;
    }
    else{
        self.collection_main.py_height = ZTHeight-NaviIPHONEX;
        [UIView animateWithDuration:0.3 animations:^{
            self.view_bottom.py_y = ZTHeight;
        }];
    }
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
