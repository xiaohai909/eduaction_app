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
#import "cellphone_loginview.h"
#import "forgetpassview.h"
@interface LoginViewController ()
@property (nonatomic,strong)loginview *myview;
@property (nonatomic,strong)registerView *myview_reg;
@property (nonatomic,strong)cellphone_loginview *myview_code_login;
@property (nonatomic,strong)forgetpassview *myforgetView;
@end

@implementation LoginViewController
-(forgetpassview *)myforgetView
{
    if (!_myforgetView)
    {
        _myforgetView = [forgetpassview creatXib];
        
    }
    return _myforgetView;
}
#pragma mark 登录界面
-(loginview *)myview
{
    if (!_myview)
    {
        _myview = [loginview creatXib];

    }
    return _myview;
}
-(cellphone_loginview *)myview_code_login
{
    if (!_myview_code_login)
    {
        _myview_code_login = [cellphone_loginview creatXib];
        
    }
    return _myview_code_login;
}
-(registerView *)myview_reg
{
    if (!_myview_reg)
    {
        _myview_reg = [registerView creatXib];
        
    }
    return _myview_reg;
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
    
    [self.view addSubview:self.myview_code_login];
    
    [self.myview_code_login mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [self.view addSubview:self.myforgetView];
    
    [self.myforgetView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    
    
    // Do any additional setup after loading the view.
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
