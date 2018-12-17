//
//  MineHelpFeedBackView.h
//  eduaction_app
//
//  Created by Mac on 2018/12/12.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IQTextView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MineHelpFeedBackView : UIView
@property (weak, nonatomic) IBOutlet IQTextView *text_content;
@property (weak, nonatomic) IBOutlet UITextField *text_phone;

@end

NS_ASSUME_NONNULL_END
