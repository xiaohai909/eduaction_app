//
//  initAppVC.m
//  eduaction_app
//
//  Created by legendlxd on 2018/12/2.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "initAppVC.h"

@interface initAppVC ()

@end

@implementation initAppVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //[self initfunction:NO];
   
    
    UIImageView *image= [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, ZTWidth, ZTHeight)];
    [self.view addSubview:image];
    image.contentMode = UIViewContentModeScaleToFill;
    [image setImage:[UIImage imageNamed:@"guide_04"]];
    
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"App重新打开后先获取sessionid，成功后进入app" forState:UIControlStateNormal];
    btn.titleLabel.numberOfLines =2;
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[self.view addSubview:btn];
//    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(self.view.mas_centerX);
//        make.height.mas_equalTo(120);
//        make.width.mas_equalTo(220);
//        make.centerY.mas_equalTo(self.view.mas_centerY);
//    }];
    @weakify(self);
    [[[btn rac_signalForControlEvents:UIControlEventTouchUpInside] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        @strongify(self);
        
        if ([[myNetworkManager sharemyNetworkManager] sessionID].length > 0) {
            
            if (![YGUserDefaults boolForKey:islogin]) {
                [self gologinView];
            }
            else{
                [self goTabarView];
            }
        }
        else{
            
            UIAlertController *alert = [CommonFunciton showAlert:@"程序初始化失败，请确认网络状态然后重试" AndOK_str:@"重试" AndCancel_str:@"" AndClickOK:^(int index) {
                
                @strongify(self);
                [self initfunction:YES];
                
            }];
            
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];

    [self performSelector:@selector(testgo) withObject:nil afterDelay:3];
    // Do any additional setup after loading the view.
}
-(void)initfunction:(BOOL)jump{
    
    @weakify(self);
    [self refreshSession:^(id  _Nonnull response) {
        @strongify(self);
        if (jump) {
            if (![YGUserDefaults boolForKey:islogin]) {
                [self gologinView];
            }
            else{
                [self goTabarView];
            }
            
        }
        else{
            
        }
        
    } Andfailure:^(NSError * _Nonnull err) {
        
    }];
}
-(void)startfunction{
    
    if ([[myNetworkManager sharemyNetworkManager] sessionID].length > 0) {
        
        if (![YGUserDefaults boolForKey:islogin]) {
            [self gologinView];
        }
        else{
            [self goTabarView];
        }
    }
    else{
        
        UIAlertController *alert = [CommonFunciton showAlert:@"程序初始化失败，请确认网络状态然后重试" AndOK_str:@"重试" AndCancel_str:@"" AndClickOK:^(int index) {
            
            
            [self initfunction:YES];
            
        }];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}
-(void)testgo{
    
    if (![YGUserDefaults boolForKey:islogin]) {
        [self gologinView];
    }
    else{
        [self goTabarView];
    }
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
