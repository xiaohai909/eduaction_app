//
//  MySearchBar.m
//  LTExchangeRate
//
//  Created by legendlxd on 15/8/1.
//  Copyright (c) 2015年 administrator. All rights reserved.
//

#import "MySearchBar.h"

@implementation MySearchBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)layoutSubviews{
 [super layoutSubviews];
    
    for(NSInteger i =0; i<[[[self.subviews objectAtIndex:0] subviews] count]; i++) {
        if([[[[self.subviews objectAtIndex:0] subviews] objectAtIndex:i] isKindOfClass:[UITextField class]])
        {
            //            [[[(UITextField*)[sBar.subviews objectAtIndex:0] subviews] objectAtIndex:i] setFont:[UIFont fontWithName:@"CustomFont" size:15]];
            UITextField* search=[[(UITextField*)[self.subviews objectAtIndex:0]subviews] objectAtIndex:i];
            //search.delegate = self;
            search.backgroundColor=HexRGB(0xffffff);
            search.textColor=[UIColor blackColor];
            if(_isKindSearch==NO){
            search.frame=CGRectMake(10, NaviIPHONEX - 36, ZTWidth-10-52.5, 28);
            }
            else{
            search.frame=CGRectMake(52.5, NaviIPHONEX - 36, ZTWidth-105, 28);
            }
            search.font=[UIFont systemFontOfSize:14];
            search.tintColor=HexRGB(0xe24548);
            search.placeholder=@"搜索你喜欢的……";
            search.text=self.Keyword;
            search.delegate=self;
            //[[[(UITextField*)[self.sBar.subviews objectAtIndex:0] subviews] objectAtIndex:i] setInputView:MyKeyboard];
        }
    }
    
    
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    _CancelBtn.enabled=NO;
    return YES;
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    _CancelBtn.enabled=YES;
    return YES;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if([super initWithFrame:frame]){
        
        _CancelBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _CancelBtn.frame=CGRectMake(ZTWidth-48, NaviIPHONEX - 44, 48 , 44);
        [_CancelBtn setTitleColor:HexRGB(0xFFFFFF) forState:UIControlStateNormal];
//        [_CancelBtn setTitleColor:HexRGB(0x157efb) forState:UIControlStateDisabled];
        [_CancelBtn setTitle:@"搜索" forState:UIControlStateNormal];
        [_CancelBtn setTitle:@"取消" forState:UIControlStateSelected];
        [_CancelBtn addTarget:self action:@selector(GoBackView:) forControlEvents:UIControlEventTouchUpInside];
        _CancelBtn.titleLabel.font=[UIFont systemFontOfSize:17];
        [_CancelBtn setExclusiveTouch:YES];
        
        [_CancelBtn setBackgroundColor:[UIColor clearColor]];
        //[_CancelBtn imageRectForContentRect:CGRectMake(22, 0, 22, 44) ];
        [self addSubview:_CancelBtn];
        
        _BackBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _BackBtn.frame=CGRectMake(5, NaviIPHONEX-44, 48, 44);
        [_BackBtn setImage:[UIImage imageNamed:@"top_btn_return"] forState:UIControlStateNormal];
        //[_BackBtn setBackgroundColor:[UIColor blackColor]];
        [_BackBtn addTarget:self action:@selector(GoBackView:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_BackBtn];
        [_Bage setExclusiveTouch:YES];
        
        
        _ShopCartBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _ShopCartBtn.frame=CGRectMake(ZTWidth-15-22, 0, 22, 44);
        //[_ShopCartBtn imageRectForContentRect:CGRectMake(22, 0, 22, 44)];
        [_ShopCartBtn setImage:[UIImage imageNamed:@"SearchCartIcon"] forState:UIControlStateNormal];
        _ShopCartBtn.hidden=YES;
        //_ShopCartBtn.backgroundColor=[UIColor blackColor];
        //[_ShopCartBtn addTarget:self action:@selector(GoAddShop:) forControlEvents:UIControlEventTouchUpInside];
        
        _ShopCartClickBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _ShopCartClickBtn.frame=CGRectMake(ZTWidth-49, 0, 44, 43);
        _ShopCartClickBtn.backgroundColor=[UIColor clearColor];
        _ShopCartClickBtn.hidden=YES;
        [_ShopCartClickBtn addTarget:self action:@selector(GoAddShop:) forControlEvents:UIControlEventTouchUpInside];
        [_ShopCartClickBtn setExclusiveTouch:YES];
        
        _Bage=[[UIView alloc]initWithFrame:CGRectMake(_ShopCartBtn.imageView.frame.origin.x+_ShopCartBtn.imageView.frame.size.width-13, _ShopCartBtn.imageView.frame.origin.y, 14, 14)];
        _Bage.layer.masksToBounds=YES;
        _Bage.layer.cornerRadius=7;
        _Bage.backgroundColor=HexRGB(0xf7f7f8);
        
        
        
        
        
        
       
        
        self.BagView=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 11, 11)];
        self.BagView.layer.cornerRadius=5.5;
        self.BagView.layer.masksToBounds=YES;
        self.BagView.center=CGPointMake(7, 7);
        self.BagView.font=[UIFont systemFontOfSize:10];
        self.BagView.textColor=[UIColor whiteColor];
        self.BagView.text=@"";
        self.BagView.textAlignment=NSTextAlignmentCenter;
        self.BagView.backgroundColor=HexRGB(0xff5252);
        //[_ShopCartBtn addSubview:self.BagView];
        
        //self.BagView.hidden=YES;
        [_Bage addSubview:self.BagView];
        [_ShopCartBtn addSubview:_Bage];
        self.Bage.hidden=YES;
//        [_ShopCartBtn addSubview:ShopCartClickBtn];
        
        
        [self addSubview:_ShopCartBtn];
        [self addSubview:_ShopCartClickBtn];
    }
    return self;
}
-(void)GoBackView:(UIButton *)btn{
    
    
    if(btn==_BackBtn){
        
        [self.Mydelaget ClickBackBtn:btn];
    }
    else
    {
        [self.Mydelaget ClickCancelBtn:btn];
    }
}
-(void)GoAddShop:(UIButton *)btn{
    [self.Mydelaget ClickCartBtn:btn];
    
}
-(UITextField *)GetSearchTextFiled{
    for(NSInteger i =0; i<[[[self.subviews objectAtIndex:0] subviews] count]; i++) {
        if([[[[self.subviews objectAtIndex:0] subviews] objectAtIndex:i] isKindOfClass:[UITextField class]])
        {
            //            [[[(UITextField*)[sBar.subviews objectAtIndex:0] subviews] objectAtIndex:i] setFont:[UIFont fontWithName:@"CustomFont" size:15]];
            UITextField* search=[[(UITextField*)[self.subviews objectAtIndex:0]subviews] objectAtIndex:i];
            return search;
            
            //[[[(UITextField*)[self.sBar.subviews objectAtIndex:0] subviews] objectAtIndex:i] setInputView:MyKeyboard];
        }
    }
    return nil;
}
-(void)SetBagNumber:(NSInteger )numb{
    if(numb>0){
        self.Bage.hidden=NO;
        if(numb>999){
            numb=999;
        }
        NSString *numbStr=[NSString stringWithFormat:@"%@",@(numb)];
        CGSize numSize=[numbStr boundingRectWithSize:CGSizeMake(MAXFLOAT, 14) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10]} context:nil].size;
        
        if(numb>=10&&numb<100){
            self.BagView.frame=CGRectMake(0,  0, numSize.width+4, 11);
            self.Bage.frame=CGRectMake(self.Bage.frame.origin.x, self.Bage.frame.origin.y, numSize.width+4+3, 14);
            self.BagView.center=CGPointMake(self.Bage.frame.size.width/2.0, 7);
            
        }
        else if (numb>=100){
            
            self.BagView.frame=CGRectMake(0,  0, numSize.width+4, 11);
            self.Bage.frame=CGRectMake(self.Bage.frame.origin.x, self.Bage.frame.origin.y, numSize.width+4+3, 14);
            self.BagView.center=CGPointMake(self.Bage.frame.size.width/2.0, 7);
            
        }
        else{
            self.BagView.frame=CGRectMake(self.BagView.frame.origin.x, self.BagView.frame.origin.y, 11, 11);
            
            self.Bage.frame=CGRectMake(self.Bage.frame.origin.x,  self.Bage.frame.origin.y, 14, 14);
            
            
        }
        self.BagView.text=[NSString stringWithFormat:@"%@",@(numb)];
        
    }
    else{
        // self.BagView.hidden=YES;
        self.Bage.hidden=YES;
    }
}
@end
