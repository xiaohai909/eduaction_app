//
//  MineMessageVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/27.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineMessageVC.h"
#import "MineMessageCollection.h"

@interface MineMessageVC ()
@property (nonatomic, strong) MineMessageCollection *collection_main;

@end

@implementation MineMessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self setnavbg_defa];
    self.title = @"消息";
    
    [self.view addSubview:self.collection_main];
}

- (MineMessageCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0.5;
        layout.minimumInteritemSpacing = 0.5;
        
        _collection_main = [[MineMessageCollection alloc] initWithFrame:(CGRect){0, 0, ZTWidth, ZTHeight-NaviIPHONEX} collectionViewLayout:layout];
        _collection_main.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _collection_main.showsVerticalScrollIndicator = NO;
        [_collection_main setBlockGoOn:^(NSIndexPath * _Nonnull indexPath) {
           //选择cell
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
