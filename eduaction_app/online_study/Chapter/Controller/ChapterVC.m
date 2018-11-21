//
//  ChapterVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/5.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ChapterVC.h"
#import "ChapterMainCollection.h"

#import "ChapterListVC.h"

@interface ChapterVC ()
@property (nonatomic, strong) ChapterMainCollection *collection_main;
@end

@implementation ChapterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setnavbg_defa];
    self.title = @"章节列表";
    
    [self.view addSubview:self.collection_main];
}
-(void)viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma --- view creat
- (ChapterMainCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 1.0;
        layout.minimumInteritemSpacing = 4.0;

        _collection_main = [[ChapterMainCollection alloc] initWithFrame:(CGRect){0, 0, ZTWidth, ZTHeight-NaviIPHONEX} collectionViewLayout:layout];
        _collection_main.backgroundColor = HexRGB(0xF1F0F0);
        
        @weakify(self)
        [_collection_main setBlockGoOn:^(NSIndexPath * _Nonnull indexPath) {
            @strongify(self)
            //跳转到对应的章节
            [self.navigationController pushViewController:[ChapterListVC new] animated:YES];
        }];
    }
    return _collection_main;
}
@end
