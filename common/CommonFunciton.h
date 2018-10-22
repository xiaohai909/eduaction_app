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
@end

NS_ASSUME_NONNULL_END
