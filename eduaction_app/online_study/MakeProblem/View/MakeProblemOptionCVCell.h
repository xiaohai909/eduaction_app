//
//  MakeProblemOptionCVCell.h
//  eduaction_app
//
//  Created by Mac on 2018/11/6.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, OptionState) {
    OptionStateNormal,//显示
    OptionStateError,//错误x选项
    OptionStateRight,//正确选项
};

@interface MakeProblemOptionCVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *btn_order;
@property (weak, nonatomic) IBOutlet UIButton *btn_content;


- (void)setContent:(NSString *)title andRow:(NSInteger)row andState:(OptionState)state;
@end

NS_ASSUME_NONNULL_END
