//
//  QRcomfimViewController.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/2.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "QRcomfimViewController.h"

@interface QRcomfimViewController ()

@end

@implementation QRcomfimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     
     
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       
       
       
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.title = @"扫描二维码登录";
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setImage:[UIImage imageNamed:@"top_btn_return"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:back];
    
    [[back rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [self.confimrBtn setBackgroundImage:[CommonFunciton BgImageFromColors:@[HexRGB(0xFF5F5E),HexRGB(0xFC7456),HexRGB(0xFC7855)] withFrame:self.confimrBtn.frame gradientDir:leftToright] forState:UIControlStateNormal];
    
    [self.navigationController.navigationBar setBackgroundImage:[CommonFunciton BgImageFromColors:@[HexRGB(0xFF5F5E),HexRGB(0xFC7456),HexRGB(0xFC7855)] withFrame:CGRectMake(0, 0, ZTWidth, NaviIPHONEX) gradientDir:leftToright] forBarMetrics:UIBarMetricsDefault];
    
    
    [self.confimrBtn.layer setMasksToBounds:YES];
    [self.confimrBtn.layer setCornerRadius:20];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)confirmBtnclick:(id)sender {
    
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
