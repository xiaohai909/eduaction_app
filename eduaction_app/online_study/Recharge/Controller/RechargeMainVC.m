//
//  RechargeMainVC.m
//  eduaction_app
//
//  Created by Mac on 2018/11/12.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "RechargeMainVC.h"
#import "RechargeMainView.h"
#import "RechargeMainBottomView.h"

@interface RechargeMainVC ()
@property (nonatomic, strong) RechargeMainView *view_main;
@property (nonatomic, strong) RechargeMainBottomView *view_bottom;
@end

@implementation RechargeMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setnavbg_defa];
    self.title = @"充值";
    
    //t设置界面
    [self setDefaultView];
    //设置初始值
    self.view_main.btn_left.backgroundColor = HexRGB(0xFFE7E7);
    self.view_main.blockCharge(@"￥248");
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)setDefaultView {
    self.view_main = [[RechargeMainView alloc] initWithFrame:(CGRect){0,0,ZTWidth,ZTHeight-NaviIPHONEX-44}];
    [self.view addSubview:self.view_main];
    
    @weakify(self)
    [self.view_main setBlockCharge:^(NSString * _Nonnull number) {
        @strongify(self)
        NSString *number_str = [NSString stringWithFormat:@"金额：%@",number];
        [self.view_bottom.btn_left setTitle:number_str forState:UIControlStateNormal];
        
        NSMutableAttributedString *atb_str = [[NSMutableAttributedString alloc] initWithString:number_str];
        [atb_str addAttributes:@{NSForegroundColorAttributeName:HexRGB(0xFF3D31),NSFontAttributeName:[UIFont systemFontOfSize:16]} range:NSMakeRange(3, number_str.length-3)];
        [atb_str addAttributes:@{NSForegroundColorAttributeName:HexRGB(0x525151)} range:NSMakeRange(0, 3)];
        [self.view_bottom.btn_left setAttributedTitle:atb_str forState:UIControlStateNormal];
    }];
    
    self.view_bottom = [[RechargeMainBottomView alloc] initWithFrame:(CGRect){0,self.view_main.py_bottom,ZTWidth,48} andViewType:BottomViewTypeRecharge];
    [self.view_bottom setBlockActionClick:^(NSString * _Nonnull title) {
        //立即开通
    }];
    [self.view addSubview:self.view_bottom];
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
