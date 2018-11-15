//
//  SearchCollection.m
//  eduaction_app
//
//  Created by Mac on 2018/11/15.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "SearchCollection.h"
#import "SearchMainCRView.h"
#import "SearchKeyCVCell.h"

static NSString * const cr_cell1 = @"SearchMainCRView";
static NSString * const cell1 = @"SearchKeyCVCell";


@implementation SearchCollection

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (SearchCollection *)creatSearchView:(CGRect)frame andHot:(NSArray *)hotArray andHistory:(NSArray *)historyArray
{
    static SearchCollection *searchView;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 0.0;
        layout.minimumInteritemSpacing = 4.0;
        
        searchView = [[SearchCollection alloc] initWithFrame:frame collectionViewLayout:layout];
        searchView.backgroundColor = [UIColor whiteColor];
        searchView.array_hot = [NSMutableArray arrayWithArray:hotArray];
        searchView.array_history = [NSMutableArray arrayWithArray:historyArray];
        
        searchView.justShow = YES;
    });
    return searchView;
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([SearchKeyCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell1];
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([SearchMainCRView class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:cr_cell1];
        
        self.delegate = self;
        self.dataSource = self;
        
    }
    return self;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.justShow?2:1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.justShow) {
        return section?self.array_history.count:self.array_hot.count;
    }
    else{
        return self.array_result.count;
    }
}
#pragma mark --- head
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (self.justShow) {
        return CGSizeMake(self.py_width, 40);
    }
    else{
        return CGSizeMake(0,0);
    }
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        SearchMainCRView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:cr_cell1 forIndexPath:indexPath];
        view.lbl_title.text = indexPath.section?@"搜索记录":@"热门搜索";
        [view.btn_action setImage:[UIImage imageNamed:indexPath.section?@"search_btn_delete":@"search_btn_refresh"] forState:UIControlStateNormal];
        [view.btn_action setTitle:indexPath.section?@"  清空记录":@"  换一批" forState:UIControlStateNormal];
        [view setBlockGoOn:^{
            if (indexPath.section) {
                if (self.blockClean) {
                    self.blockClean();
                }
            }
            else{
                if (self.blockChange) {
                    self.blockChange();
                }
            }
            
        }];
        return view;
    }
    return nil;
}

#pragma mark --- cell
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.justShow) {
        NSString *title;
        if (indexPath.section) {
            title = self.array_history[indexPath.row];
        }
        else{
            title = self.array_hot[indexPath.row];
        }
        return CGSizeMake(title.length*10, 35);
    }
    else{
        return CGSizeMake(self.py_width, 35);
    }
    
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SearchKeyCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.blockGoOn) {
        NSString *title;
        if (self.justShow) {
            if (indexPath.section) {
                title = self.array_history[indexPath.row];
            }
            else{
                title = self.array_hot[indexPath.row];
            }
        }
        else{
            title = self.array_result[indexPath.row];
        }
        self.blockGoOn(title);
    }
}

@end






