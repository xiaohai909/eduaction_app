//
//  MakeProblemMainCollection.h
//  eduaction_app
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MakeProblemMainModel.h"

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
@property (nonatomic, assign) BOOL isAutoReturn;//是否自动跳转
@property (nonatomic, assign) NSInteger addTextFont;//字体更改的倍数
@property (nonatomic, assign) MakeProblemMode viewMode;//答题模式

@property (nonatomic, assign) NSInteger allNumber;
@property (nonatomic, strong) MakeProblemMainModel *model;

@property (nonatomic, copy) void (^blockGoOn)(void);//自动进入下一题
@property (nonatomic, copy) void (^blockPageChange)(BOOL nextPage);//上下页
@property (nonatomic, copy) void (^blockMakeProblem)(NSString *correct);//做完题目


- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout andType:(MakeProblemMode)viewMode;
- (void)setModel:(MakeProblemMode)viewMode andFrame:(CGRect)frame andModel:(MakeProblemMainModel *)model ;
@end

NS_ASSUME_NONNULL_END
