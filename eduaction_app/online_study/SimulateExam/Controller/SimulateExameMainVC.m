//
//  SimulateExameMainVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/8.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "SimulateExameMainVC.h"
#import "SimulateExameMainCollection.h"

#import "MakeProblemMainVC.h"

@interface SimulateExameMainVC ()
@property (nonatomic, strong) SimulateExameMainCollection *collection_main;
@end

@implementation SimulateExameMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setnavbg_defa];
    self.title = @"模拟考场";
    
    [self.view addSubview:self.collection_main];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
#pragma --- view creat
- (SimulateExameMainCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 1.0;
        layout.minimumInteritemSpacing = 4.0;
        
        _collection_main = [[SimulateExameMainCollection alloc] initWithFrame:(CGRect){0, 0, ZTWidth, ZTHeight-NaviIPHONEX} collectionViewLayout:layout];
        _collection_main.backgroundColor = HexRGB(0xF1F0F0);
        
        @weakify(self)
        [_collection_main setBlockGoOn:^(NSIndexPath * _Nonnull indexPath) {
            @strongify(self)
            //跳转到对应的考试
            MakeProblemMainVC *vc = [MakeProblemMainVC new];
            [vc setMode:MakeProblemMainModeSimulateExam andShowMode:MakeProblemModeExam];
            [self.navigationController pushViewController:vc animated:YES];
        }];
    }
    return _collection_main;
}

@end
