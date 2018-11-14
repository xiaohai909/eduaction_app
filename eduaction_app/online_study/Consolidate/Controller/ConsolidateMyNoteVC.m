//
//  ConsolidateMyNoteVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ConsolidateMyNoteVC.h"
#import "ConsolidateNoteMainCollection.h"

@interface ConsolidateMyNoteVC ()
@property (nonatomic, strong) ConsolidateNoteMainCollection *collection_main;
@end

@implementation ConsolidateMyNoteVC
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setnavbg_defa];
    self.title = @"我的笔记";
    [self.view addSubview:self.collection_main];
    
    self.collection_main.array_models = [@[@"1",@"2",@"3",@"4",@"5",@"1",@"2",@"3",@"4",@"5",@"1",@"2",@"3",@"4",@"5"] mutableCopy];
}
#pragma --- view creat
- (ConsolidateNoteMainCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0.0;
        layout.minimumInteritemSpacing = 4.0;
        
        _collection_main = [[ConsolidateNoteMainCollection alloc] initWithFrame:(CGRect){0, 0, ZTWidth, ZTHeight-NaviIPHONEX} collectionViewLayout:layout];
        _collection_main.backgroundColor = HexRGB(0xF1F0F0);
        //        @weakify(self)
        //        [_collection_main setBlockAllChoise:^(BOOL all) {
        //            @strongify(self)
        //            self.view_bottom.btn_left.selected = all;
        //        }];
    }
    return _collection_main;
}

@end
