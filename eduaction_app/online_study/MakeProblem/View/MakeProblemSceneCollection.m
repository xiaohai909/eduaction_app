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
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.array_models.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.py_width, self.py_height);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MakeProblemSceneCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
//    cell.isAutoReturn = self.isAutoReturn;
//    cell.addTextFont = self.addTextFont;
    cell.collection_main.isAutoReturn = self.isAutoReturn;
    cell.collection_main.addTextFont = self.addTextFont;
    
    cell.collection_main.tag = indexPath.row;
    cell.collection_main.allNumber = self.array_models.count;
    [cell.collection_main setModel:self.viewMode andFrame:CGRectMake(0, 0, self.py_width, self.py_height) andModel:self.array_models[indexPath.row]];
    [cell.collection_main setBlockGoOn:^{
        if (indexPath.row < self.array_models.count-1) {//已经是最后一题就不能自动跳转了
            //下一题
            self.currentPage = [NSNumber numberWithInteger:indexPath.row+1];
            [self scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section] atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
        }
    }];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

//滑动结束，就要更新工具栏
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger page = scrollView.contentOffset.x/self.py_width;
    if (page != [self.currentPage integerValue] && page<self.array_models.count) {
        self.currentPage = @(page);
    }
}
@end
