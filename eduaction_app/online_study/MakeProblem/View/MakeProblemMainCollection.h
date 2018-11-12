//
//  MakeProblemMainCollection.h
//  eduaction_app
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

//一道题目的界面

NS_ASSUME_NONNULL_BEGIN


/*要不要显示详情看是不是自动跳转，要不要跳转到下一题看设置
 答题模式：进入后仅显示问题，作答
 考试模式：问题和倒计时，做完题后，点击下一题
 背题模式：显示问题和解析
 */
typedef NS_ENUM(NSUInteger, MakeProblemMode) {
    MakeProblemModeExam,//考试

    MakeProblemModeAnswer,//答题
    MakeProblemModeMemory,//背诵
};

@interface MakeProblemMainCollection : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
#warning 这个要看后台的正确答案是以什么形式给的
@property (nonatomic, strong) NSIndexPath *indexPath;//用户选择的结果
@property (nonatomic, assign) MakeProblemMode viewMode;//答题模式
//@property (nonatomic, copy) void (^blockGoOn)(NSIndexPath *indexPath);//

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout andType:(MakeProblemMode)viewMode;
- (void)setModel:(MakeProblemMode)viewMode andFrame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
