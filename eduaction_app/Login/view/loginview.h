//
//  loginview.h
//  eduaction_app
//
//  Created by legendlxd on 2018/10/22.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface loginview : UIView
@property (weak, nonatomic) IBOutlet UIButton *register_btn;
@property (weak, nonatomic) IBOutlet UIButton *login_btn;
@property (weak, nonatomic) IBOutlet UIView *logo_view;
@property (weak, nonatomic) IBOutlet UIImageView *mobile_icon;
@property (weak, nonatomic) IBOutlet UIImageView *password_icon;
@property (weak, nonatomic) IBOutlet UIView *underline1;
@property (weak, nonatomic) IBOutlet UIView *underline2;
@property (weak, nonatomic) IBOutlet UITextField *user_mobile;
@property (weak, nonatomic) IBOutlet UITextField *user_password;
@property (weak, nonatomic) IBOutlet UIButton *log_inbtn;
@property (weak, nonatomic) IBOutlet UIButton *forgetpassword;
@property (weak, nonatomic) IBOutlet UIButton *QQ;
@property (weak, nonatomic) IBOutlet UIButton *WX;
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;

@property (weak, nonatomic) IBOutlet UIButton *cellphone_btn;
@property (weak, nonatomic) IBOutlet UIView *cellphoneview;
@property (weak, nonatomic) IBOutlet UIImageView *cellphone_layer;

+(instancetype)creatXib;
@end

NS_ASSUME_NONNULL_END
