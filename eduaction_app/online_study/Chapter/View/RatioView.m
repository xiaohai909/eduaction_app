//
//  RatioView.m
//  eduaction_app
//
//  Created by Mac on 2018/11/5.
//  Copyright © 2018 diandang. All rights reserved.
//

#import "RatioView.h"

@interface RatioView(){
    //外界不需要知道的成员变量
    //根据传进来的维度生成的
    CGFloat radius;//半径
    CGFloat ratioNumber;//值
    CGPoint centrePoint;//蜘蛛网的中心点
    RatioViewType ratioType;
    
    CAShapeLayer *layer_line;//线条层
    CAShapeLayer *layer_bottom;//背景层
    CAShapeLayer *layer_number;//数据层
}
@end

@implementation RatioView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
//+ (RatioView *)ratioViewWith:(CGRect)frame type:(RatioViewType)ratioType {
//
//    RatioView *ratioView = [[RatioView alloc] init];
//
//    return ratioView;
//}

- (void)creatRatioViewWithNumber:(CGFloat)number andType:(RatioViewType)type{
    ratioNumber = number*100;
    ratioType = type;
    centrePoint = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);

    //线条
    if (type == RatioViewTypeRedLine) {
        [self creatLineLayer:(CGRect){0,0,self.py_width-10,self.py_width-10}];
        [self creatBottomLayer:(CGRect){0,0,self.py_width-30,self.py_width-30}];
        [self creatNumberLayer:(CGRect){0,0,self.py_width-30,self.py_width-30}];
        [self creatLbl:(CGRect){0,0,self.py_width-40,self.py_width-40}];
        self.lbl_number.center = centrePoint;
    }
    else if (type == RatioViewTypeYellowLine) {
        [self creatBottomLayer:(CGRect){0,0,self.py_width-15,self.py_width-15}];
        if (ratioNumber) {
            [self creatNumberLayer:(CGRect){0,0,self.py_width-15,self.py_width-15}];
        }
        [self creatLbl:(CGRect){0,0,self.py_width-25,self.py_width-25}];
        self.lbl_number.center = centrePoint;
    }//饼图
    else{
        [self creatBottomLayer:(CGRect){0,0,self.py_width-35,self.py_width-35}];
        if (ratioNumber) {
            [self creatNumberLayer:(CGRect){0,0,self.py_width-25,self.py_width-25}];
        }
        [self creatLbl:(CGRect){0,self.py_width-15,self.py_width,15}];
    }
}

- (void)creatColorfulRatioViewWithNumbers:(NSArray *)numbers
{
    ratioType = RatioViewTypeColorful;
    
    NSArray *colors = @[HexRGB(0xAED56E),HexRGB(0x26C6DA),HexRGB(0xF9A411)];
    for (int i=0; i<numbers.count; i++) {
        centrePoint = CGPointMake(self.frame.size.width/2-((i==0)?2:0), self.frame.size.height/2);
        UIColor *color = colors[i];
        CGFloat from_number = 0;
        for (int j=i-1; j>=0; j--) {
            from_number += [numbers[j] floatValue]*100;
        }
        ratioNumber = [numbers[i] floatValue]*100;
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.frame = (CGRect){0,0,self.py_width-i*2,self.py_width-i*2};
        radius = layer.frame.size.width/2.0;
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:centrePoint];
        [path addArcWithCenter:centrePoint radius:radius startAngle:-M_PI_2-(2*M_PI)/100.0*from_number endAngle:-M_PI_2-(2*M_PI)/100.0*(from_number+ratioNumber) clockwise:NO];
        [path closePath];
        
        layer.path = path.CGPath;
        layer.strokeColor = color.CGColor;
        layer.fillColor = color.CGColor;
        
        layer.shadowColor = HexRGBAlpha(0x638AFF, 0.2).CGColor;
        layer.shadowOffset = CGSizeMake(2,2);
        layer.shadowRadius = 2;
        
        [self.layer addSublayer:layer];
    }
}

#pragma mark --- creat
- (void)creatLineLayer:(CGRect)frame
{
    layer_line = [CAShapeLayer layer];
    layer_line.frame = frame;
    radius = layer_line.frame.size.width/2.0;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:centrePoint radius:radius startAngle:-M_PI_2 endAngle:M_PI+M_PI_4/2 clockwise:YES];
    
    layer_line.path = path.CGPath;
    layer_line.strokeColor = [[UIColor redColor] colorWithAlphaComponent:0.5].CGColor;
    layer_line.fillColor = [UIColor clearColor].CGColor;
    layer_line.lineWidth = 1.0;
    
    [self.layer addSublayer:layer_line];
}

