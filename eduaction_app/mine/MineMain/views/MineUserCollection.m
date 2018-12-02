//
//  MineUserCollection.m
//  eduaction_app
//
//  Created by Mac on 2018/11/27.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineUserCollection.h"
#import "MineUserCVCell.h"

static NSString * const cell1 = @"MineUserCVCell";

@implementation MineUserCollection

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
        
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

#pragma mark --- collection
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;//2018打开
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
            break;
        case 2:
            return 3;
            break;
        case 3:
            return 5;
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
    MineUserCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
    cell.btn_head.hidden = YES;
    cell.lbl_detail.hidden = NO;
    if (indexPath.section == 0) {
        cell.btn_head.hidden = NO;
        cell.lbl_detail.hidden = YES;
//        [cell.btn_head setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
    
    [self getTitle:cell.lbl_title detailLable:cell.lbl_detail withIndexPath:indexPath];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.blockGoOn) {
        self.blockGoOn(indexPath);
    }
}


#pragma mark ---
- (void)getTitle:(UILabel *)title detailLable:(UILabel *)detailTitle withIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array_title = @[@[@"头像"],@[@"职业",@"签名"],@[@"昵称",@"性格",@"地区"],@[@"手机",@"微信",@"QQ",@"修改密码",@"实名认证"]];
    NSArray *array_detail = @[@[@"头像"],@[@"",@""],@[@"Vet.lian",@"未知",@"未知地区"],@[@"152****5037",@"未绑定",@"QQ",@"",@"未认证"]];
    title.text = array_title[indexPath.section][indexPath.row];
    detailTitle.text = array_detail[indexPath.section][indexPath.row];
}
@end
