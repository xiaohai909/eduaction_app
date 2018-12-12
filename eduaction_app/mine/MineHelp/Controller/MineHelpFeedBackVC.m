//
//  MineHelpFeedBackVC.m
//  eduaction_app
//
//  Created by Mac on 2018/12/12.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineHelpFeedBackVC.h"
#import "MineHelpFeedBackView.h"

@interface MineHelpFeedBackVC ()
@property (nonatomic, strong) UIButton *btn_send;

@end

@implementation MineHelpFeedBackVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self setnavbg_defa];
    self.title = @"意见反馈";
    
    MineHelpFeedBackView *view = [MineHelpFeedBackView instancetypeWithXib];
    view.frame = (CGRect){0,0,ZTWidth,350};
    [self.view addSubview:view];
    
    [self.view addSubview:self.btn_send];
}
- (UIButton *)btn_send
{
    if (!_btn_send) {
        _btn_send = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn_send.frame = (CGRect){0,ZTHeight-NaviIPHONEX-(NaviIPHONEX-20),ZTWidth,NaviIPHONEX-20};
        [_btn_send setTitle:@"提交反馈" forState:UIControlStateNormal];
        _btn_send.layer.masksToBounds = YES;
        [_btn_send setBackgroundImage:[CommonFunciton BgImageFromColors:@[HexRGB(0xFF5F5E),HexRGB(0xFC7456),HexRGB(0xFC7855)] withFrame:_btn_send.frame gradientDir:leftToright] forState:UIControlStateNormal];
        
        [[_btn_send rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
        }];
    }
    return _btn_send;
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
