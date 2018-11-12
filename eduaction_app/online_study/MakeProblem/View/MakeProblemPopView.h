//
//  MakeProblemPopView.h
//  eduaction_app
//
//  Created by Mac on 2018/11/8.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//可以在这里用xib创建多个view
@interface MakeProblemPopView : UIView<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UISwitch *switch_auto;
@property (weak, nonatomic) IBOutlet UIButton *btn_normal;
@property (weak, nonatomic) IBOutlet UIButton *btn_big;
@property (weak, nonatomic) IBOutlet UIButton *btn_bigger;

@property (weak, nonatomic) IBOutlet UIButton *btn_send;
@property (weak, nonatomic) IBOutlet UITextView *view_text;


+ (MakeProblemPopView *)creatSetPopView;
+ (MakeProblemPopView *)creatNotePopView;
@end

NS_ASSUME_NONNULL_END
