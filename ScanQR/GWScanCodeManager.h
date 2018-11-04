//
//  GWScanCodeManager.h
//  ZTCallLinPhone
//
//  Created by MacBook on 2017/9/1.
//  Copyright © 2017年 2017 ABB Genway Xiamen Electrical Equipment Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <ImageIO/ImageIO.h>
@class GWScanCodeManager;

@protocol GWScanCodeManagerDelegate <NSObject>

@required

/**
  二维码扫描获取数据

 @param ScanQr 单例
 @param metadataObjects 扫描二维码数据信息
 */
-(void)captureOutput:(GWScanCodeManager *)ScanQr didOutputMetadataObjects:(NSArray *)metadataObjects;

@optional

/**
 根据光线强弱值判断是否打开手电筒

 @param ScanQr ScanQr
 @param sampleBufferValue <#sampleBufferValue description#>
 */
-(void)captureOutput:(GWScanCodeManager *)ScanQr didOutputSampleBuffer:(CGFloat)sampleBufferValue;

@end

@interface GWScanCodeManager : NSObject<AVCaptureVideoDataOutputSampleBufferDelegate,AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic, strong) AVCaptureSession * session;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer  * videoPreviewLayer;
@property (weak,nonatomic)id<GWScanCodeManagerDelegate>delegate;

/**
 二维码扫描

 @return <#return value description#>
 */
+(GWScanCodeManager *)sharedScanQR;

/**
 扫描访问权限
 */
-(void)GWSacnQR:(void(^)(BOOL grant))grant;

/**
 集成扫描功能

 @param sessionPreset <#sessionPreset description#>
 @param currentController <#currentController description#>
 */
-(void)ScanQR:(NSString *)sessionPreset currentController:(UIViewController *)currentController AndViewFrame:(CGRect)viewFrame;

/**
 开始扫描
 */
- (void)GWStartRunning;

/**
 停止扫描
 */
- (void)GWStopRunning;

/**
 移除 videoPreviewLayer 对象
 */
- (void)GWVideoPreviewLayerRemoveFromSuperlayer;

/**
 播放音效文件

 @param name <#name description#>
 */
- (void)SWPlaySoundName:(NSString *)name;




@end
