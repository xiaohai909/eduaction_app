//
//  Comment_configHeader.h
//  eduaction_app
//
//  Created by legendlxd on 2018/10/22.
//  Copyright © 2018年 diandang. All rights reserved.
//

#ifndef Comment_configHeader_h
#define Comment_configHeader_h
typedef NS_ENUM(NSInteger,GradientDirection)
{
    /** 从上至下*/
    topTobottom = 0,
    /** 从左至右*/
    leftToright,
    rightToleft,
    /** 从左上角至右下角*/
    upleftTolowRight,
    /** 从右上角至左下角*/
    uprightTolowLeft
};
#define isfirstUser @"isfirstUser"
#define islogin @"islogin"
#define YGUserDefaults  [NSUserDefaults standardUserDefaults]

#define k_appDelegate  ((AppDelegate *)[[UIApplication sharedApplication]delegate])
#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexRGBAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#define IS_IPHONE  [[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPhone
#define ZTWidth  [[UIScreen mainScreen]bounds].size.width
#define ZTHeight   [[UIScreen mainScreen]bounds].size.height
#define UI_IS_IPHONE_X           (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height >= 812.0f)
#define NaviIPHONEX  (UI_IS_IPHONE_X ? 88.0f : 64.0f)
#define TabIPHONEX    (UI_IS_IPHONE_X ? 83.0f : 49.0f)

#define YGUserDefaults  [NSUserDefaults standardUserDefaults]

#define YGNotFound(a,b)  [a rangeOfString:b].location ==NSNotFound
#define YGFound(a,b)  [a rangeOfString:b].location !=NSNotFound

#define lineColor_app  HexRGB(0xEFEFEF)
#define btn_selectcolor_black HexRGB(0x454545)
#define btn_normalcolor_white HexRGB(0xFFFFFF)

#define scale_w (ZTWidth/375.0)
#define scale_H (ZTHeight/667.0)


#define LL_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define LL_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define Iphone6Scale(x) ((x) * LL_SCREEN_WIDTH / 375.0f)

#define HeaderViewHeight 30
#define WeekViewHeight 40

#pragma mark 通知通用字符串


#endif /* Comment_configHeader_h */
