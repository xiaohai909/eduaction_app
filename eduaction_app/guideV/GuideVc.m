//
//  GuideVc.m
//  eduaction_app
//
//  Created by legendlxd on 2018/12/2.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "GuideVc.h"

@interface GuideVc ()

@end

@implementation GuideVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    [self initfunction:NO];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"这是引导页，点击进入App" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.height.mas_equalTo(44);
        make.width.mas_equalTo(220);
        make.centerY.mas_equalTo(self.view.mas_centerY);
    }];
    @weakify(self);
    [[[btn rac_signalForControlEvents:UIControlEventTouchUpInside] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        @strongify(self);
        [YGUserDefaults setBool:YES forKey:isfirstUser];
        [YGUserDefaults synchronize];
        
        if ([[myNetworkManager sharemyNetworkManager] sessionID].length > 0) {
            
            [self gologinView];
        }
        else{
            
            UIAlertController *alert = [CommonFunciton showAlert:@"程序初始化失败，请确认网络状态然后重试" AndOK_str:@"重试" AndCancel_str:@"" AndClickOK:^(int index) {
                
                @strongify(self);
                [self initfunction:YES];
                
            }];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];

    // Do any additional setup after loading the view.
}
-(void)initfunction:(BOOL)jump{
    
    @weakify(self);
    [self refreshSession:^(id  _Nonnull response) {
        @strongify(self);
        if (jump) {
            
              [self gologinView];
        }
        else{
            
        }
        
    } Andfailure:^(NSError * _Nonnull err) {
        
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
