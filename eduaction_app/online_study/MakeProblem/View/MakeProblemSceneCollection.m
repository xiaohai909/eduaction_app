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
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 19;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.py_width, self.py_height);
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MakeProblemSceneCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
    [cell.collection_main setModel:self.viewMode andFrame:CGRectMake(0, 0, self.py_width, self.py_height)];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

//滑动结束，就要更新工具栏
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger page = scrollView.contentOffset.x/self.py_width;
    if (page != [self.currentPage integerValue]) {
        self.currentPage = @(page);
    }
}
@end
