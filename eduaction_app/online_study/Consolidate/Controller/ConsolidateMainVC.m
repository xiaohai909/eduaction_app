//
//  ConsolidateMainVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/8.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ConsolidateMainVC.h"
#import "ConsolidateMainHeadCVCell.h"
#import "ConsolidateOptionCVCell.h"


#import "MyCollectionMainVC.h"
#import "ConsolidateHotMainVC.h"
#import "ConsolidateMyNoteVC.h"
#import "ConsolidateFallibilityMainVC.h"
#import "ConsolidateMyWrongMainVC.h"
#import "ConsolidateScoreMainVC.h"

@interface ConsolidateMainVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSArray *image_array;
    NSArray *title_array;
}
@property (nonatomic, strong) UICollectionView *collection_main;
@end

@implementation ConsolidateMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    image_array = @[@"consolidate_ico_dynamic",@"consolidate_ico_address book",@"consolidate_ico_error",@"consolidate_ico_hot spot",@"consolidate_ico_course",@"consolidate_ico_data"];
    title_array = @[@"收藏的题目",@"我的笔记",@"易错试题",@"热点考题",@"我的错题",@"数据统计"];
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

#pragma mark --- view
- (UICollectionView *)collection_main {
    if (!_collection_main) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 1.0;
        layout.minimumInteritemSpacing = 4.0;
        
        _collection_main = [[UICollectionView alloc] initWithFrame:(CGRect){0,UI_IS_IPHONE_X?0:-20, ZTWidth, UI_IS_IPHONE_X?ZTHeight:ZTHeight+20} collectionViewLayout:layout];
        _collection_main.backgroundColor = HexRGB(0xF1F0F0);
        _collection_main.contentInset = UIEdgeInsetsMake(-(UI_IS_IPHONE_X?44:0), 0, 0, 0);

        
        [_collection_main registerNib:[UINib nibWithNibName:NSStringFromClass([ConsolidateMainHeadCVCell class]) bundle:nil] forCellWithReuseIdentifier:@"ConsolidateMainHeadCVCell"];
        [_collection_main registerNib:[UINib nibWithNibName:NSStringFromClass([ConsolidateOptionCVCell class]) bundle:nil] forCellWithReuseIdentifier:@"ConsolidateOptionCVCell"];

        
        _collection_main.delegate = self;
        _collection_main.dataSource = self;
        
    }
    return _collection_main;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else {
        return image_array.count;
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
        return CGSizeMake(self.collection_main.py_width, 50);
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        ConsolidateMainHeadCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ConsolidateMainHeadCVCell" forIndexPath:indexPath];
        [[cell.btn_back rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        return cell;
    }
    else{        
        ConsolidateOptionCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ConsolidateOptionCVCell" forIndexPath:indexPath];
        [cell setImage:image_array[indexPath.row] andTitle:title_array[indexPath.row]];
        return cell;
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            //收藏
            [self.navigationController pushViewController:[MyCollectionMainVC new] animated:YES];
        }
        else if (indexPath.row == 1) {
            //我的笔记
            [self.navigationController pushViewController:[ConsolidateMyNoteVC new] animated:YES];
        }
        else if (indexPath.row == 2) {
            //易错
            [self.navigationController pushViewController:[ConsolidateFallibilityMainVC new] animated:YES];
        }
        else if (indexPath.row == 3) {
            //热题
            [self.navigationController pushViewController:[ConsolidateHotMainVC new] animated:YES];
        }
        else if (indexPath.row == 4) {
            //错题练习
            [self.navigationController pushViewController:[ConsolidateMyWrongMainVC new] animated:YES];
        }
        else if (indexPath.row == 5) {
            //成绩
            [self.navigationController pushViewController:[ConsolidateScoreMainVC new] animated:YES];
        }
    }
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
