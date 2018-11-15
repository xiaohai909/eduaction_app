//
//  SyllabusMainCRView.h
//  eduaction_app
//
//  Created by Mac on 2018/11/15.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SyllabusMainCRView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UIButton *btn_action;
@property (weak, nonatomic) IBOutlet UIButton *btn_sign;
@property (weak, nonatomic) IBOutlet UILabel *lbl_content;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btn_sign_left;
@property (nonatomic, copy) void (^blockClick)();
@end

NS_ASSUME_NONNULL_END
