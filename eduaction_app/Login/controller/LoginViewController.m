//
//  LoginViewController.m
//  eduaction_app
//
//  Created by legendlxd on 2018/10/22.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "LoginViewController.h"
#import "loginview.h"
@interface LoginViewController ()
@property (nonatomic,strong)loginview *myview;
@end

@implementation LoginViewController
#pragma mark 登录界面
-(loginview *)myview
{
    if (!_myview)
    {
        _myview = [loginview creatXib];

    }
    return _myview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.myview];
    
    [self.myview mas_makeConstraints:^(MASConstraintMaker *make) {
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