- (void)creatBottomLayer:(CGRect)frame {
    layer_bottom = [CAShapeLayer layer];
    layer_bottom.frame = frame;
    radius = layer_bottom.frame.size.width/2.0;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:centrePoint radius:radius startAngle:-M_PI_2 endAngle:2*M_PI-M_PI_2 clockwise:YES];
    
    layer_bottom.path = path.CGPath;
    if (ratioType == RatioViewTypeRedLine) {
        layer_bottom.strokeColor = HexRGB(0xF2E1E1).CGColor;
        layer_bottom.fillColor = [UIColor clearColor].CGColor;
        layer_bottom.lineWidth = 8.0;
    }
    else if (ratioType == RatioViewTypeYellowLine) {
        layer_bottom.strokeColor = HexRGB(0xFFF0DF).CGColor;
        layer_bottom.fillColor = [UIColor clearColor].CGColor;
        layer_bottom.lineWidth = 8.0;
    }
    else if (ratioType == RatioViewTypeBlue) {
        layer_bottom.strokeColor = HexRGB(0xDFF0FF).CGColor;
        layer_bottom.fillColor = HexRGB(0xDFF0FF).CGColor;
        layer_bottom.lineWidth = 5.0;
    }
    else if (ratioType == RatioViewTypeYellow){
        layer_bottom.strokeColor = HexRGB(0xFFF0DF).CGColor;
        layer_bottom.fillColor = HexRGB(0xFFF0DF).CGColor;
        layer_bottom.lineWidth = 5.0;
    }
    
    [self.layer addSublayer:layer_bottom];
}

- (void)creatNumberLayer:(CGRect)frame {
    layer_number = [CAShapeLayer layer];
    layer_number.frame = frame;
    radius = layer_number.frame.size.width/2.0;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    if (ratioType == RatioViewTypeRedLine) {
        [path addArcWithCenter:centrePoint radius:radius startAngle:-M_PI_2 endAngle:(2*M_PI)/100.0*ratioNumber-M_PI_2 clockwise:YES];
        layer_number.strokeColor = HexRGB(0xFF6F69).CGColor;
        layer_number.fillColor = [UIColor clearColor].CGColor;
        layer_number.lineWidth = 8.0;
    }
    else if (ratioType == RatioViewTypeYellowLine) {
        [path addArcWithCenter:centrePoint radius:radius startAngle:-M_PI_2 endAngle:(2*M_PI)/100.0*ratioNumber-M_PI_2 clockwise:YES];
        layer_number.strokeColor = HexRGB(0xFFA841).CGColor;
        layer_number.fillColor = [UIColor clearColor].CGColor;
        layer_number.lineWidth = 8.0;
    }
    else if (ratioType == RatioViewTypeBlue) {
        [path moveToPoint:centrePoint];
        [path addArcWithCenter:centrePoint radius:radius startAngle:-M_PI_2 endAngle:(2*M_PI)/100.0*ratioNumber-M_PI_2 clockwise:YES];
        [path closePath];

        layer_number.strokeColor = HexRGB(0x638AFF).CGColor;
        layer_number.fillColor = HexRGB(0x638AFF).CGColor;
        
        layer_number.shadowColor = HexRGBAlpha(0x638AFF, 0.2).CGColor;
        layer_number.shadowOffset = CGSizeMake(2,2);
        layer_number.shadowRadius = 2;
    }
    else if (ratioType == RatioViewTypeYellow){
        [path moveToPoint:centrePoint];
        [path addArcWithCenter:centrePoint radius:radius startAngle:-M_PI_2 endAngle:(2*M_PI)/100.0*ratioNumber-M_PI_2 clockwise:YES];
        [path closePath];

        layer_number.strokeColor = HexRGB(0xFFA841).CGColor;
        layer_number.fillColor = HexRGB(0xFFA841).CGColor;
        
        layer_number.shadowColor = HexRGBAlpha(0xFFA841, 0.2).CGColor;
        layer_number.shadowOffset = CGSizeMake(2,2);
        layer_number.shadowRadius = 2;
    }
    layer_number.path = path.CGPath;
    [self.layer addSublayer:layer_number];
}
- (void)creatLbl:(CGRect)frame {
    self.lbl_number = [[UILabel alloc] initWithFrame:frame];
    self.lbl_number.numberOfLines = 0;
    self.lbl_number.textAlignment = NSTextAlignmentCenter;
    
    NSString *ratio = [NSString stringWithFormat:@"%.2f",ratioNumber];
    BOOL zero = [[[ratio componentsSeparatedByString:@"."] lastObject] isEqualToString:@"00"];
    if (ratioType == RatioViewTypeRedLine) {
        self.lbl_number.font = [UIFont systemFontOfSize:14];
        self.lbl_number.textColor = HexRGB(0xF26669);
        self.lbl_number.text = [NSString stringWithFormat:@"%@%@\n正确率",zero?[[ratio componentsSeparatedByString:@"."] firstObject]:ratio ,@"%"];
    }
    else if (ratioType == RatioViewTypeYellowLine) {
        self.lbl_number.font = [UIFont systemFontOfSize:11];
        self.lbl_number.textColor = HexRGB(0xFFA841);
        self.lbl_number.text = [NSString stringWithFormat:@"%@%@\n正确率",zero?[[ratio componentsSeparatedByString:@"."] firstObject]:ratio ,@"%"];
    }
    else{
        self.lbl_number.font = [UIFont systemFontOfSize:10];
        self.lbl_number.text = [NSString stringWithFormat:@"正确率%@%@",zero?[[ratio componentsSeparatedByString:@"."] firstObject]:ratio ,@"%"];
        if (ratioType == RatioViewTypeBlue) {
            self.lbl_number.textColor = HexRGB(0x638AFF);
        }
        else if (ratioType == RatioViewTypeYellow){
            self.lbl_number.textColor = HexRGB(0xFFA841);
        }
    }
    [self addSubview:self.lbl_number];
}
@end
