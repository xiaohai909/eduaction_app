//
//  CommonFunciton.m
//  eduaction_app
//
//  Created by legendlxd on 2018/10/22.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "CommonFunciton.h"

@implementation CommonFunciton
+ (UIImage*) BgImageFromColors:(NSArray*)colors
                     withFrame: (CGRect)frame
                   gradientDir:(GradientDirection)gradientDir

{
    
    NSMutableArray *ar = [NSMutableArray array];
    
    for(UIColor *c in colors) {
        
        [ar addObject:(id)c.CGColor];
        
    }
    
    UIGraphicsBeginImageContextWithOptions(frame.size, YES, 1);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    
    CGPoint start;
    
    CGPoint end;
    
    switch (gradientDir)
    {
        case topTobottom:
        {
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, frame.size.height);
        }
            break;
        case leftToright:
        {
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(frame.size.width, 0.0);
        }
            break;
        case rightToleft:
        {
            start = CGPointMake(frame.size.width, 0.0);
            end = CGPointMake(0.0, 0.0);;
        }
            break;
        case upleftTolowRight:
        {
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(frame.size.width, frame.size.height);
        }
            break;
        case uprightTolowLeft:
        {
            start = CGPointMake(frame.size.width, 0.0);
            end = CGPointMake(0.0, frame.size.height);
        }
            break;
            
        default:
            break;
    }
    
    CGContextDrawLinearGradient(context, gradient, start, end,kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    
    CGContextRestoreGState(context);
    
    CGColorSpaceRelease(colorSpace);
    
    UIGraphicsEndImageContext();
    
    return image;
    
}
+(CAGradientLayer *)YGLinearGradient:(NSArray *)colorArr
                           locations:(NSArray *)locations
                          startPoint:(CGPoint)startPoint
                            endPoint:(CGPoint)endPoint
                           viewframe:(CGRect )AddViewframe
{
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = colorArr;
    gradientLayer.locations = locations;
    //        startPoint&endPoint 颜色渐变的方向，范围在(0,0)与(1.0,1.0)之间，如(0,0)(1.0,0)代表水平方向渐变,(0,0)(0,1.0)代表竖直方向渐变
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    gradientLayer.frame = CGRectMake(0, 0, AddViewframe.size.width, AddViewframe.size.height);
    return gradientLayer;
}
+ (void)drawLinearGradient:(CGContextRef)context
                      path:(CGPathRef)path startColor:(CGColorRef)startColor
                  endColor:(CGColorRef)endColor
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    CGRect pathRect = CGPathGetBoundingBox(path);
    //具体方向可根据需求修改
    CGPoint startPoint = CGPointMake(CGRectGetMinX(pathRect), CGRectGetMidY(pathRect));
    CGPoint endPoint = CGPointMake(CGRectGetMaxX(pathRect), CGRectGetMidY(pathRect));
    CGContextSaveGState(context); CGContextAddPath(context, path); CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context); CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}
@end
