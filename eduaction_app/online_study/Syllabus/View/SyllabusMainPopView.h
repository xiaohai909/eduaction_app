//
//  SyllabusMainPopView.h
//  eduaction_app
//
//  Created by Mac on 2018/11/15.
//  Copyright © 2018 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SyllabusMainPopView : UIView
@property (weak, nonatomic) IBOutlet UILabel *lbl_name;
@property (weak, nonatomic) IBOutlet UILabel *lbl_type;
@property (weak, nonatomic) IBOutlet UILabel *lbl_content;
@property (weak, nonatomic) IBOutlet UIButton *btn_close;

@end

NS_ASSUME_NONNULL_END
