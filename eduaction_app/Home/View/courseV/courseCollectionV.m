//
//  courseCollectionV.m
//  eduaction_app
//
//  Created by legendlxd on 2018/12/23.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "courseCollectionV.h"
#import "HomecourseCell.h"
#import "HomenewsCell.h"
static NSString * const cell1 = @"HomecourseCell";
@implementation courseCollectionV
{
    NSMutableArray *deviceArr;
    NSInteger kechengTypeId;
    NSInteger page;
    NSString *kemu;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout AndkechengTypeId:(NSInteger )kechengTypeId_temp Andkemu:(NSString *)kemuCode{
    
    if ([super initWithFrame:frame collectionViewLayout:layout]) {
        
        
        self.clickCourse = [RACSubject subject];
        
        self->kechengTypeId = kechengTypeId_temp;
        self->kemu = kemuCode;
        
        self.showsVerticalScrollIndicator =NO;
      
      
        deviceArr = [[NSMutableArray alloc]init];
    
        
        @weakify(self);
        
        if (self->kemu.length == 0) {
            self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                @strongify(self);
                self->page = 0;
                
                NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
                [dic setObject:@(self->kechengTypeId) forKey:@"kechengTypeId"];
                [dic setObject:@(self->page) forKey:@"page"];
                [[[[myNetworkManager sharemyNetworkManager] net_courseMode] dataReqCommand] execute:dic];
                
            }];
            self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                @strongify(self);
                NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
                [dic setObject:@(self->kechengTypeId) forKey:@"kechengTypeId"];
                [dic setObject:@(self->page + 1) forKey:@"page"];
                [[[[myNetworkManager sharemyNetworkManager] net_courseMode] dataReqCommand] execute:dic];
            }];
            
            [[[[[[myNetworkManager sharemyNetworkManager] net_courseMode]dataReqCommand]executionSignals] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
                @strongify(self);
                [[x takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
                    @strongify(self);
                    commResBaseClass *mode = x;
                    if (mode.resultCode == 10000) {
                        if ([self.mj_header state] == MJRefreshStateRefreshing) {
                            
                            [self->deviceArr removeAllObjects];
                            [self.mj_header endRefreshing];
                        }
                        else if ([self.mj_footer state] == MJRefreshStateRefreshing){
                            
                            if (mode.resultObj_arr.count > 0) {
                                
                                
                            }
                            [self.mj_footer endRefreshing];
                        }
                        
                    }
                    
                }];
                [[x takeUntil:self.rac_willDeallocSignal] subscribeCompleted:^{
                    @strongify(self);
                    [self.mj_footer endRefreshing];
                    [self.mj_header endRefreshing];
                }];
            }];
        }
      
        else{
            self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                @strongify(self);
                self->page = 0;

                NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
                [dic setObject:self->kemu forKey:@"kemuId"];
                [dic setObject:@(self->page) forKey:@"page"];
                [[[[myNetworkManager sharemyNetworkManager] net_courseMode] kemulistReqCommand] execute:dic];

            }];
            self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
                @strongify(self);
                NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
                [dic setObject:self->kemu forKey:@"KemuId"];
                [dic setObject:@(self->page + 1) forKey:@"page"];
                [[[[myNetworkManager sharemyNetworkManager] net_courseMode] kemulistReqCommand] execute:dic];
            }];
            [[[[[[myNetworkManager sharemyNetworkManager] net_courseMode]kemulistReqCommand]executionSignals] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
                @strongify(self);
                [[x takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
                    @strongify(self);
                    commResBaseClass *mode = x;
                    if (mode.resultCode == 10000) {
                        if ([self.mj_header state] == MJRefreshStateRefreshing) {

                            [self->deviceArr removeAllObjects];
                            [self.mj_header endRefreshing];
                            if (mode.resultObj_arr.count > 0) {
                                for (NSInteger i = 0 ; i<mode.resultObj_arr.count ; i++) {

                                    courselistdataBaseClass *temp = [[courselistdataBaseClass alloc]initWithDictionary:mode.resultObj_arr[i]];
                                    [self->deviceArr addObject:temp];
                                }


                                [self reloadData];
                            }
                        }
                        else if ([self.mj_footer state] == MJRefreshStateRefreshing){

                            if (mode.resultObj_arr.count > 0) {


                            }
                            [self.mj_footer endRefreshing];
                        }

                    }

                }];
                [[x takeUntil:self.rac_willDeallocSignal] subscribeCompleted:^{
                    @strongify(self);
                    [self.mj_footer endRefreshing];
                    [self.mj_header endRefreshing];
                }];
            }];


        }
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([HomecourseCell class]) bundle:nil] forCellWithReuseIdentifier:cell1];
        
        self.delegate =self;
        self.dataSource =self;
        [self.mj_header beginRefreshing];
        
    }
    return self;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return deviceArr.count;
    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    
   HomecourseCell *cell_1 = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
   courselistdataBaseClass *mode = [deviceArr objectAtIndex:indexPath.row];
    [cell_1 SetDataSource:mode];
    
   
    return cell_1;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsZero;
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake(ZTWidth, 120);
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
   
    return CGSizeZero;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
   
    return CGSizeZero;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    [self.clickCourse sendNext:deviceArr[indexPath.item]];
}
@end
