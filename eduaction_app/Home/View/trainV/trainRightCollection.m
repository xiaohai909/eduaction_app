//
//  trainRightCollection.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/19.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "trainRightCollection.h"
#import "trainRightCell.h"
#import "trainRightHead.h"
static NSString * const cell1 = @"trainRightCell";
static NSString * const HID = @"trainRightHead";
@implementation trainRightCollection
{
    NSMutableArray *titleArr;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if ([super initWithFrame:frame collectionViewLayout:layout]) {
        
        self.showsVerticalScrollIndicator =NO;
        self.clickindex = [RACSubject subject];
        
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([trainRightCell class]) bundle:nil] forCellWithReuseIdentifier:cell1];
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([trainRightHead class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HID];
        self.delegate =self;
        self.dataSource =self;
        titleArr = [[NSMutableArray alloc]init];
        @weakify(self);
        [[[[[[myNetworkManager sharemyNetworkManager] net_courseMode]queryKemuByPeixunbanIdCommand]executionSignals] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
            @strongify(self);
            [[x takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
                @strongify(self);
                commResBaseClass *mode =x;
                
                if (mode.resultCode == 10000) {
                    [self->titleArr removeAllObjects];
                    if (mode.resultObj_arr.count > 0) {
                        for (NSInteger i=0; i<mode.resultObj_arr.count; i++) {
                            
                            trainlistBaseClass *temp = [[trainlistBaseClass alloc]initWithDictionary:mode.resultObj_arr[i]];
                            [self->titleArr addObject:temp];
                            
                        }
                        [self reloadData];
                    }
                    
                }
                
                
            }];
            [[x takeUntil:self.rac_willDeallocSignal] subscribeCompleted:^{
                [[GWProgressHUB sharedYGGWProgressHUB] YGDismiss:[CommonFunciton theTopviewControler].view];
            }];
        }];
        
       
    }
    return self;
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    

    return titleArr.count;
   
    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    trainlistBaseClass *mode = [titleArr objectAtIndex:indexPath.item];
    
    
    trainRightCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
    cell.titleLab.text = mode.name;
    return cell;
   
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(10, 10, 10, 10);
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 4;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 4;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return (CGSize){(ZTWidth - 99),54*scale_H};
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{

    return CGSizeZero;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return (CGSize){(ZTWidth - 123)/2.0,54*scale_H};
    
}



-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{

        
        if (kind == UICollectionElementKindSectionHeader)
        {
            
           
            
            
            trainRightHead * headVc = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HID forIndexPath:indexPath];
            
            headVc.titleLab.text = @"";
            return headVc;
        }
    

    
    
    return nil;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    [self.clickindex sendNext:titleArr[indexPath.item]];
    
    
    
}
-(void)dealloc{
    
    
}
@end
