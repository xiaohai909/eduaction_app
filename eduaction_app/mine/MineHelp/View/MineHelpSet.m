//
//  MineHelpSet.m
//  eduaction_app
//
//  Created by Mac on 2018/12/11.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineHelpSet.h"
#import "MineUserCVCell.h"
#import "MineHelpSetCVCell.h"

static NSString * const cell1 = @"MineUserCVCell";
static NSString * const cell2 = @"MineHelpSetCVCell";

@implementation MineHelpSet

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([MineUserCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell1];
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([MineHelpSetCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell2];

        
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

#pragma mark --- collection
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 4;
            break;
        case 2:
            return 4;
            break;
        default:
            return 0;
            break;
    }
}
- (UIEdgeInsets )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(section?0:10, 0, 10, 0);
}

#pragma mark --- cell
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(self.py_width, 59);
    }
    else{
        return CGSizeMake(self.py_width,49);
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 1 && indexPath.row != 0) {
        //
        MineHelpSetCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell2 forIndexPath:indexPath];
        cell.lbl_detail.hidden = NO;
        [self getTitle:cell.lbl_title detailLable:cell.lbl_detail withIndexPath:indexPath];
        if (indexPath.row == 3) {
            cell.lbl_detail.hidden = YES;
            cell.lbl_title_top.constant = 19;
        } else {
            cell.lbl_detail.hidden = NO;
            cell.lbl_title_top.constant = 9;
        }
        [RACObserve(cell, switch_select) subscribeNext:^(NSNumber *select) {
            //开关
        }];
        return cell;
    }
    else{
        MineUserCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
        cell.lbl_detail.hidden = YES;
        cell.btn_head.hidden = YES;
        cell.image_arrow.hidden = NO;
        cell.lbl_title_left.constant = 17;
        cell.btn_head_right.constant = 67;
        if (indexPath.section == 0) {
            cell.btn_head.hidden = NO;
            cell.lbl_title_left.constant = 17+60;
            cell.btn_head_right.constant = ZTWidth-65;
        }
        else if(indexPath.section == 1){
            cell.image_arrow.hidden = YES;
        }
        [self getTitle:cell.lbl_title detailLable:cell.lbl_detail withIndexPath:indexPath];
        return cell;
    }
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1 && indexPath.row != 0) {
        //这里不处理
    }
    else{
        if (self.blockGoOn) {
            self.blockGoOn(indexPath);
        }
    }
}


#pragma mark ---
- (void)getTitle:(UILabel *)title detailLable:(UILabel *)detailTitle withIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array_title = @[@[@"Vet.lian"],@[@"清除缓存",@"允许非wifi网络播放",@"允许非wifi网络下载",@"视频自动播放"],@[@"常见问题",@"给我评分",@"意见反馈",@"关于我们"]];
    NSArray *array_detail = @[@[@""],@[@"",@"请慎重选择开启 避免过度使用流量",@"请慎重选择开启 避免过度使用流量",@""],@[@"",@"",@"",@""]];
    title.text = array_title[indexPath.section][indexPath.row];
    detailTitle.text = array_detail[indexPath.section][indexPath.row];
}
@end
