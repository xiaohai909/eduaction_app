//
//  MakeProblemSceneCollection.m
//  eduaction_app
//
//  Created by Mac on 2018/11/7.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MakeProblemSceneCollection.h"
#import "MakeProblemSceneCVCell.h"

static NSString * const cell1 = @"MakeProblemSceneCVCell";


@implementation MakeProblemSceneCollection

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout andType:(MakeProblemMode)viewMode {
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([MakeProblemSceneCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell1];

        
        self.delegate = self;
        self.dataSource = self;
        
        self.currentPage = @(0);
        self.viewMode = viewMode;        
        
        NSMutableDictionary *dic = (NSMutableDictionary *)[[NSUserDefaults standardUserDefaults] objectForKey:MakeProblemSetMessage];
        if (!dic) {
            dic = [NSMutableDictionary dictionary];
            [dic setObject:[NSNumber numberWithBool:NO] forKey:MakeProblemSetMessageGO];
            [dic setObject:[NSNumber numberWithInteger:0] forKey:MakeProblemSetMessageTextFont];
            [[NSUserDefaults standardUserDefaults] setObject:dic forKey:MakeProblemSetMessage];
        }
        self.isAutoReturn = [[dic objectForKey:MakeProblemSetMessageGO] boolValue];
        self.addTextFont = [[dic objectForKey:MakeProblemSetMessageTextFont] integerValue];
    }
    return self;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.array_models.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.py_width, self.py_height);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MakeProblemSceneCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
    cell.collection_main.isAutoReturn = self.isAutoReturn;
    cell.collection_main.addTextFont = self.addTextFont;
    
    cell.collection_main.tag = indexPath.section;
    cell.collection_main.allNumber = self.total;
    
    MakeProblemMainModel *model = self.array_models[indexPath.section];
    model.addTextFont = self.addTextFont;
    [cell.collection_main setModel:self.viewMode andFrame:CGRectMake(0, 0, self.py_width, self.py_height) andModel:model];
    [cell.collection_main setBlockGoOn:^{
        if (indexPath.section < self.array_models.count-1) {//已经是最后一题就不能自动跳转了
            //下一题
            self.currentPage = [NSNumber numberWithInteger:indexPath.section+1];
           
            MakeProblemMainModel *model_next = self.array_models[indexPath.section+1];//下一题
            [self scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section+1] atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
            if (model_next.ID.length == 0) {
                //没有加载就去加载
                if (self.blockRequestPage) {
                    self.blockRequestPage(indexPath.section+1);
                }
            }
            else{
                //如果下下题还没加载，提早一点加载
                if (indexPath.section+1 < self.array_models.count-1) {//有下下题
                    MakeProblemMainModel *model_next2 = self.array_models[indexPath.section+2];//下下题
                    if (model_next2.ID.length == 0) {
                        //没有加载就去加载
                        if (self.blockRequestPage) {
                            self.blockRequestPage(indexPath.section+2);
                        }
                    }
                }
            }
        }
    }];
    [cell.collection_main setBlockPageChange:^(BOOL nextPage) {
        //上下页
        [self pageChange:nextPage];
    }];
    [cell.collection_main setBlockMakeProblem:^(NSString * _Nonnull correct) {
         //做题
        if (self.blockMakeProblem) {
            self.blockMakeProblem(correct);
        }
    }];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
////滑动结束，就要更新工具栏,如果划上划下的数据还没加载，那么现在就要去加载
- (void)pageChange:(BOOL)nextPage
{
    if (nextPage) {
        //下一页
        if ([self.currentPage integerValue]+1 < self.total) {
            NSInteger page = [self.currentPage integerValue]+1;
            [UIView animateWithDuration:0.3 animations:^{
            } completion:^(BOOL finished) {
                [self selectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:page] animated:YES scrollPosition:UICollectionViewScrollPositionRight];
            }];
            self.currentPage = @(page);
            MakeProblemMainModel *model_next = self.array_models[page];
            if (model_next.ID.length == 0) {
                //没有加载就去加载
                if (self.blockRequestPage) {
                    self.blockRequestPage(page);
                }
            }
            else{
                //如果下下题还没加载，提早一点加载
                if (page+1 < self.array_models.count-1) {//有下下题
                    MakeProblemMainModel *model_next2 = self.array_models[page+1];//下下题
                    if (model_next2.ID.length == 0) {
                        //没有加载就去加载
                        if (self.blockRequestPage) {
                            self.blockRequestPage(page+1);
                        }
                    }
                }
            }
        }
    }
    else{//上一页
        if ([self.currentPage integerValue] > 0) {
            NSInteger page = [self.currentPage integerValue]-1;
            [UIView animateWithDuration:0.3 animations:^{
            } completion:^(BOOL finished) {
                [self selectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:page] animated:YES scrollPosition:UICollectionViewScrollPositionRight];
            }];
            self.currentPage = @(page);
            MakeProblemMainModel *model_next = self.array_models[page];
            if (model_next.ID.length == 0) {
                //没有加载就去加载
                if (self.blockRequestPage) {
                    self.blockRequestPage(page);
                }
            }
            else{
                //如果上上题还没加载，提早一点加载
                if (page-1 > 0) {//有下下题
                    MakeProblemMainModel *model_next2 = self.array_models[page-1];//下下题
                    if (model_next2.ID.length == 0) {
                        //没有加载就去加载
                        if (self.blockRequestPage) {
                            self.blockRequestPage(page-1);
                        }
                    }
                }
            }
        }
    }
}


@end
