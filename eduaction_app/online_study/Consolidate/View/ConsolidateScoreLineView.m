//
//  ConsolidateScoreLineView.m
//  eduaction_app
//
//  Created by Mac on 2018/11/14.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "ConsolidateScoreLineView.h"

@interface ConsolidateScoreLineView()
{
    CGFloat standard;//达标线
    NSArray *array_numbers;//
}
@end


@implementation ConsolidateScoreLineView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)creatBezierPathViewWithNumbers:(NSArray *)numbers{//曲线图
    //参数先设置
    standard = 0.5;
    array_numbers = numbers;
    
    //背景层
    [self creatBg];
    [self creatBgLine:numbers.count];//竖线的数量
    //曲线
    [self creatBezierPath];
    [self creatStandard];//标准线C
    
    [self creatCoordinate];//坐标
    [self creatCircles];//小圈圈
    
    
    //！
    UILabel *lbl_title = [[UILabel alloc] initWithFrame:(CGRect){0,50,self.py_width,20}];
    lbl_title.textColor = HexRGB(0xFF6B6B);
    lbl_title.textAlignment = NSTextAlignmentCenter;
    lbl_title.font = [UIFont systemFontOfSize:11];
    lbl_title.text = @"*80%的用户要每周坚持5天以上达标，才能通过考试哦";
    [self addSubview:lbl_title];
    
    UILabel *lbl_number1 = [[UILabel alloc] initWithFrame:(CGRect){0,self.image_layer.frame.size.height+self.image_layer.frame.origin.y+50,100,20}];
    lbl_number1.py_centerX = self.py_centerX-20;
    lbl_number1.textColor = HexRGB(0x333333);
    lbl_number1.textAlignment = NSTextAlignmentCenter;
    lbl_number1.font = [UIFont systemFontOfSize:14];
    lbl_number1.text = @"本周做题数目";
    [self addSubview:lbl_number1];
    
    UILabel *lbl_number2 = [[UILabel alloc] initWithFrame:(CGRect){lbl_number1.py_right,lbl_number1.py_centerY,50,20}];
    lbl_number2.py_centerY = lbl_number1.py_centerY;
    lbl_number2.textColor = HexRGB(0xffffff);
    lbl_number2.backgroundColor = HexRGB(0x1BB3FF);
    lbl_number2.textAlignment = NSTextAlignmentCenter;
    lbl_number2.font = [UIFont systemFontOfSize:10];
    lbl_number2.text = @"达标0天";
    lbl_number2.layer.cornerRadius = 5.0;
    lbl_number2.layer.masksToBounds = YES;
    [self addSubview:lbl_number2];
    
    UILabel *lbl_number3 = [[UILabel alloc] initWithFrame:(CGRect){lbl_number1.py_x,lbl_number1.py_bottom+2,lbl_number1.py_width,20}];
    lbl_number3.py_centerX = self.py_centerX-20;
    lbl_number3.textColor = HexRGB(0x999999);
    lbl_number3.textAlignment = NSTextAlignmentCenter;
    lbl_number3.font = [UIFont systemFontOfSize:12];
    lbl_number3.text = @"连续做题1天";
    [self addSubview:lbl_number3];

}
//背景
- (void)creatBg
{
    self.image_layer = [[CALayer alloc] init];
    self.image_layer.backgroundColor = HexRGBAlpha(0xF0F0F0,0.5).CGColor;
    self.image_layer.frame = (CGRect){52,100,self.py_width-51-30,110};
    [self.layer addSublayer:self.image_layer];
    
    //背景
    for (int i=0; i<2; i++) {
        CGRect frame = (CGRect){0,1+self.image_layer.frame.size.height/2*i,self.image_layer.frame.size.width,self.image_layer.frame.size.height/4-2};
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = HexRGB(0xFFFFFF).CGColor;
        layer.frame = frame;
        [self.image_layer addSublayer:layer];
    }
}

- (void)creatCoordinate
{
    //坐标轴
    CALayer *layer_x = [[CALayer alloc] init];
    layer_x.backgroundColor = HexRGB(0xFF6B6B).CGColor;
    layer_x.frame = (CGRect){0,self.image_layer.frame.size.height-2,self.image_layer.frame.size.width,2};
    [self.image_layer addSublayer:layer_x];
    
    CALayer *layer_y = [[CALayer alloc] init];
    layer_y.backgroundColor = HexRGB(0xFF6B6B).CGColor;
    layer_y.frame = (CGRect){0,0,2,self.image_layer.frame.size.height};
    [self.image_layer addSublayer:layer_y];
}
- (void)creatBgLine:(NSInteger)lineNumber
{
    CGFloat width = self.image_layer.frame.size.width/(lineNumber+1);
    for (int i = 0; i<lineNumber+2; i++) {
        CGRect frame = (CGRect){width*i,0,1,self.image_layer.frame.size.height-1};
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = HexRGB(0xF0F0F0).CGColor;
        layer.frame = frame;
        [self.image_layer addSublayer:layer];
    }
}
- (void)creatStandard
{
    //达标
    CALayer *layer_standard = [[CALayer alloc] init];
    layer_standard.backgroundColor = HexRGB(0xFF6B6B).CGColor;
    layer_standard.frame = (CGRect){0,self.image_layer.frame.size.height*(1-standard),self.image_layer.frame.size.width,1};
    [self.image_layer addSublayer:layer_standard];
    
    UILabel *lbl_standard = [[UILabel alloc] initWithFrame:(CGRect){5,0,self.image_layer.frame.origin.x-5,50}];
    lbl_standard.py_centerY = self.image_layer.frame.origin.y+layer_standard.frame.origin.y+layer_standard.frame.size.height/2;
    lbl_standard.textColor = HexRGB(0x333333);
    lbl_standard.numberOfLines = 0;
    lbl_standard.font = [UIFont systemFontOfSize:13];
    lbl_standard.text = [NSString stringWithFormat:@"达标线(%@)",@"500"];
    [self addSubview:lbl_standard];
}


