//
//  searchWithKindVC.m
//  eduaction_app
//
//  Created by legendlxd on 2018/11/19.
//  Copyright © 2018年 diandang. All rights reserved.
//

#import "searchWithKindVC.h"
#import "TopfilteringV.h"
@interface searchWithKindVC ()
@property (strong, nonatomic) searchKindVM *filterVM;
@property (strong, nonatomic) TopfilteringV *topMenu;
@end

@implementation searchWithKindVC
-(TopfilteringV *)topMenu{
    
    if (!_topMenu) {
        
        self.topMenu = [[TopfilteringV alloc]initWithFrame:CGRectMake(0, 0, ZTWidth, ZTHeight - NaviIPHONEX)];
        self.topMenu.viewMode = self.filterVM;
 
        @weakify(self);
        [[[self.topMenu clickIndex] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id  _Nullable x) {
            @strongify(self);
//            if ([x integerValue] == 2) {
//                
//                 ((MyNav *)self.navigationController).interactivePopGestureRecognizer_NO = YES;
//            }
//            else{
//                 ((MyNav *)self.navigationController).interactivePopGestureRecognizer_NO = NO;
//            }
            
        }];
       
        [self.topMenu setfilterV:self_weak_];
        
    }
    return _topMenu;
}
-(void)viewWillAppear:(BOOL)animated{
    
    [self setnavbg_defa];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
   
    
    self.filterVM = [[searchKindVM alloc]init];

    [self.view addSubview:self.topMenu];

    self.view.backgroundColor =  HexRGB(0xF1F0F0);
    @weakify(self);
    [self.leftDis dispose];
    [[[self.leftBtn rac_signalForControlEvents:UIControlEventTouchUpInside]takeUntil:self.rac_willDeallocSignal] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        if (self.topMenu.selectTopindex == 2) {
          
            [self.topMenu tapGesture];
            [self.topMenu.filterController dismiss:^{
                  @strongify(self);
                  self.topMenu.selectTopindex = 0;
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    @strongify(self);
                    [self.navigationController popViewControllerAnimated:YES];
                });
                
            }];
        }
        else{
             [self.navigationController popViewControllerAnimated:YES];
        }
        
    }];

    
    // Do any additional setup after loading the view.
}
-(void)dealloc{
    
    
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
