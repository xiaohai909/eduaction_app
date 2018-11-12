//
//  ConsolidateMainVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/8.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ConsolidateMainVC.h"
#import "ConsolidateMainHeadCVCell.h"

@interface ConsolidateMainVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collection_main;
@end

@implementation ConsolidateMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.collection_main];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (UICollectionView *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 1.0;
        layout.minimumInteritemSpacing = 4.0;
        
        _collection_main = [[UICollectionView alloc] initWithFrame:(CGRect){0, 0, ZTWidth, ZTHeight} collectionViewLayout:layout];
        _collection_main.backgroundColor = HexRGB(0xF1F0F0);
        _collection_main.contentInset = UIEdgeInsetsMake(-(UI_IS_IPHONE_X?44:0), 0, 0, 0);

        
        [_collection_main registerNib:[UINib nibWithNibName:NSStringFromClass([ConsolidateMainHeadCVCell class]) bundle:nil] forCellWithReuseIdentifier:@"ConsolidateMainHeadCVCell"];
        
        _collection_main.delegate = self;
        _collection_main.dataSource = self;
        
    }
    return _collection_main;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else {
        return 10;
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(section?4:0, 0, 0, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(self.collection_main.py_width, UI_IS_IPHONE_X?270:226);
    }
    else {
        return CGSizeMake(self.collection_main.py_width, 86);
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.section == 0) {
        ConsolidateMainHeadCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ConsolidateMainHeadCVCell" forIndexPath:indexPath];
        [[cell.btn_back rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        return cell;
//    }
//    else{
//        ChapterCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell2 forIndexPath:indexPath];
//        [cell.view_ratio creatRatioViewWithNumber:0.05 andType:RatioViewTypeYellow];
//        cell.btn_check.hidden = YES;
//        return cell;
//    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

}

@end
