//
//  MineBuyCourseVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/27.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineBuyCourseVC.h"
#import "MineBuyCourseCollection.h"

@interface MineBuyCourseVC ()
@property (nonatomic, strong) MineBuyCourseCollection *collection_main;

@end

@implementation MineBuyCourseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self setnavbg_defa];
    self.title = @"已购课程";
    
    [self.view addSubview:self.collection_main];
}
#pragma --- view creat
- (MineBuyCourseCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 1.0;
        layout.minimumInteritemSpacing = 4.0;
        
        _collection_main = [[MineBuyCourseCollection alloc] initWithFrame:(CGRect){0, 0, ZTWidth, ZTHeight-NaviIPHONEX} collectionViewLayout:layout];
        _collection_main.backgroundColor = HexRGB(0xF1F0F0);
        
//        @weakify(self)
        [_collection_main setBlockGoOn:^(NSIndexPath * _Nonnull indexPath) {
//            @strongify(self)
            //跳转到对应的课程
        }];
        
        //数据
        [_collection_main setupHeaderRefresh:^{

        }];
        [_collection_main setupHeaderRefresh:^{
            
        }];
        
        _collection_main.data_model = [DataModel new];
        [_collection_main.data_model.result addObjectsFromArray:@[@"",@"",@"",@""]];
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
