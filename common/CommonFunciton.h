//
//  CommonFunciton.h
//  eduaction_app
//
//  Created by legendlxd on 2018/10/22.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommonFunciton : NSObject
+(UIViewController *)theTopviewControler;
+ (void)drawLinearGradient:(CGContextRef)context
                      path:(CGPathRef)path startColor:(CGColorRef)startColor
                  endColor:(CGColorRef)endColor;
+ (UIImage*) BgImageFromColors:(NSArray*)colors
                     withFrame: (CGRect)frame
                   gradientDir:(GradientDirection)gradientDir;
+(CAGradientLayer *)YGLinearGradient:(NSArray *)colorArr
                           locations:(NSArray *)locations
                          startPoint:(CGPoint)startPoint
                            endPoint:(CGPoint)endPoint
                           viewframe:(CGRect )AddViewframe;
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;
+ (UIImage*)createImageWithColor:(UIColor*)color;

+(UIAlertController *)showAlert:(NSString *)message  AndOK_str:(NSString *)oktitle AndCancel_str:(NSString *)canceltitle AndClickOK:(void (^)(int index))OK;

+(CGFloat)getSpaceLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width;
+(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font;

@end



@interface UIButton (Creat_Category)
- (void)setVerticalModeTopOffset:(CGFloat)topOffset andBottom:(CGFloat)bottomOffset;
- (void)setHorizontalModeLeftOffset:(CGFloat)leftOffset andRight:(CGFloat)rightOffset;
@end

@interface UIViewController (Pop_Category)
- (void)showViewInWindowWithView:(UIView *)view;
- (void)hideViewInWindowView:(UIView *)view;
@end

@interface UIView (Creat_Category)
+(instancetype)instancetypeWithXib;
+ (CGFloat)viewGetHeightWithContent:(NSString *)content width:(CGFloat)width font:(CGFloat)font;
+ (CGFloat)viewGetWidthWithContent:(NSString *)content height:(CGFloat)height font:(CGFloat)font;
- (void)showViewInViewWithView:(UIView *)view;
- (void)hideViewInView:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
