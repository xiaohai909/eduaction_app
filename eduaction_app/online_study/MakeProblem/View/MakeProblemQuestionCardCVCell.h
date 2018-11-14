//
//  MakeProblemQuestionCardCVCell.h
//  eduaction_app
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, QuestionCardMode) {
    QuestionCardModeNormal,
    QuestionCardModeRight,
    QuestionCardModeWrong,
    QuestionCardModeNow
};

@interface MakeProblemQuestionCardCVCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *btn_number;
- (void)setBtnTiltle:(NSString *)title andMode:(QuestionCardMode)mode;
@end

NS_ASSUME_NONNULL_END
