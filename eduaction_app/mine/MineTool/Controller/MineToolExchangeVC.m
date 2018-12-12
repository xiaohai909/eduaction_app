//
//  MineToolExchangeVC.m
//  eduaction_app
//
//  Created by Mac on 2018/12/11.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineToolExchangeVC.h"
#import "MineToolExchangeView.h"
#import "MineAttestationVC.h"

@interface MineToolExchangeVC ()

@end

@implementation MineToolExchangeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self setnavbg_defa];
    self.title = @"兑换中心";
    
    MineToolExchangeView *view = [MineToolExchangeView instancetypeWithXib];
    view.frame = (CGRect){0,0,ZTWidth,250};
    [self.view addSubview:view];
    @weakify(self)
    [[view.btn_send rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
       //判断是否认证
        @strongify(self)
        NSLog(@"%@",view.text_order.text);
        [self.navigationController pushViewController:[MineAttestationVC new] animated:YES];
        
    }];
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
