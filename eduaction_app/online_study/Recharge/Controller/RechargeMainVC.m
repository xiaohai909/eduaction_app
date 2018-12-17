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

#import "RechargeModel.h"

@interface RechargeMainVC ()
@property (nonatomic, strong) RechargeMainView *view_main;
@property (nonatomic, strong) RechargeMainBottomView *view_bottom;
@property (nonatomic, strong) NSMutableArray<RechargeModel *> *array_model;
@end

@implementation RechargeMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setnavbg_defa];
    self.title = @"充值";
    
    self.array_model = [NSMutableArray array];
    [self request];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)setDefaultView {
    self.view_main = [[RechargeMainView alloc] initWithFrame:(CGRect){0,0,ZTWidth,ZTHeight-NaviIPHONEX-44}];
    [self.view addSubview:self.view_main];
    
    @weakify(self)
    [self.view_main setBlockCharge:^(RechargeModel * _Nonnull model) {
        @strongify(self)
        NSString *number_str = [NSString stringWithFormat:@"金额：￥%@",model.buyMoney];
        [self.view_bottom.btn_left setTitle:number_str forState:UIControlStateNormal];
        
        NSMutableAttributedString *atb_str = [[NSMutableAttributedString alloc] initWithString:number_str];
        [atb_str addAttributes:@{NSForegroundColorAttributeName:HexRGB(0xFF3D31),NSFontAttributeName:[UIFont systemFontOfSize:16]} range:NSMakeRange(3, number_str.length-3)];
        [atb_str addAttributes:@{NSForegroundColorAttributeName:HexRGB(0x525151)} range:NSMakeRange(0, 3)];
        [self.view_bottom.btn_left setAttributedTitle:atb_str forState:UIControlStateNormal];
    }];
    [self.view_main setBlockPayType:^(NSInteger type) {
//        @strongify(self)
        NSLog(@"%ld",(long)type);
    }];
    
    self.view_bottom = [[RechargeMainBottomView alloc] initWithFrame:(CGRect){0,self.view_main.py_bottom,ZTWidth,48} andViewType:BottomViewTypeRecharge];
    [self.view_bottom setBlockActionClick:^(NSString * _Nonnull title) {
        //立即开通
    }];
    [self.view addSubview:self.view_bottom];
    
    //设置初始值
    if (self.array_model.count > 0) {
        [self.view_main setModels:self.array_model];
        self.view_main.blockCharge(self.array_model[0]);
        self.view_main.btn_left.backgroundColor = HexRGB(0xFFE7E7);
    }
}
#pragma mark --- request
- (void)request
{
    [SQNetworkInterface iRequestRechargeAndResult:^(NSInteger state, NSString * _Nonnull msg, NSString * _Nonnull total, id  _Nonnull resultData) {
        if (state == CODE_SUCCESS) {
            self.array_model = [RechargeModel mj_objectArrayWithKeyValuesArray:resultData];
            //t设置界面
            [self setDefaultView];
        }
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
