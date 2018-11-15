//
//  SyllabusMainVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/15.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "SyllabusMainVC.h"
#import "SyllabusMainCollection.h"
#import "SyllabusMainPopView.h"

@interface SyllabusMainVC ()
@property (nonatomic, strong) SyllabusMainCollection *collection_main;

@end

@implementation SyllabusMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setnavbg_defa];
    self.title = @"考试大纲";
    [self.view addSubview:self.collection_main];
}
#pragma --- view creat
- (SyllabusMainCollection *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0.0;
        layout.minimumInteritemSpacing = 4.0;
        
        _collection_main = [[SyllabusMainCollection alloc] initWithFrame:(CGRect){0, 0, ZTWidth, ZTHeight-NaviIPHONEX} collectionViewLayout:layout];
        _collection_main.backgroundColor = HexRGB(0xF1F0F0);
        @weakify(self)
        [_collection_main setBlockGoOn:^(NSIndexPath * _Nonnull indexPath) {
            @strongify(self)
            //获取数据，填充到view中，高度根据文本高度
            SyllabusMainPopView *view = [SyllabusMainPopView instancetypeWithXib];
            view.frame = (CGRect){2,ZTHeight,ZTWidth-4,270+20};
            view.lbl_content.text = @"（1）细胞的构造：细胞膜、细胞质、细   胞核   （2）细胞的主要生命活动：分裂、   分化、衰老、凋亡、细胞周期.....";
            [self showViewInWindowWithView:view];
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
