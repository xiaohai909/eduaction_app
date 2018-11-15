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
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
+ (NSString*)dictionaryToJson:(NSDictionary *)dic

{
    
    NSError *parseError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
}
+ (UIImage*)createImageWithColor:(UIColor*)color{
    
    CGRect rect=CGRectMake(0.0f,0.0f,1.0f,1.0f);UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    UIImage *theImage=UIGraphicsGetImageFromCurrentImageContext();UIGraphicsEndImageContext();
    return theImage;
    
}
@end


//左右：1：图片 文字   2：文字 图片
//上下：3：图片 文字   4：文字 图片
@implementation UIButton (Creat_Category)

- (void)setVerticalModeTopOffset:(CGFloat)topOffset andBottom:(CGFloat)bottomOffset {
    
    [self setImageEdgeInsets:UIEdgeInsetsMake(-(self.py_height - self.imageView.py_height) / 2 + topOffset, (self.py_width - self.imageView.py_width) / 2 - self.imageView.py_x, 0, -(self.py_width - self.imageView.py_width) / 2 + self.imageView.py_x)];
    
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, (self.py_width - self.titleLabel.py_width) / 2 - self.titleLabel.py_x, -((self.py_height - self.titleLabel.py_height) / 2 + (self.py_height - (self.titleLabel.py_bottom)) / 2) + bottomOffset, self.titleLabel.py_x - (self.py_width - self.titleLabel.py_width) / 2)];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)setHorizontalModeLeftOffset:(CGFloat)leftOffset andRight:(CGFloat)rightOffset {
    
    CGFloat titleLeft = self.imageView.py_width;
    if (leftOffset && self.titleLabel.py_x - self.imageView.py_width > leftOffset) {
        titleLeft -= -titleLeft - leftOffset;
    }
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -titleLeft, 0, titleLeft)];
    
    CGFloat imageRight = self.titleLabel.py_width;
    if (rightOffset && self.py_width > self.imageView.py_right + rightOffset) {
        imageRight += imageRight - rightOffset;
    }
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, imageRight, 0, -imageRight)];
}

@end


@implementation UIViewController (Pop_Category)

- (void)showViewInWindowWithView:(UIView *)view
{
    UIButton *bg = [[UIApplication sharedApplication].keyWindow viewWithTag:110];
    if (!bg) {
        bg = [UIButton buttonWithType:UIButtonTypeCustom];
        bg.frame = CGRectMake(0, 0, ZTWidth, ZTHeight);
    }
    bg.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.5];
    bg.tag = 110;
    [bg addSubview:view];
    [[bg rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self hideViewInWindowView:view];
    }];
    [[UIApplication sharedApplication].keyWindow addSubview:bg];
    [UIView animateWithDuration:0.3 animations:^{
        view.py_bottom = ZTHeight;
    }];
}

- (void)hideViewInWindowView:(UIView *)view
{
    [UIView animateWithDuration:0.3 animations:^{
        view.py_y = ZTHeight;
    } completion:^(BOOL finished) {
        [view.superview removeFromSuperview];
        [view removeFromSuperview];
    }];
}
@end


@implementation UIView (Creat_Category)
+(instancetype)instancetypeWithXib
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
}

@end
