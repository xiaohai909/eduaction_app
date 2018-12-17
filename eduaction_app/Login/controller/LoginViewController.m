//
//  LoginViewController.m
//  eduaction_app
//
//  Created by legendlxd on 2018/10/22.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "LoginViewController.h"
#import "loginview.h"
#import "registerView.h"
#import "LoginViewMode.h"
#import "forgetpassview.h"
#import "cellphone_loginview.h"
@interface LoginViewController ()
@property(nonatomic, strong)LoginViewMode *viewModel;
@property (nonatomic,strong)loginview *myview;
@property (nonatomic,strong)registerView *myview_reg;
@property (nonatomic,strong)forgetpassview *myforgetView;
@property (nonatomic,strong)cellphone_loginview *myview_code_login;
@end

@implementation LoginViewController
#pragma mark 忘记密码
-(forgetpassview *)myforgetView
{
    if (!_myforgetView)
    {
        _myforgetView = [forgetpassview creatXib];
        @weakify(self);
        [[_myforgetView.back rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            if (self.myview.hidden) {
                
                self.myview.hidden = NO;
                self.myforgetView.hidden = YES;
            }
        }];
        [[_myforgetView.register_btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            if (self.myview_reg.hidden) {
                
                self.myforgetView.hidden = YES;
                self.myview_reg.hidden = NO;
            }
        }];

    }
    return _myforgetView;
}
#pragma mark 短信登录页面
-(cellphone_loginview *)myview_code_login
{
    if (!_myview_code_login)
    {
        _myview_code_login = [cellphone_loginview creatXib];
        @weakify(self);
        [[_myview_code_login.back rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            if (self.myview.hidden) {
                
                self.myview.hidden = NO;
                self.myview_code_login.hidden = YES;
            }
        }];
        [[_myview_code_login.register_btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            if (self.myview_reg.hidden) {
                
                self.myview_code_login.hidden = YES;
                self.myview_reg.hidden = NO;
            }
        }];
    }
    return _myview_code_login;
}
#pragma mark 登录界面
-(loginview *)myview
{
    if (!_myview)
    {
        _myview = [loginview creatXib];
        @weakify(self);
        [[_myview.login_btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
           @strongify(self);
            
            if  (self.myview.hidden){
                
                self.myview.hidden = NO;
                self.myview_reg.hidden=YES;
            }
        }];
        [[_myview.register_btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            
            if  (self.myview_reg.hidden){
                
                self.myview.hidden = YES;
                self.myview_reg.hidden=NO;
            }
        }];
        [[_myview.forgetpassword rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
             @strongify(self);
            
            if  (self.myforgetView.hidden){
                
                self.myview.hidden = YES;
                self.myforgetView.hidden=NO;
            }
            
        }];
        [[_myview.cellphone_btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            if  (self.myview_code_login.hidden){
                
                self.myview.hidden = YES;
                self.myview_code_login.hidden=NO;
            }
            
        }];

    }
    return _myview;
}