- (void)creatBezierPath
{
    CAShapeLayer *layer_line = [[CAShapeLayer alloc] init];
    layer_line.frame = (CGRect){0,0,self.image_layer.frame.size.width,self.image_layer.frame.size.height};
    UIBezierPath *path_line = [UIBezierPath bezierPath];
    path_line.lineCapStyle = kCGLineCapRound;
    path_line.lineJoinStyle = kCGLineJoinRound;
    [path_line moveToPoint:(CGPoint){0,self.image_layer.frame.size.height}];
    
    
    CAShapeLayer *layer_space = [[CAShapeLayer alloc] init];
    layer_space.frame = (CGRect){0,0,self.image_layer.frame.size.width,self.image_layer.frame.size.height};
    UIBezierPath *path_space = [UIBezierPath bezierPath];
    path_space.lineCapStyle = kCGLineCapRound;
    path_space.lineJoinStyle = kCGLineJoinRound;
    [path_space moveToPoint:(CGPoint){0,self.image_layer.frame.size.height}];
    
    
    //小圈圈
    [self.image_layer addSublayer:[self creatCircleLayer:(CGPoint){-2,self.image_layer.frame.size.height-2}]];
    
    
    CGFloat width = self.image_layer.frame.size.width/array_numbers.count;
    for (int i=0; i<array_numbers.count; i++) {
        NSInteger number = [array_numbers[i] integerValue];
        [path_line addLineToPoint:(CGPoint){width*i+width,self.image_layer.frame.size.height*(1-number/1000.0)}];
        [path_space addLineToPoint:(CGPoint){width*i+width,self.image_layer.frame.size.height*(1-number/1000.0)}];
        
        //小圈圈 曲线上，y轴上
        [self.image_layer addSublayer:[self creatCircleLayer:(CGPoint){width*i+width,self.image_layer.frame.size.height*(1-number/1000.0)}]];
        [self.image_layer addSublayer:[self creatCircleLayer:(CGPoint){width*i+width-2,self.image_layer.frame.size.height-2}]];
        
    }

    
    layer_line.path = path_line.CGPath;
    layer_line.strokeColor = HexRGB(0xFF6B6B).CGColor;
    layer_line.fillColor = [UIColor clearColor].CGColor;
    layer_line.lineWidth = 2;
    
    [path_space addLineToPoint:(CGPoint){self.image_layer.frame.size.width,self.image_layer.frame.size.height}];
    [path_space closePath];
    layer_space.path = path_space.CGPath;
    layer_space.strokeColor = HexRGB(0xFDD8D8).CGColor;
    layer_space.fillColor = HexRGB(0xFDD8D8).CGColor;


    
    [self.image_layer addSublayer:layer_space];
    [self.image_layer addSublayer:layer_line];

}
- (void)creatCircles
{
    //小圈圈
    [self.image_layer addSublayer:[self creatCircleLayer:(CGPoint){-2,self.image_layer.frame.size.height-2}]];
    
    CGFloat width = self.image_layer.frame.size.width/array_numbers.count;
    for (int i=0; i<array_numbers.count; i++) {
        NSInteger number = [array_numbers[i] integerValue];
        //小圈圈 曲线上，y轴上
        [self.image_layer addSublayer:[self creatCircleLayer:(CGPoint){width*i+width,self.image_layer.frame.size.height*(1-number/1000.0)}]];
        [self.image_layer addSublayer:[self creatCircleLayer:(CGPoint){width*i+width-2,self.image_layer.frame.size.height-2}]];
        
       [self addSubview:[self creatLableTime:(CGPoint){width*i+width,self.image_layer.frame.size.height}]];
    }
}
- (CAShapeLayer *)creatCircleLayer:(CGPoint)center
{
    CAShapeLayer *layer_circle = [[CAShapeLayer alloc] init];
    layer_circle.frame = (CGRect){center.x-4,center.y-4,8,8};
    layer_circle.backgroundColor = [UIColor whiteColor].CGColor;
    layer_circle.borderColor = HexRGB(0xFF6B6B).CGColor;
    layer_circle.borderWidth = 2;
    layer_circle.cornerRadius = 4;
    layer_circle.masksToBounds = YES;
    return layer_circle;
}
- (UILabel *)creatLableTime:(CGPoint)center
{
    UILabel *lbl_time = [[UILabel alloc] initWithFrame:(CGRect){0,50,50,20}];
    lbl_time.py_centerX = center.x+self.image_layer.frame.origin.x;
    lbl_time.py_centerY = center.y+self.image_layer.frame.origin.y+20;
    lbl_time.textColor = HexRGB(0xFF6B6B);
    lbl_time.textAlignment = NSTextAlignmentCenter;
    lbl_time.font = [UIFont systemFontOfSize:9];
    lbl_time.text = @"时间";
    return lbl_time;
}
@end
