//
//  BaseViewController.m
//  eduaction_app
//
//  Created by legendlxd on 2018/10/22.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
    if (self.navigationController.viewControllers.count>1 && self.navigationItem.leftBarButtonItem==nil) {
        self.leftBtn = [self createNavigationLeftItem:YES andImage:@"top_btn_return" andTitle:@"   "];
    }
}
-(void)setnavbg_defa{
    
     [self.navigationController.navigationBar setBackgroundImage:[CommonFunciton BgImageFromColors:@[HexRGB(0xFF5F5E),HexRGB(0xFC7456),HexRGB(0xFC7855)] withFrame:CGRectMake(0, 0, ZTWidth, NaviIPHONEX) gradientDir:leftToright] forBarMetrics:UIBarMetricsDefault];
}
-(void)setnav_BackBtn{
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame=CGRectMake(0, 0, 44,NaviIPHONEX);
    [back setImage:[UIImage imageNamed:@"top_btn_return"] forState:UIControlStateNormal];
    @weakify(self);
    [[back rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    }];
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:back];
}
- (UIButton *)createNavigationLeftItem:(BOOL)isLeft andImage:(NSString * )imageName andTitle:(NSString * )title
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    if (imageName.length) {
        UIImage *image = [UIImage imageNamed:imageName];
        CGFloat width = [imageName boundingRectWithSize:CGSizeMake(MAXFLOAT, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size.width+4;
        btn.frame = CGRectMake(0, 0, width, 30);
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [btn setImage:image forState:UIControlStateNormal];
        [btn setTitle:title forState:UIControlStateNormal];
        @weakify(self);
        self.leftDis = [[[btn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:self.rac_willDeallocSignal] subscribeNext:^(__kindof UIControl * _Nullable x) {
            @strongify(self);
            [self.navigationController popViewControllerAnimated:YES];
        }];
    }
    else {
        btn.frame = CGRectMake(0, 0, 60, 30);
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:HexRGB(0xFFFFFF) forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
    }
    if (isLeft) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    else{
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    }
    return btn;
}
-(void)setRigthbtn_inNav:(UIImage *)image andtitle:(NSString *)titile{
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
   
    [self.rightBtn addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
   
    if (titile.length > 0) {
        
        [self.rightBtn setTitle:titile forState:UIControlStateNormal];
    }
    if (image != nil) {
        
         [self.rightBtn setImage:image forState:UIControlStateNormal];
    }
     self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    
}
-(void)setNavTitle:(NSString *)title
{
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     
     
     
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       
       
       
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.title = title;
}
-(void)rightAction:(UIButton *)sender{
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
