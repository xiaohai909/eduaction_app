//
//  ZYSideSlipFilterConfig.h
//  ZYSideSlipFilter
//
//  Created by zhiyi on 16/10/17.
//  Copyright © 2016年 zhiyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface ZYSideSlipFilterConfig : NSObject
#define LocalString(s) NSLocalizedString(s, nil)

//color
extern NSString * const FILTER_RED_STRING;
extern NSString * const FILTER_BLACK_STRING;
extern NSString * const FILTER_COLLECTION_ITEM_COLOR_NORMAL_STRING;
extern NSString * const FILTER_COLLECTION_ITEM_COLOR_SELECTED_STRING;
extern NSString * const FILTER_BACKGROUND_COVER_COLOR;
extern CGFloat    const FILTER_BACKGROUND_COVER_ALPHA;

//Notification
extern NSString * const FILTER_NOTIFICATION_NAME_DID_RESET_DATA;
extern NSString * const FILTER_NOTIFICATION_NAME_DID_COMMIT_DATA;

//UI
extern CGFloat const BOTTOM_BUTTON_FONT_SIZE;

//class
extern NSString * const FILTER_NAVIGATION_CONTROLLER_CLASS;
#define IS_IPHONE  [[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPhone
#define UI_IS_IPHONE_X           (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height >= 812.0f)
#define BOTTOM_BUTTON_HEIGHT UI_IS_IPHONE_X?64:44
@end
