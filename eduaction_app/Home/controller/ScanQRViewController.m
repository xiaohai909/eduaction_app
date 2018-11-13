//
//  ScanQRViewController.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/2.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "ScanQRViewController.h"
#import "GWScanQr.h"
#import "QRcomfimViewController.h"
@interface ScanQRViewController ()<GWScanCodeManagerDelegate>
{
       BOOL isStop;
}
@property (strong,nonatomic)GWScanQRvC * scanQr;
@end

@implementation ScanQRViewController
-(GWScanQRvC *)scanQr
{
    if (!_scanQr)
    {
        
        _scanQr = [[GWScanQRvC alloc]initWithFrame:CGRectMake(0, -NaviIPHONEX, ZTWidth, ZTHeight)];
        _scanQr.titleL.text = NSLocalizedString(@"将二维码放入框内,即可自动扫描", nil);
        _scanQr.titleL.textColor = [UIColor whiteColor];
        _scanQr.backgroundAlpha = 0.45f;
        [_scanQr addTimer];
    }
    return _scanQr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     
     
    @{NSFontAttributeName:[UIFont systemFontOfSize:18],
    
    
    
    NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.title = @"扫一扫";
    
    
    
    
    
    [self.view addSubview:self.scanQr];
    [[GWScanCodeManager sharedScanQR]ScanQR:AVCaptureSessionPreset1920x1080 currentController:self AndViewFrame:_scanQr.contentView.frame];
    isStop = YES;
    
    [self.navigationItem setHidesBackButton:YES];
  
    
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setTitleColor:HexRGB(0xFF6B6B) forState:UIControlStateNormal];
    [back setTitle:@"关闭" forState:UIControlStateNormal];
    back.titleLabel.font = [UIFont systemFontOfSize:16];
    
    UIButton *album = [UIButton buttonWithType:UIButtonTypeCustom];
    [album setTitleColor:HexRGB(0xFF6B6B) forState:UIControlStateNormal];
    [album setTitle:@"相册" forState:UIControlStateNormal];
    album.titleLabel.font = [UIFont systemFontOfSize:16];
    
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:back];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:album];

    @weakify(self);
    [[back rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [[album rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {


    }];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    if (isStop) {
        
        [[GWScanCodeManager sharedScanQR] GWStartRunning];
        [self.scanQr addTimer];
        isStop = NO;
        
    }
    [GWScanCodeManager sharedScanQR].delegate = self;
    
    UIImage * bgImage = [CommonFunciton createImageWithColor:HexRGBAlpha(0x000000, 1.0)];
    
    [self.navigationController.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    
}
-(void)captureOutput:(GWScanCodeManager *)ScanQr didOutputMetadataObjects:(NSArray *)metadataObjects
{
    NSLog(@"metadataObjects = %@",metadataObjects);
    if (metadataObjects != nil && metadataObjects.count > 0)
    {
        [ScanQr GWStopRunning];
        [ScanQr SWPlaySoundName:@"SGQRCode.bundle/sound.caf"];
        isStop = YES;
        
        AVMetadataMachineReadableCodeObject *obj = metadataObjects.firstObject;
        NSString * qrS = [obj stringValue];
        
        
        NSRange codeLocation = [qrS rangeOfString:@"x/"];
        NSString *code = [qrS substringWithRange:NSMakeRange(codeLocation.location + 2, qrS.length - codeLocation.length - codeLocation.location)];
        NSLog(@"qrs %@",code);

        
    }
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [self.scanQr removeTimer];
    [[GWScanCodeManager sharedScanQR]GWStopRunning];
    [GWScanCodeManager sharedScanQR].delegate = nil;
    
}
-(void)dealloc{
    
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
