//
//  cellphone_loginview.h
//  eduaction_app
//
//  Created by legendlxd on 2018/10/29.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface cellphone_loginview : UIView
@property (weak, nonatomic) IBOutlet UIButton *back;
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (weak, nonatomic) IBOutlet UIView *logo_view;
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UIButton *register_btn;
@property (weak, nonatomic) IBOutlet UIButton *login_btn;

@property (weak, nonatomic) IBOutlet UITextField *mobilenumber;
@property (weak, nonatomic) IBOutlet UIImageView *mobileicon;
@property (weak, nonatomic) IBOutlet UIView *line1;
@property (weak, nonatomic) IBOutlet UITextField *code;
@property (weak, nonatomic) IBOutlet UIImageView *codeicon;
@property (weak, nonatomic) IBOutlet UIButton *codebtn;
@property (weak, nonatomic) IBOutlet UIView *line2;
@property (weak, nonatomic) IBOutlet UIButton *go_reg_btn;
+(instancetype)creatXib;
@end

NS_ASSUME_NONNULL_END