#pragma mark 注册界面
-(registerView *)myview_reg
{
    if (!_myview_reg)
    {
        _myview_reg = [registerView creatXib];
        @weakify(self);
        [[_myview_reg.login_btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            
            if  (self.myview.hidden){
                
                self.myview.hidden = NO;
                self.myview_reg.hidden=YES;
            }
        }];
        [[_myview_reg.register_btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            
            if  (self.myview_reg.hidden){
                
                self.myview.hidden = YES;
                self.myview_reg.hidden=NO;
            }
        }];
        [[_myview_reg.eulabtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
             @strongify(self);
            self.myview_reg.eulabtn.selected = !self.myview_reg.eulabtn.selected;
            self.viewModel.eulaselect = self.myview_reg.eulabtn.selected;
        }];
        
        
    }
    return _myview_reg;
}
- (id)init {
    self = [super init];
    if (self) {
        self.viewModel = [LoginViewMode new];
        
    }
    return self;
}
#pragma mark 绑定viewmode
-(void)bindWithViewModel{
    
    
    @weakify(self);
    RAC(self.viewModel, loginview_mobile) = self.myview.user_mobile.rac_textSignal;
    self.myview.log_inbtn.rac_command = self.viewModel.subscribeCommand_loginbtn;
    RAC(self.viewModel, loginview_password) = self.myview.user_password.rac_textSignal;
    
    RAC(self.viewModel, regView_mobile) = self.myview_reg.mobilenumber.rac_textSignal;
    RAC(self.viewModel, regView_inviteCode) = self.myview_reg.invation_field.rac_textSignal;
    RAC(self.viewModel, regView_password) = self.myview_reg.password_field.rac_textSignal;
    RAC(self.viewModel, regView_password_again) = self.myview_reg.passwordagain_field.rac_textSignal;
    RAC(self.viewModel, smscode) = self.myview_reg.code.rac_textSignal;
    
    
    RAC(self.viewModel, loginwithcode_mobile) = self.myview_code_login.mobilenumber.rac_textSignal;
    RAC(self.viewModel, loginwithcode_code) = self.myview_code_login.code.rac_textSignal;
    
    RAC(self.viewModel, forget_mobile) = self.myforgetView.mobilenumber.rac_textSignal;
    RAC(self.viewModel, forget_smscode) = self.myforgetView.code.rac_textSignal;
    RAC(self.viewModel, forget_password) = self.myforgetView.password_field.rac_textSignal;
    RAC(self.viewModel, forget_password_again) = self.myforgetView.passwordagain_field.rac_textSignal;
    
    
    self.myforgetView.codebtn.rac_command = self.viewModel.subscribeCommand_forgetpassowrd_codebtn;
    self.myforgetView.forgetbtn.rac_command = self.viewModel.subscribeCommand_forgetpassowrd_reset;
    
    self.myview_code_login.codebtn.rac_command = self.viewModel.subscribeCommand_loginwith_codebtn;
    self.myview_code_login.go_reg_btn.rac_command = self.viewModel.subscribeCommand_loginwithcode;
    
    
    self.myview.QQ.rac_command = self.viewModel.subscribeCommand_QQ;
    self.myview.WX.rac_command = self.viewModel.subscribeCommand_wx;
    
    self.myview_reg.codebtn.rac_command = self.viewModel.subscribeCommand_regCodebtn;
    self.myview_reg.go_reg_btn.rac_command = self.viewModel.subscribeCommand_regGo;
    
    
    [[self.viewModel.subscribeCommand_QQ.executing skip:1] subscribeNext:^(id x) {
        if ([x boolValue] == YES) { // 正在执行
            DDLogVerbose(@"QQ 当前正在执行%@", x);
        }else {
            // 执行完成/没有执行
            DDLogVerbose(@"QQ 执行完成/没有执行");
        }
    }];
    
    
    
    [self.viewModel.subscribeCommand_wx.executionSignals.switchToLatest subscribeNext:^(id x) {
        
        DDLogVerbose(@"%@", [CommonFunciton dictionaryToJson:x]);
        
    }];
    
    [[self.viewModel.subscribeCommand_wx.executing skip:1] subscribeNext:^(id x) {
        if ([x boolValue] == YES) { // 正在执行
            DDLogVerbose(@"WX 当前正在执行%@", x);
        }else {
            // 执行完成/没有执行
            DDLogVerbose(@"WX 执行完成/没有执行");
        }
    }];
    
    
    
    [self.viewModel.subscribeCommand_QQ.executionSignals.switchToLatest subscribeNext:^(id x) {
        
        DDLogVerbose(@"%@", [CommonFunciton dictionaryToJson:x]);
        
    }];
    
    
    [[self.viewModel.subscribeCommand_loginbtn.executing skip:1] subscribeNext:^(id x) {
       
        if ([x boolValue] == YES) { // 正在执行
            
            DDLogVerbose(@"当前正在执行%@", x);
           
        }else {
            // 执行完成/没有执行
            DDLogVerbose(@"执行完成/没有执行");
           
        }
    }];
    
    
    
    [self.viewModel.subscribeCommand_loginbtn.executionSignals.switchToLatest subscribeNext:^(id x) {
#pragma mark 登录状态
        @strongify(self);
        

        if ([x isKindOfClass:[commResBaseClass class]]) {
            commResBaseClass *mode = x;
            [[GWProgressHUB sharedYGGWProgressHUB] YGDismiss:self.view];
            
            if (mode.resultCode == 10000) {
                
                [self goTabarView];
                [YGUserDefaults setBool:YES forKey:islogin];
                [YGUserDefaults synchronize];
            }
            else{
                popAlert(mode.resultMsg, 2);
            }
            
        }
        
        
        
    }];
    [self.viewModel.subscribeCommand_regCodebtn.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
#pragma mark 注册验证码
         @strongify(self);
        if ([x isKindOfClass:[commResBaseClass class]]) {
            
            
            commResBaseClass *mode = x;
            
            
            if (mode.resultCode == 10000) {
                
                [self.viewModel GWCountdown:for_reg andsecond:60 andblock:^(NSInteger second) {
                    
                    if (second > 0) {
                        
                        [self.myview_reg.codebtn setTitle:[NSString stringWithFormat:@"%@秒",@(second)] forState:UIControlStateNormal];
                        
                    }
                    else{
                        
                        [self.myview_reg.codebtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                    }
                }];
                
            }
            else{
                popAlert(mode.resultMsg, 2);
            }
            
        }
        
    }];
    
    [self.viewModel.subscribeCommand_regGo.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        if ([x isKindOfClass:[commResBaseClass class]]) {
            
            
            commResBaseClass *mode = x;
            
            
            if (mode.resultCode == 10000) {
                
                [self goTabarView];
                [YGUserDefaults setBool:YES forKey:islogin];
                [YGUserDefaults synchronize];
                
            }
            else{
                popAlert(mode.resultMsg, 2);
            }
            
        }
    }];

