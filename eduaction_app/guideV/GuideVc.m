//
//  GuideVc.m
//  eduaction_app
//
//  Created by legendlxd on 2018/12/2.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "GuideVc.h"

@interface GuideVc ()
{
    UIScrollView *scV;
}
@end

@implementation GuideVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    scV =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, ZTWidth, ZTHeight)];
    scV.contentSize = CGSizeMake(ZTWidth*3,ZTHeight);
    scV.pagingEnabled = YES;
    [self.view addSubview:scV];
    
    
    NSArray *arr =@[@"guide_01",@"guide_02",@"guide_03"];
    
    for (NSInteger i= 0 ; i<3; i++) {
        
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(ZTWidth*i, 0, ZTWidth, ZTHeight)];
        image.contentMode = UIViewContentModeScaleToFill;
        [image setImage:[UIImage imageNamed:arr[i]]];
        [scV addSubview:image];
    }
    scV.showsHorizontalScrollIndicator=NO;
    [self initfunction:NO];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor clearColor];
    //[btn setTitle:@"这是引导页，点击进入App" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scV addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.height.mas_equalTo(Iphone6Scale_height(47));
        make.width.mas_equalTo(235);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-Iphone6Scale_height(48));
    }];
    @weakify(self);
    [[[btn rac_signalForControlEvents:UIControlEventTouchUpInside] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
        @strongify(self);
        if (self->scV.contentOffset.x >= 2*ZTWidth) {
            
        
        
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
