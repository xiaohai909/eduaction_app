//
//  MineViewController.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/1.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "MineViewController.h"
#import "MineMainCollection.h"
#import "MineMainCRView.h"

#import "MineUserVC.h"
#import "MineMessageVC.h"

#import "MineHistoryVC.h"
#import "MineBuyCourseVC.h"
#import "MineTodayCourseVC.h"
#import "MineCollectionVC.h"
#import "MineToolExchangeVC.h"
#import "MineHelpSetVC.h"

@interface MineViewController ()
{
    BOOL firstIn;
}
@property (nonatomic, strong) MineMainCollection *collection_main;
@property (nonatomic, strong) MineMainCRView *headView;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    firstIn = YES;
    [self.view addSubview:self.headView];
    [self.view addSubview:self.collection_main];
    @weakify(self);
    [[[[noticeSubjectmanager sharenoticeSubjectmanager] shouldTabar_jump] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        self->firstIn = YES;
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.rightBarButtonItem =nil;
    self.tabBarController.navigationItem.titleView = nil;
    if (firstIn) {
        firstIn = NO;
    }
    else{
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (MineMainCRView *)headView
{
    if (!_headView) {
        _headView = [MineMainCRView instancetypeWithXib];
        _headView.frame = (CGRect){0,UI_IS_IPHONE_X?-24:-20,ZTWidth,UI_IS_IPHONE_X?136+44+24:136+44};
        
        [[_headView.btn_head rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [self.navigationController pushViewController:[MineUserVC new] animated:YES];
        }];
        [[_headView.btn_message rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [self.navigationController pushViewController:[MineMessageVC new] animated:YES];
        }];
    }
    return _headView;
}
- (MineMainCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0.5;
        layout.minimumInteritemSpacing = 0.5;
        
        _collection_main = [[MineMainCollection alloc] initWithFrame:(CGRect){0, self.headView.py_bottom, ZTWidth, ZTHeight-TabIPHONEX-self.headView.py_bottom} collectionViewLayout:layout];
//        _collection_main = [[MineMainCollection alloc] initWithFrame:(CGRect){0, UI_IS_IPHONE_X?0:-20, ZTWidth, UI_IS_IPHONE_X?ZTHeight-TabIPHONEX:ZTHeight-TabIPHONEX+20} collectionViewLayout:layout];
        _collection_main.backgroundColor = [UIColor whiteColor];
        _collection_main.showsVerticalScrollIndicator =NO;
        //跳转动作
        @weakify(self)
        [_collection_main setBlockGoOn:^(NSString * _Nonnull title) {
            @strongify(self)
            if ([title isEqualToString:@"历史记录"]) {
                [self.navigationController pushViewController:[MineHistoryVC new] animated:YES];
            }
            else if ([title isEqualToString:@"已购课程"]){
                [self.navigationController pushViewController:[MineBuyCourseVC new] animated:YES];
            }
            else if ([title isEqualToString:@"今日课程"]) {
                [self.navigationController pushViewController:[MineTodayCourseVC new] animated:YES];
            }
            else if ([title isEqualToString:@"我的收藏"]) {
                [self.navigationController pushViewController:[MineCollectionVC new] animated:YES];
            }
            else if ([title isEqualToString:@"兑换中心"]) {
                [self.navigationController pushViewController:[MineToolExchangeVC new] animated:YES];
            }
            else if ([title isEqualToString:@"在线客服"]) {
                [self.navigationController pushViewController:[MineTodayCourseVC new] animated:YES];
            }
            else if ([title isEqualToString:@"设置"]) {
                [self.navigationController pushViewController:[MineHelpSetVC new] animated:YES];
            }
        }];
    }
    return _collection_main;
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