#pragma mark 短信登录验证码
    [self.viewModel.subscribeCommand_loginwith_codebtn.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        if ([x isKindOfClass:[commResBaseClass class]]) {
            
            
            commResBaseClass *mode = x;
            
            
            if (mode.resultCode == 10000) {
                
                [self.viewModel GWCountdown:for_login andsecond:60 andblock:^(NSInteger second) {
                    
                    if (second > 0) {
                        
                        [self.myview_code_login.codebtn setTitle:[NSString stringWithFormat:@"%@秒",@(second)] forState:UIControlStateNormal];
                        
                    }
                    else{
                        
                        [self.myview_code_login.codebtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                    }
                }];
                
            }
            else{
                popAlert(mode.resultMsg, 2);
            }
            
        }
    }];
    [self.viewModel.subscribeCommand_loginwithcode.executionSignals.switchToLatest subscribeNext:^(id x) {
#pragma mark 短信登录
        @strongify(self);
        
        
        if ([x isKindOfClass:[commResBaseClass class]]) {
            commResBaseClass *mode = x;
            [[GWProgressHUB sharedYGGWProgressHUB] YGDismiss:self.view];
            
            if (mode.resultCode == 10000) {
                
                [self goTabarView];
                [YGUserDefaults setBool:YES forKey:islogin];
                [YGUserDefaults synchronize];
            }
            else{
                popAlert(mode.resultMsg, 2);
            }
            
        }
        
        
        
    }];
    
#pragma mark 重置密码获取短信
    [self.viewModel.subscribeCommand_forgetpassowrd_codebtn.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        if ([x isKindOfClass:[commResBaseClass class]]) {
            
            
            commResBaseClass *mode = x;
            
            
            if (mode.resultCode == 10000) {
                
                [self.viewModel GWCountdown:for_password andsecond:60 andblock:^(NSInteger second) {
                    
                    if (second > 0) {
                        
                        [self.myforgetView.codebtn setTitle:[NSString stringWithFormat:@"%@秒",@(second)] forState:UIControlStateNormal];
                        
                    }
                    else{
                        
                        [self.myforgetView.codebtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                    }
                }];
                
            }
            else{
                popAlert(mode.resultMsg, 2);
            }
            
        }
    }];
    [self.viewModel.subscribeCommand_forgetpassowrd_reset.executionSignals.switchToLatest subscribeNext:^(id x) {
#pragma mark 请求重置密码
        @strongify(self);
        
        
        if ([x isKindOfClass:[commResBaseClass class]]) {
            commResBaseClass *mode = x;
            [[GWProgressHUB sharedYGGWProgressHUB] YGDismiss:self.view];
            
            if (mode.resultCode == 10000) {
                
                popAlert(mode.resultMsg, 2);
              
            }
            else{
                popAlert(mode.resultMsg, 2);
            }
            
        }
        
        
        
    }];

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.myview_reg.hidden = YES;
    
    [self.view addSubview:self.myview_reg];
    
    [self.myview_reg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    
    
    [self.view addSubview:self.myview];
    
    [self.myview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [self bindWithViewModel];
    
    
    self.myforgetView.hidden= YES;
    
    [self.view addSubview:self.myforgetView];
    
    [self.myforgetView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    self.myview_code_login.hidden= YES;
    [self.view addSubview:self.myview_code_login];
    
    [self.myview_code_login mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    
    // Do any additional setup after loading the view.
}
-(void)dealloc{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
