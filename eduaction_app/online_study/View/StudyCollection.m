//
//  StudyCollection.m
//  eduaction_app
//
//  Created by Mac on 2018/11/5.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "StudyCollection.h"
#import "StudyCVCell.h"
#import "StudyTimeCVCell.h"

static NSString * const cell1 = @"StudyTimeCVCell";
static NSString * const cell2 = @"StudyCVCell";

@interface StudyCollection()
@property (nonatomic, strong) NSArray *array_title,*array_image;
@end

@implementation StudyCollection

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
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([StudyTimeCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell1];
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([StudyCVCell class]) bundle:nil] forCellWithReuseIdentifier:cell2];
        
        self.contentInset = UIEdgeInsetsMake(self.img_head.py_height-(UI_IS_IPHONE_X?64:0), 0, 0, 0);
        [self addSubview:self.img_head];
        self.delegate = self;
        self.dataSource = self;
        
        self.array_image = @[@"online_ico_chapter study",@"online_ico_mock test",@"online_ico_over the years",@"online_ico_random practice",@"online_ico_wrong practice",@"online_ico_consolidate",@"online_ico_outline",@"online_ico_find"];//@"online_ico_ranking"
        self.array_title = @[@"章节练习",@"模拟考试",@"历年真题",@"随机练习",@"错题练习",@"巩固练习",@"考试大纲",@"试题查找"];//,@"排行榜"
    }
    return self;
}
- (UIImageView *)img_head {
    if (!_img_head) {
        CGFloat height = ZTWidth*(198.0/375.0);
        _img_head = [[UIImageView alloc] initWithFrame:(CGRect){0,-height,ZTWidth,height}];
        _img_head.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
    }
    return _img_head;
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
        return self.array_title.count;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(self.py_width, self.py_width*(170.0/375.0));
    }
    else {
        CGFloat width = self.py_width/4.0-2;
        return CGSizeMake(width,width);
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        StudyTimeCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell1 forIndexPath:indexPath];
        [[cell.btn_recharge rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            if (self.blockGoOn) {
                self.blockGoOn(@"充值");
            }
        }];
        return cell;
    }
    else{        
        StudyCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cell2 forIndexPath:indexPath];
        cell.img_mian.image = [UIImage imageNamed:self.array_image[indexPath.row]];
        [cell.btn_title setTitle:self.array_title[indexPath.row] forState:UIControlStateNormal];
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.blockGoOn) {
        self.blockGoOn(indexPath.section?self.array_title[indexPath.row]:@"继续学习");
    }
}
@end
