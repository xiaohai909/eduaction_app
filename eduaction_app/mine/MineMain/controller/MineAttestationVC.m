//
//  MineAttestationVC.m
//  eduaction_app
//
//  Created by Mac on 2018/12/11.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "MineAttestationVC.h"
#import "MineAttestationView.h"
@interface MineAttestationVC ()
@property (nonatomic, strong) UIButton *btn_send;
@end

@implementation MineAttestationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [self setnavbg_defa];
    self.title = @"实名认证";
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:(CGRect){0,0,ZTWidth,ZTHeight-NaviIPHONEX-NaviIPHONEX}];
    scrollView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    MineAttestationView *view = [MineAttestationView instancetypeWithXib];
    view.frame = (CGRect){0,10,scrollView.py_width,view.height_Attestation};
    [scrollView addSubview:view];
    scrollView.contentSize = CGSizeMake(scrollView.py_width, view.py_height+10);
    
    
    [self.view addSubview:self.btn_send];
}
- (UIButton *)btn_send
{
    if (!_btn_send) {
        _btn_send = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn_send.frame = (CGRect){30,ZTHeight-NaviIPHONEX-NaviIPHONEX+(NaviIPHONEX-45)/2,ZTWidth-60,45};
        [_btn_send setTitle:@"提交" forState:UIControlStateNormal];
        _btn_send.layer.cornerRadius = _btn_send.py_height/2;
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
