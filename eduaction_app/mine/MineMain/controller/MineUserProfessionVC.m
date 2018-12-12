//
//  MineUserProfessionVC.m
//  eduaction_app
//
//  Created by Mac on 2018/12/11.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineUserProfessionVC.h"
#import "MineUserProfessionCollection.h"

@interface MineUserProfessionVC ()
@property (nonatomic, strong) MineUserProfessionCollection *collection_main;
@end

@implementation MineUserProfessionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self setnavbg_defa];
    self.title = @"职业";
    
    [self.view addSubview:self.collection_main];
}

- (MineUserProfessionCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0.5;
        layout.minimumInteritemSpacing = 0.5;
        
        _collection_main = [[MineUserProfessionCollection alloc] initWithFrame:(CGRect){0, 0, ZTWidth, ZTHeight-NaviIPHONEX} collectionViewLayout:layout];
        _collection_main.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _collection_main.showsVerticalScrollIndicator = NO;
        @weakify(self)
        [_collection_main setBlockGoOn:^(NSIndexPath * _Nonnull indexPath) {
            @strongify(self)
            if (self.blockGoOn) {
                self.blockGoOn(indexPath);
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
