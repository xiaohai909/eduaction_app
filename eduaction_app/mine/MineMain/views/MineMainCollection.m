//
//  MineMainCollection.m
//  eduaction_app
//
//  Created by Mac on 2018/11/26.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineMainCollection.h"
#import "MineMainCRView.h"
#import "StudyCVCell.h"
#import "MineTitleCVCell.h"

static NSString * const cr_cell1 = @"MineMainCRView";
static NSString * const cell1 = @"MineTitleCVCell";
static NSString * const cell2 = @"StudyCVCell";


@implementation MineMainCollection

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
        
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([MineTitleCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell1];
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([StudyCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell2];
//        [self registerNib:[UINib nibWithNibName:NSStringFromClass([MineMainCRView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:cr_cell1];
        
        self.delegate = self;
        self.dataSource = self;
        
        self.arr_title = @[@"学习",@"工具",@"帮助"];//,@"活动"
    }
    return self;
}

- (NSMutableDictionary *)dic_title
{
    if (!_dic_title) {
        _dic_title = [NSMutableDictionary dictionary];

        [_dic_title setObject:@[[self dicWithImage:@"mine_ico_history" andTitle:@"历史记录"],
                                [self dicWithImage:@"mine_ico_purchased course" andTitle:@"已购课程"],
                                [self dicWithImage:@"mine_ico_today's course" andTitle:@"今日课程"],
                                [self dicWithImage:@"mine_ico_my collection" andTitle:@"我的收藏"]] forKey:@"学习"];
        
        [_dic_title setObject:@[//[self dicWithImage:@"mine_ico_mall" andTitle:@"商城中心"],
                                //[self dicWithImage:@"mine_ico_vip" andTitle:@"购买VIP"],
                                //[self dicWithImage:@"mine_ico_admission ticket" andTitle:@"准考证"],
//                                [self dicWithImage:@"mine_ico_document photo" andTitle:@"证件照"],
                                [self dicWithImage:@"mine_ico_exchange" andTitle:@"兑换中心"]] forKey:@"工具"];
        
/*        [_dic_title setObject:@[[self dicWithImage:@"mine_ico_share" andTitle:@"分享邀请"],
                                [self dicWithImage:@"mine_ico_coupon" andTitle:@"优惠券"]] forKey:@"活动"];*/
        
        [_dic_title setObject:@[[self dicWithImage:@"mine_ico_customer service" andTitle:@"在线客服"],
                                [self dicWithImage:@"mine_ico_setting" andTitle:@"设置"]] forKey:@"帮助"];
    }
    return _dic_title;
}
- (NSDictionary *)dicWithImage:(NSString *)imageName andTitle:(NSString *)title
{
   return [NSDictionary dictionaryWithObjectsAndKeys:imageName,@"image",title,@"title", nil];
}
- (NSDictionary *)getImageAndTitle:(NSIndexPath *)index
{
    NSArray *array = self.dic_title[self.arr_title[index.section]];
    return array[index.row-1];
}


#pragma mark --- collection
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.arr_title.count;//2018打开
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *array = self.dic_title[self.arr_title[section]];
    return array.count+1;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //防止只有一个的时候cell居中
     return UIEdgeInsetsMake(0, 1, 0, 0);
}
//#pragma mark --- head
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    if (section == 0) {
//        return CGSizeMake(self.py_width, UI_IS_IPHONE_X?136+44:150);
//    }
//    else{
//        return CGSizeMake(self.py_width, 0);
//    }
//}
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        MineMainCRView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:cr_cell1 forIndexPath:indexPath];
//        return view;
//    }
//    return nil;
//}

#pragma mark --- cell
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return CGSizeMake(self.py_width, indexPath.section?50:40);
    }
    else{
        return CGSizeMake(self.py_width/4-2, 75);
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        MineTitleCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
        cell.lbl_title.text = self.arr_title[indexPath.section];
        cell.line_height.constant = indexPath.section?5:0;
        return cell;
    }
    else{
        NSDictionary *dic = [self getImageAndTitle:indexPath];
        StudyCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell2 forIndexPath:indexPath];
        cell.img_mian.image = [UIImage imageNamed:dic[@"image"]];
        [cell.btn_title setTitle:dic[@"title"] forState:UIControlStateNormal];
        return cell;
    }
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.blockGoOn && indexPath.row!=0) {
        NSDictionary *dic = [self getImageAndTitle:indexPath];
        self.blockGoOn(dic[@"title"]);
    }
}

@end
