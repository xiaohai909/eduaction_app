//
//  MakeProblemMainVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MakeProblemMainVC.h"
#import "MakeProblemMainCollection.h"

@interface MakeProblemMainVC ()
@property (nonatomic, strong) MakeProblemMainCollection *collection_main;
@property (nonatomic, strong) UIView *view_bottom;//底部工具栏

@end

@implementation MakeProblemMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_red"] forBarMetrics:UIBarMetricsDefault];
    self.title = @"做题类型";
    
    [self.view addSubview:self.collection_main];
    [self.view addSubview:self.view_bottom];
}
#pragma --- view creat
- (MakeProblemMainCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0.5;
        layout.minimumInteritemSpacing = 0.5;
        
        _collection_main = [[MakeProblemMainCollection alloc] initWithFrame:(CGRect){0, 0, ZTWidth,ZTHeight-NaviIPHONEX-41} collectionViewLayout:layout];
        _collection_main.backgroundColor = [UIColor whiteColor];
        
//        @weakify(self)
//        [_collection_main setBlockGoOn:^(NSIndexPath * _Nonnull indexPath) {
//            @strongify(self)
//            //跳转到做题
//            [self.navigationController pushViewController:[MakeProblemMainVC new] animated:YES];
//        }];
    }
    return _collection_main;
}
- (UIView *)view_bottom {
    if (!_view_bottom) {
        _view_bottom = [[UIView alloc] initWithFrame:(CGRect){0,self.collection_main.py_height+self.collection_main.py_y,ZTWidth,41}];
    }
    return _view_bottom;
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
